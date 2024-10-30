//
//  CustomSlider.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 29.10.2024.
//

import UIKit

final class CustomSlider: UIView {
    var valueChanged: ((Double) -> Void)?
    
    let slider = UISlider()
    let titleView = UILabel()
    
    init(title: String, min: Double, max: Double) {
        super.init(frame: .zero)
        titleView.text = title
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        for view in [slider, titleView] {
            addSubview(view)
        }
        
        titleView.pinCenterX(to: self.centerXAnchor)
        titleView.pinTop(to: self.topAnchor, 10)
        titleView.pinLeft(to: self.leadingAnchor, 20)
        
        slider.pinTop(to: titleView.bottomAnchor)
        slider.pinCenterX(to: self.centerXAnchor)
        slider.pinBottom(to: self.bottomAnchor, 10)
        slider.pinLeft(to: self.leadingAnchor, 20)
    }
    
    @objc
    private func sliderValueChanged() {
        valueChanged?(Double(slider.value))
    }
}
