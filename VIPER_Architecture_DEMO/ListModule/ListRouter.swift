//
//  ListRouter.swift
//  ViperDemo
//
//  Created by Apple on 15/11/22.
//

import Foundation
import UIKit

class ListRouter: ListPresenterToRouter {
    
    static func createListModule() -> ListViewController {
        
        let view = ListViewController()
        let presenter = ListPresenter()
        let interactor = ListInteractor()
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = ListRouter()
        
        interactor.presenter = presenter
        
        view.listPresenter = presenter
        
        return view
    }
    
    func pushToNextController(navigationController: UINavigationController) {
//        let listModule = ListRouter.createListModule()
//        navigationController.pushViewController(listModule, animated: true)
    }
    
    func backToCurrentController(navigationController: UINavigationController) {
        
    }
}
