//
//  HomeViewController.swift
//  ViperDemo
//
//  Created by Apple on 15/11/22.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var tblNews: UITableView!
    
    //MARK: Variable Declaration
    var presenter: HomeViewControllerToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpAPICall()
    }
    
    func setUpTableView() {
        tblNews.delegate = self
        tblNews.dataSource = self
        tblNews.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    private func setUpAPICall() {
        presenter?.fetchStories()
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getTotalCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblNews.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let story = presenter?.getItemAt(index: indexPath.row)
        cell.bindData(story: story)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showListController()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension HomeViewController: HomePresenterToViewController {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tblNews.reloadData()
        }
    }
}
