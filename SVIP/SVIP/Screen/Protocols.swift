//
//  Protocols.swift
//  SVIP
//
//  Created by Maksim Klychkov on 22.10.2024.
//

protocol BuisnessLogic {
    func loadStart(_ request: Model.Start.Request)
    func loadOther(_ request: Model.Other.Request)
}

protocol PresentaionLogic {
    func presentStart(_ response: Model.Start.Response)
    func presentOther(_ response: Model.Other.Response)
    
    func routeTo()
}
