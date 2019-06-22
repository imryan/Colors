//
//  Palette.swift
//  Colors
//
//  Created by Ryan Cohen on 4/11/18.
//

import Foundation

public class Palette: Codable, CustomStringConvertible {
    
    // MARK: - Attributes
    
    /// Color palette identifier (e.g. '57cad90de956653b3248cfda')
    public let id: String?
    
    /// Array of 5 hex color code strings (e.g. ['#cc4444', '#f9f2f2', ...])
    public let colors: [String]?
    
    /// `UIColor` values for hex color codes
    public var colorValues: [UIColor] {
        var mutableColorCodes: [UIColor] = []
        
        colors?.forEach({ (code) in
            let colorCode = code.replacingOccurrences(of: "#", with: "0x")
            if let rgbValue = UInt(String(colorCode.suffix(6)), radix: 16) {
                let color = UIColorFromRGB(rgb: rgbValue)
                mutableColorCodes.append(color)
            }
        })
        
        return mutableColorCodes
    }
    
    /// Object pretty printed description
    public var description: String {
        return "Palette\nID: \(id ?? "None")\nColors: \(colors ?? [])"
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case colors = "colors"
    }
    
    // MARK: - Helpers
    
    public func UIColorFromRGB(rgb: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0))
    }
}
