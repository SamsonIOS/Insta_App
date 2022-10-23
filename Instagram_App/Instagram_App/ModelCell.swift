//
//  Model.swift
//  Instagram_App
//
//  Created by coder on 23.10.2022.
//

import Foundation

/// структура для передачи информации в ячейки
struct Info {
    var nickname: String
    var comment: String
    var userImageName: String
    var contentImageName: String
    var isFollow: Bool?
    var time: String
}
