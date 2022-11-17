//
//  ListPresenter.swift
//  ViperDemo
//
//  Created by Apple on 15/11/22.
//

import Foundation

protocol ListPresenterToInteractor {
    func fetchImagesFromAPI()
    var imgs: [DataStory]? { get }
}

protocol ListInteratorToPresenter {
    func dataFetchedFailed(error: Error?)
    func dataFetchedSuccessfully()
}

protocol ListPresenterToViewController: ToViewController {
    func reloadData()
}

protocol ListViewControllerToPresenter {
    func fetchImages()
    func getItemAt() -> [DataStory]?
}

protocol ListPresenterToRouter {
    
}

final class ListPresenter: ListInteratorToPresenter {

    
    var interactor: ListPresenterToInteractor?
    var view: ListPresenterToViewController?
    var router: ListPresenterToRouter?

    func dataFetchedSuccessfully(){
        view?.reloadData()
    }
    func dataFetchedFailed(error: Error?) {
        view?.showAlert(title: "Danger!", message: "Data not available :(")
    }
}

extension ListPresenter: ListViewControllerToPresenter {
    func fetchImages() {
        interactor?.fetchImagesFromAPI()
    }
    
    func getItemAt() -> [DataStory]? {
        return interactor?.imgs
    }
}
