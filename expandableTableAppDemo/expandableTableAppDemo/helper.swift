//
//  helper.swift
//  expandableTableAppDemo
//
//  Created by iMac on 12/09/22.
//

import Foundation
import UIKit

struct ItemList {
var name: String
var items: [String]
var collapsed: Bool

init(name: String, items: [String], collapsed: Bool = false) {
   self.name = name
   self.items = items
   self.collapsed = collapsed
   }
}


