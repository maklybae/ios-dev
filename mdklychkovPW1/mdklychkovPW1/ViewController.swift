//
//  ViewController.swift
//  mdklychkovPW1
//
//  Created by Maksim Klychkov on 15.10.2024.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Constants
    private enum Constants {
        static let animationDuration: Double = 1
        static let cornerRadiusMin: Double = 0
        static let cornerRadiusMax: Double = 100
    }
    
    // MARK: - Varibales
    @IBOutlet var views: [UIView]!
    @IBOutlet weak var button: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        changeRandomColors()
    }
    
    // MARK: - Actions
    @IBAction func buttonWasPressed(_ sender: Any) {
        self.button.isEnabled = false
        UIView.animate(withDuration: Constants.animationDuration, animations: {
            self.changeRandomColors()
        }, completion: { [weak self] _ in
            self?.button.isEnabled = true
        })
    }
    
    // MARK: - Private funcs
    private func changeRandomColors() {
        let backgroundColor = UIColor.random
        view.backgroundColor = backgroundColor
        self.changeRandomViewsColors(prohibitColors: [backgroundColor])
        self.changeRandomViewsRadius()
    }
    
    private func changeRandomViewsColors(prohibitColors: Set<UIColor>? = nil) {
        let colors = getRandomUniqueColors(countColors: views.count, prohibitColors: prohibitColors)
        for (index, view) in views.enumerated() {
            view.backgroundColor = colors[index]
        }
    }
    
    private func changeRandomViewsRadius() {
        for view in views {
            view.layer.cornerRadius = .random(in: Constants.cornerRadiusMin...Constants.cornerRadiusMax)
        }
    }
    
    private func getRandomUniqueColors(countColors: Int, prohibitColors: Set<UIColor>? = nil) -> Array<UIColor> {
        var colors = Set<UIColor>()
        
        while colors.count < countColors {
            let randomColor = UIColor.random
            if let prohibitColors = prohibitColors, prohibitColors.contains(randomColor) {
                continue
            }
            colors.insert(randomColor)
        }
        
        return Array(colors)
    }
}

