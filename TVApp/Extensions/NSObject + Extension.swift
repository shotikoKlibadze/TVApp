//
//  NSObject + Extension.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 21.02.23.
//

import Foundation

extension NSObject {
    static func getClassName() -> String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
