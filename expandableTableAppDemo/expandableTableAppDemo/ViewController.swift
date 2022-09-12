//
//  ViewController.swift
//  expandableTableAppDemo
//
//  Created by iMac on 12/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViwExpond: UITableView!
    
    //    var sections = [ItemList]()
    
    var items: [ItemList] = [
        ItemList(name: "MacBooks", items: ["MacBook Air (M1, 2020", "MacBook Air (M2, 2022)","MacBook Pro (13-inch)","MacBook Pro (14-inch)","MacBook Pro (16-inch)"]),
        ItemList(name: "iPads", items: ["iPad Pro", "iPad Air 2"]),
        ItemList(name: "iPhone", items: ["iPhone 6 / 6 Plus","iPhone 7 / 7 Plus","iPhone 8 / 8 Plus","iPhone X","iPhone 11","iPhone 12 / 12 Mini","iPhone 12 Pro / 12 Pro Max","iPhone 13 / 13 Mini","iPhone 13 Pro / 13 Pro Max","iPhone 14 / 14 Plus", "iPhone 14 Pro / 14 Pro Max"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerCell()
    }
    
//    @objc func rightSwipwButtonTapped(_ sender:UIButton){
//        /*
//         guard let remarkVC = StoryBoard.instantiateViewController(withIdentifier: "remarkViewController") as? remarkViewController else{
//             return
//         }
//         let selectedIndex = IndexPath(row: sender.tag, section: 0)
//         myTableView.selectRow(at: selectedIndex, animated: true, scrollPosition: .none)
//         let selectedCell = myTableView.cellForRow(at: selectedIndex) as! queryTableViewCell1
//
//         remarkVC.getQueryTitle = selectedCell.labelqueryTitle.text
//         remarkVC.getQueryDescription = selectedCell.labelqueryDescription.text
//
//         let BottomSheetController = BottomSheetController(contentViewController: remarkVC)
//         BottomSheetController.backgroundColor = UIColor.black.withAlphaComponent(0.5)
//         present(BottomSheetController, animated: true, completion: nil)
//         */
//
//        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailsViewController") as? detailsViewController else{
//            return
//        }
//        let selectedIndex = IndexPath(row: sender.tag, section: 0)
//    }
}


//MARK: - Tableview Delegate and Datasource Method
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func registerCell(){
        self.tableViwExpond.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
        let headerHeading = UILabel(frame: CGRect(x: 10, y: 10, width: headerView.frame.width - 10, height: headerView.frame.height - 20))
        let imageView = UIImageView(frame: CGRect(x: self.view.frame.width - 30, y: 20, width: 20, height: 20))
        
        if items[section].collapsed{
            imageView.image = UIImage(named: "collapsed")
        }else{
            imageView.image = UIImage(named: "expand")
        }
        
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(headerViewTapped))
        tapGuesture.numberOfTapsRequired = 1
        headerView.addGestureRecognizer(tapGuesture)
        headerView.backgroundColor = .black
        headerView.tag = section
        headerHeading.text = items[section].name
        headerHeading.textColor = .white
        headerView.addSubview(headerHeading)
        headerView.addSubview(imageView)
        self.view.addSubview(headerView)
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let itms = items[section]
        return !itms.collapsed ? 0 : itms.items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViwExpond.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {return .init()}
        cell.labelForData.text = items[indexPath.section].items[indexPath.row]
//        cell.buttonRightSwipe.tag = indexPath.row
//        cell.buttonRightSwipe.addTarget(self, action: #selector(rightSwipwButtonTapped(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func headerViewTapped(tapped:UITapGestureRecognizer){
        print(tapped.view?.tag)
        if items[tapped.view!.tag].collapsed == true{
            items[tapped.view!.tag].collapsed = false
        }else{
            items[tapped.view!.tag].collapsed = true
        }
        if let imageView = tapped.view?.subviews[1] as? UIImageView{
            if imageView.isKind(of: UIImageView.self){
                if items[tapped.view!.tag].collapsed{
                    imageView.image = UIImage(named: "collapsed")
                }else{
                    imageView.image = UIImage(named: "expand")
                }
            }
        }
        
        
        
        tableViwExpond.reloadData()
    }
    
}
