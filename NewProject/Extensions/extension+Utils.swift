//
//  extension+Utils.swift
//  NewProject
//
//  Created by user on 7/4/19.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
