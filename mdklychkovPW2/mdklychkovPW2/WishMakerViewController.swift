//
//  WishMakerViewController.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 29.10.2024.
//

import UIKit

final class WishMakerViewController: UIViewController {
    private let titleView = UILabel()
    private let descriptionView = UILabel()
    private let sliderStackView = UIStackView()
    
    enum Constants {
        static let viewTitle: String = "WishMaker"
        static let viewDescription: String = "This app will bring you joy and and will fulfill your wishes!\n\nThe slider will change the color of the background."
        
        static let sliderMin: Double = 0
        static let sliderMax: Double = 1
        static let redLabel: String = "Red"
        static let greenLabel: String = "Green"
        static let blueLabel: String = "Blue"
        static let stackRadius: CGFloat = 20
        static let stackBottom: CGFloat = -40
        static let stackLeading: CGFloat = 20
        static let alphaDefaultVaalue: CGFloat = 1
    }
        
    private func configureUI() {
        configureTitle()
        configurateDescription()
        configurateSlider()
    }
    
    private func configureTitle() {
        titleView.text = Constants.viewTitle
        titleView.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        titleView.textColor = .white
        
        
        view.addSubview(titleView)
        titleView.pinCenterX(to: view)
        titleView.pinTop(to: view.safeAreaLayoutGuide.topAnchor, 20)
    }
    
    private func configurateDescription() {
        descriptionView.text = Constants.viewDescription
        descriptionView.lineBreakMode = NSLineBreakMode.byWordWrapping
        descriptionView.numberOfLines = 0 // word wrapping
        descriptionView.textColor = .white
        
        view.addSubview(descriptionView)
        descriptionView.pinCenterX(to: view)
        descriptionView.pinHorizontal(to: view, 20)
        descriptionView.pinTop(to: titleView.bottomAnchor, 20)
    }
    
    private func configurateSlider() {
        sliderStackView.axis = .vertical
        view.addSubview(sliderStackView)
        
        sliderStackView.layer.cornerRadius = Constants.stackRadius
        sliderStackView.clipsToBounds = true
        
        let sliderRed = CustomSlider(title: Constants.redLabel, min: Constants.sliderMin, max: Constants.sliderMax)
        let sliderGreen = CustomSlider(title: Constants.greenLabel, min: Constants.sliderMin, max: Constants.sliderMax)
        let sliderBlue = CustomSlider(title: Constants.blueLabel, min: Constants.sliderMin, max: Constants.sliderMax)
        for slider in [sliderRed, sliderGreen, sliderBlue] {
            sliderStackView.addArrangedSubview(slider)
        }
        
        sliderStackView.pinBottom(to: view, -1 * Constants.stackBottom)
        sliderStackView.pinHorizontal(to: view, Constants.stackLeading)
        
        sliderRed.valueChanged = { [weak self] value in
            self?.view.backgroundColor = UIColor(red: value,
                                                 green: CGFloat(sliderGreen.slider.value),
                                                 blue: CGFloat(sliderBlue.slider.value),
                                                 alpha: Constants.alphaDefaultVaalue)
        }
        
        sliderGreen.valueChanged = { [weak self] value in
            self?.view.backgroundColor = UIColor(red: CGFloat(sliderRed.slider.value),
                                                 green: value,
                                                 blue: CGFloat(sliderBlue.slider.value),
                                                 alpha: Constants.alphaDefaultVaalue)
        }
        
        sliderBlue.valueChanged = { [weak self] value in
            self?.view.backgroundColor = UIColor(red: CGFloat(sliderRed.slider.value),
                                                 green: CGFloat(sliderGreen.slider.value),
                                                 blue: value,
                                                 alpha: Constants.alphaDefaultVaalue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}
