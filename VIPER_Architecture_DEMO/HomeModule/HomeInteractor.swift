//
//  HomeInteractor.swift
//  ViperDemo
//
//  Created by Apple on 15/11/22.
//

import Foundation

//protocol HomeInteractorToPresent

final class HomeInteractor: HomePresenterToInteractor {
    
    var presenter: HomeInteratorToPresenter?
    var stories: [DataStory]?
    
    func fetchStoriesFromAPI() {
        let params = ["sub_category_slug": "politics", "page_no": 1] as [String : Any]
        APIManager.sharedInstance.performRequest(serviceType: .getNews(parameters: params)){
                (response) in
                switch response {
                case .success(let value):
                    if let content = value as? Data {
                        do {
                            let responseData = try JSONDecoder().decode(News.self, from: content)
                            self.stories = responseData.data?.stories
                            self.presenter?.dataFetchedSuccessfully()
                        } catch {
                            self.presenter?.dataFetchedFailed(error: error)
                        }
                    }
                    else{
                        self.presenter?.dataFetchedFailed(error: nil)
                    }
                    self.presenter?.dataFetchedFailed(error: nil)
                case .failure(let error):
                    self.presenter?.dataFetchedFailed(error: error)
                }
            }
        }
}
