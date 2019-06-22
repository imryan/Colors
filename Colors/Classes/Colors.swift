//
//  Colors.swift
//  Colors
//
//  Created by Ryan Cohen on 4/11/18.
//

import Foundation

public class Colors {
    
    // MARK: - Attributes
    
    /// API base URL
    private static let API_URL = URL(string: "https://klart.io/api/colors")!
    
    // MARK: - Functions
    
    /// Fetch all color palettes as an array of `Palette` objects
    ///
    /// - Parameter completion: Optional array of `Palette` objects containing an identifier and hex color code array.
    public static func fetchPalettes(completion: @escaping (_ palettes: [Palette]?) -> ()) {
        URLSession.shared.dataTask(with: API_URL) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let palettes = try? JSONDecoder().decode([Palette].self, from: data)
            completion(palettes)
            
        }.resume()
    }
    
    /// Fetch single `Palette` object by its identifier
    ///
    /// - Parameters:
    ///   - id: `Palette` object identifier.
    ///   - completion: Optional `Palette` object.
    public static func fetchPalette(withId id: String, completion: @escaping (_ palette: Palette?) -> ()) {
        fetchPalettes { (palettes) in
            guard let palettes = palettes else {
                completion(nil)
                return
            }
            
            completion(palettes.first(where: { $0.id == id }))
        }
    }
}
