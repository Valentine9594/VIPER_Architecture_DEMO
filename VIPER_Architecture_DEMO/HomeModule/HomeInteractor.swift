//
//  HomeInteractor.swift
//  ViperDemo
//
//  Created by Apple on 15/11/22.
//

import Foundation

final class HomeInteractor: HomePresenterToInteractor {
    
    weak var presenter: HomeInteratorToPresenter?
    var stories: UserData?
    var storiesCount: Int {
        return stories?.count ?? 0
    }
    
    func getItemAt(index: Int) -> User? {
        return stories?[index]
    }
    
    func fetchStoriesFromAPI() {
        
        APIManager.sharedInstance.performRequest(serviceType: .userData){
            (response) in
            switch response {
            case .success(let value):
                if let content = value as? Data {
                    do {
                        let responseData = try JSONDecoder().decode(UserData.self, from: content)
                        self.stories = responseData
                        self.presenter?.dataFetchedSuccessfully()
                    } catch {
                        self.presenter?.dataFetchedFailed(error: error)
                    }
                }
                else{
                    self.presenter?.dataFetchedFailed(error: nil)
                }
            case .failure(let error):
                self.presenter?.dataFetchedFailed(error: error)
            }
        }
    }
}
