//
//  Interactor.swift
//  SVIP
//
//  Created by Maksim Klychkov on 22.10.2024.
//

final class Interactor: BuisnessLogic {
    private let presenter: PresentaionLogic
    
    init(presenter: PresentaionLogic) {
        self.presenter = presenter
    }
    
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response())
    }
    
    func loadOther(_ request: Model.Other.Request) {
        presenter.presentOther(Model.Other.Response())
    }
}
