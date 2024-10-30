//
//  UIColor+Random.swift
//  mdklychkovPW1
//
//  Created by Maksim Klychkov on 15.10.2024.
//

import UIKit

extension UIColor {
    // MARK: - Constants
    private enum Constants {
        static let hexColorBinaryExp: Int = 24
        static let colorParameterCount: Int = 256
        static let defaultAlpha: Double = 1.0
    }
    
    // MARK: - Static Variables
    static var random: UIColor {
        // hex color is a number #______
        // need to generate an hex integer (from 0 to (16^6 - 1))
        // 16^6 = (2^4)^6 = 2^24 = 1 << 24
        var intColor = Int.random(in: 0...(1 << Constants.hexColorBinaryExp))
        
        // need to parse it into r, g, b segments, from (0 to 16^2 - 1) each
        let red: Double = Double(intColor % Constants.colorParameterCount) / Double(Constants.colorParameterCount - 1)
        intColor /= Constants.colorParameterCount
        let green: Double = Double(intColor % Constants.colorParameterCount) / Double(Constants.colorParameterCount - 1)
        intColor /= Constants.colorParameterCount
        let blue: Double = Double(intColor % Constants.colorParameterCount) / Double(Constants.colorParameterCount - 1)
        
        return UIColor(red: red,
                       green: green,
                       blue: blue,
                       alpha: Constants.defaultAlpha)
    }
}
