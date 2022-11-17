//
//  ListViewController.swift
//  ViperDemo
//
//  Created by Apple on 15/11/22.
//

import UIKit

class ListViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var ListTblView: UITableView!
    
    //MARK: Variable Declarations
    var listPresenter: ListViewControllerToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAPI()
        setUpTableView()
    }
    
    func setUpAPI() {
        print("........")
        listPresenter?.fetchImages()
    }
    
    func setUpTableView() {
        ListTblView.delegate = self
        ListTblView.dataSource = self
        ListTblView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
    }

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        let data = listPresenter?.getItemAt()
        cell.getData(images: data)
        return cell
    }
    
    
}

extension ListViewController: ListPresenterToViewController {
    func reloadData() {
        DispatchQueue.main.async {
            self.ListTblView.reloadData()
        }
    }
}
