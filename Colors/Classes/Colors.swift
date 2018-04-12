//
//  Colors.swift
//  Colors
//
//  Created by Ryan Cohen on 4/11/18.
//

import Foundation

open class Colors {
    
    // MARK: - Attributes
    
    /// API base URL
    private static let API_URL = "https://klart.io/api/colors"
    
    // MARK: - Functions
    
    /// Fetch all color palettes as an array of `Palette` objects
    ///
    /// - Parameter completion: Optional array of `Palette` objects containing an identifier and hex color code array.
    open static func fetchPalettes(completion: @escaping (_ palettes: [Palette]?) -> ()) {
        URLSession.shared.dataTask(with: URL(string: API_URL)!) { (data, response, error) in
            guard let data = data, error == nil else { return }
            
            if let palettes = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String : Any]] {
                var mutablePalettes: [Palette] = []
                for palette in palettes {
                    if let palette = try? JSONDecoder().decode(Palette.self, from: JSONSerialization.data(withJSONObject: palette, options: [])) {
                        mutablePalettes.append(palette)
                    }
                }
                
                completion(mutablePalettes)
                return
            }
            completion(nil)
            
        }.resume()
    }
    
    /// Fetch single `Palette` object by its identifier
    ///
    /// - Parameters:
    ///   - id: `Palette` object identifier.
    ///   - completion: Optional `Palette` object.
    open static func fetchPalette(withId id: String, completion: @escaping (_ palette: Palette?) -> ()) {
        fetchPalettes { (palettes) in
            if let palettes = palettes {
                if let match = palettes.first(where: { $0.id == id }) {
                    completion(match)
                }
            }
        }
    }
}
