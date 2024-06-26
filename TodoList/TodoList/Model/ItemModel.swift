//
//  ItemModel.swift
//  TodoList
//
//  Created by 허예은 on 6/26/24.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
