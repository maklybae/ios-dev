//
//  ViewController.swift
//  SVIP
//
//  Created by Maksim Klychkov on 22.10.2024.
//

import UIKit

class ViewController: UIViewController {
    private let button = UIButton(type: .system)
    private let interactor: BuisnessLogic
    
    init(interactor: BuisnessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor.loadStart(Model.Start.Request())
    }
    
    func setupUI() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.backgroundColor = .green
    }

    func displayStart() {
        button.backgroundColor = .white
    }
    
    func displayOther() {
        
    }
}

