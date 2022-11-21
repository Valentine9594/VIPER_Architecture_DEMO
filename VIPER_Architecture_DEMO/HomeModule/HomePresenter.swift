//
//  HomePresenter.swift
//  ViperDemo
//
//  Created by Apple on 15/11/22.
//

import Foundation
import UIKit

protocol HomePresenterToInteractor {
    var storiesCount: Int { get }
    func fetchStoriesFromAPI()
    func getItemAt(index: Int) -> User?
}

protocol HomeInteratorToPresenter: AnyObject {
    func dataFetchedSuccessfully()
    func dataFetchedFailed(error: Error?)
}

protocol ToViewController {
    //    func showAlert()
}

extension ToViewController {
    func showAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(alertAction)
        
        DispatchQueue.main.async {
            (self as? UIViewController)?.present(alertController, animated: true)
        }
    }
}

protocol HomePresenterToViewController: AnyObject, ToViewController {
    func reloadData()
}

protocol HomeViewControllerToPresenter {
    var storiesCount: Int { get }
    
    func showListController()
    func fetchStories()
    func getItemAt(index: Int) -> User?
}

protocol HomePresenterToRouter {
    func pushToNextController()
}

final class HomePresenter: HomeInteratorToPresenter {
    
    func dataFetchedSuccessfully() {
        view?.reloadData()
    }
    
    func dataFetchedFailed(error: Error?) {
        if let error = error {
            view?.showAlert(title: "Danger!", message: error.localizedDescription)
        }
    }
    
    var interactor: HomePresenterToInteractor?
    weak var view: HomePresenterToViewController?
    var router: HomePresenterToRouter?
    
    var storiesCount: Int {
        return interactor?.storiesCount ?? 0
    }
    
    func showListController() {
        router?.pushToNextController()
    }
}

extension HomePresenter: HomeViewControllerToPresenter {
    
    func fetchStories() {
        interactor?.fetchStoriesFromAPI()
    }
    
    func getItemAt(index: Int) -> User? {
        return interactor?.getItemAt(index: index)
    }
    
}
