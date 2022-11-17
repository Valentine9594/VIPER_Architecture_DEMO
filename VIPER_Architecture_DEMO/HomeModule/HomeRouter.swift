//
//  HomeRouter.swift
//  ViperDemo
//
//  Created by Apple on 15/11/22.
//

import Foundation

class HomeRouter: HomePresenterToRouter {
    
    weak var scene: HomeViewController?
    
    func createModule() -> HomeViewController {
        let view = HomeViewController()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = self
        
        interactor.presenter = presenter
        
        view.presenter = presenter
        scene = view
        return view
    }
    
    func pushToNextController() {
        let listModule = ListRouter.createListModule()
        scene?.navigationController?.pushViewController(listModule, animated: true)
    }
    
    func backToCurrentController() {
        scene?.navigationController?.popViewController(animated: true)
    }
}
