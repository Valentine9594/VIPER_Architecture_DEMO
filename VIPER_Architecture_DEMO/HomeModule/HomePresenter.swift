//
//  HomePresenter.swift
//  ViperDemo
//
//  Created by Apple on 15/11/22.
//

import Foundation
import UIKit

protocol HomePresenterToInteractor {
    var stories: [DataStory]? { get }
    func fetchStoriesFromAPI()
}

protocol HomeInteratorToPresenter {
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

protocol HomePresenterToViewController: ToViewController {
    func reloadData()
}

protocol HomeViewControllerToPresenter {
    func showListController()
    func fetchStories()
    func getTotalCount() -> Int
    func getItemAt(index: Int) -> DataStory?
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
    var view: HomePresenterToViewController?
    var router: HomePresenterToRouter?
    
    var stories: [DataStory]? {
        return interactor?.stories
    }
    
    func showListController() {
        router?.pushToNextController()
    }
}

extension HomePresenter: HomeViewControllerToPresenter {
    func fetchStories() {
        interactor?.fetchStoriesFromAPI()
    }
    
    func getItemAt(index: Int) -> DataStory? {
        return stories?[index]
    }
    
    func getTotalCount() -> Int {
        return stories?.count ?? 0
    }
}
