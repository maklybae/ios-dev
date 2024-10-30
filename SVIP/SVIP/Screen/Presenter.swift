//
//  Presenter.swift
//  SVIP
//
//  Created by Maksim Klychkov on 22.10.2024.
//

import UIKit

final class Presenter: PresentaionLogic {
    weak var view: ViewController?
    
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart()
    }
    
    func presentOther(_ response: Model.Other.Response) {
        view?.displayOther()
    }
    
    func routeTo() {
        view?.navigationController?.pushViewController(UIViewController(), animated: true)
    }
    
    
}
