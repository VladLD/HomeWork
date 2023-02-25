//
//  FavoritesViewController.swift
//  News
//
//  Created by Vlad Lapchynskyi on 30.08.2022.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    // MARK: - Properties
    
    var favouriteList: [Favourite]?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Favourite"
        

        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search")?.withRenderingMode(.alwaysTemplate), style: .plain, target: nil, action: nil)
        
        
        setupData()
        
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        
        favoritesTableView.register(
            UINib(nibName: "FavoritesCardTableViewCell", bundle: nil),
            forCellReuseIdentifier: "FavoritesCardTableViewCell"
        )
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //        print("viewWillAppear FavoritesViewController")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //        print("viewDidAppear FavoritesViewController")
    }
    
    private func setupData() {
        favouriteList = [
            Favourite(title: "США оголосили нову допомогу Україні", newsDescription: "Пентагон оголосив новий пакет допомоги Україні на суму 2 мільярди доларів у річницю російського вторгнення, йдеться в прес-релізі Міноборони США.", icon: UIImage(named: "icon.usa"), creationDate: Date()),
            Favourite(title: "У даний час уряд не планує розпочинати податкову реформу", newsDescription: "Прем’єр-міністр Денис Шмигаль заявив, що наразі податків, які надходять щомісяця до держбюджету, не вистачає навіть на покриття всіх потреб оборонного сектору. Тому зараз уряд не планує розпочинати повноцінну податкову реформу.", icon: UIImage(named: "icon.ukraine"), creationDate: Date())
        ]
    }
    
}

// MARK: - UITableViewDelegate

extension FavoritesViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension FavoritesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteList?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "FavoritesCardTableViewCell",
            for: indexPath
        ) as? FavoritesCardTableViewCell, let favourite = favouriteList?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.addData(favourite: favourite)
        
        return cell
    }
}

