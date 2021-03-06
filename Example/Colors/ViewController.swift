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
    
    @IBOutlet weak var colorsStackView: UIStackView!
    
    // MARK: - Attributes
    
    private var palettes: [Palette] = []
    private var isAnimating: Bool = false
    
    // MARK: - Functions
    
    @objc private func fetchAndAnimateAllPalettes() {
        isAnimating = true
        
        // Fetch all color palettes
        Colors.fetchPalettes { (palettes) in
            if let palettes = palettes {
                self.palettes = palettes
                
                palettes.forEach({ (palette) in
                    if self.isAnimating {
                        Thread.sleep(forTimeInterval: 0.2)
                        self.animateColors(withPalette: palette)
                    }
                })
            }
        }
    }
    
    @objc private func fetchAndAnimateRandomPalette() {
        isAnimating = false
        
        if !palettes.isEmpty {
            let index = Int(arc4random_uniform(UInt32(palettes.count)))
            let randomPalette = palettes[index]
            
            animateColors(withPalette: randomPalette)
        } else {
            Colors.fetchPalettes { (palettes) in
                if let palettes = palettes {
                    self.palettes = palettes
                    self.fetchAndAnimateRandomPalette()
                }
            }
        }
    }
    
    // MARK: - UI
    
    private func setupUI() {
        self.title = "Colors"
        
        let allBarItem = UIBarButtonItem(title: "All", style: .plain, target: self, action: #selector(fetchAndAnimateAllPalettes))
        let randomBarItem = UIBarButtonItem(title: "Random", style: .plain, target: self, action: #selector(fetchAndAnimateRandomPalette))
        
        self.navigationItem.leftBarButtonItem = allBarItem
        self.navigationItem.rightBarButtonItem = randomBarItem
    }
    
    private func animateColors(withPalette palette: Palette) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, animations: {
                for (index, color) in palette.colorValues.enumerated() {
                    self.colorsStackView.subviews[index].backgroundColor = color
                }
            })
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
