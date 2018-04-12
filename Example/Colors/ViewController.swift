//
//  ViewController.swift
//  Colors
//
//  Created by Ryan Cohen on 04/11/2018.
//  Copyright (c) 2018 Ryan Cohen. All rights reserved.
//

import UIKit
import Colors

class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet var colorViews: [UIView]!
    
    // MARK: - Functions
    
    private func fetchAndAnimateAllPalettes() {
        // Fetch all color palettes
        Colors.fetchPalettes { (palettes) in
            if let palettes = palettes {
                palettes.forEach({ (palette) in
                    Thread.sleep(forTimeInterval: 0.2)
                    self.animateColors(withPalette: palette)
                })
            }
        }
    }
    
    private func fetchAndAnimateSinglePalette() {
        // Fetch one color palette
        Colors.fetchPalette(withId: "57cad90de956653b3248cfdb") { (palette) in
            if let palette = palette {
                self.animateColors(withPalette: palette)
            }
        }
    }
    
    // MARK: - UI
    
    private func animateColors(withPalette palette: Palette) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, animations: {
                self.colorViews[0].backgroundColor = palette.colorValues[0]
                self.colorViews[1].backgroundColor = palette.colorValues[1]
                self.colorViews[2].backgroundColor = palette.colorValues[2]
                self.colorViews[3].backgroundColor = palette.colorValues[3]
                self.colorViews[4].backgroundColor = palette.colorValues[4]
            })
        }
    }
    
    // MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fetchAndAnimateSinglePalette()
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchAndAnimateAllPalettes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
