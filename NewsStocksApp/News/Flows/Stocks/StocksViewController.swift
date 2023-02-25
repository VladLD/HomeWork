//
//  StocksViewController.swift
//  News
//
//  Created by Vlad Lapchynskyi on 14.01.2023.
//

import UIKit

class StocksViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var StocksTableView: UITableView!
    
    // MARK: - Properties
    
    var stocks: [Stocks]?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Stocks"
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search")?.withRenderingMode(.alwaysTemplate), style: .plain, target: nil, action: nil)
        
        
        setupStock()
        
        StocksTableView.delegate = self
        StocksTableView.dataSource = self
        
        StocksTableView.register(
            UINib(nibName: "StocksTableViewCell", bundle: nil),
            forCellReuseIdentifier: "StocksTableViewCell"
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
    
    private func setupStock() {
        stocks = [
            Stocks(symbol: "AAPL", name: "Apple Inc.", price: "127.79", percentChange: "+0.35"),
            Stocks(symbol: "MSFT", name: "Microsoft Corporation", price: "234.51", percentChange: "+0.63"),
            Stocks(symbol: "AMZN", name: "Amazon.com, Inc.", price: "3087.01", percentChange: "+1.74"),
            Stocks(symbol: "GOOGL", name: "Alphabet Inc.", price: "2107.60", percentChange: "+1.22"),
            Stocks(symbol: "TSLA", name: "Tesla, Inc.", price: "719.69", percentChange: "+1.60"),
            Stocks(symbol: "NVDA", name: "NVIDIA Corporation", price: "501.32", percentChange: "+1.17"),
            Stocks(symbol: "FB", name: "Meta Platforms, Inc.", price: "257.64", percentChange: "+1.10"),
            Stocks(symbol: "JPM", name: "JPMorgan Chase & Co.", price: "150.00", percentChange: "+0.72"),
            Stocks(symbol: "V", name: "Visa Inc.", price: "211.78", percentChange: "+0.57"),
            Stocks(symbol: "PYPL", name: "PayPal Holdings, Inc.", price: "283.26", percentChange: "+0.47"),
            Stocks(symbol: "AAPL", name: "Apple Inc.", price: "127.79", percentChange: "+0.35"),
            Stocks(symbol: "MSFT", name: "Microsoft Corporation", price: "234.51", percentChange: "+0.63"),
            Stocks(symbol: "AMZN", name: "Amazon.com, Inc.", price: "3087.01", percentChange: "+1.74"),
            Stocks(symbol: "GOOGL", name: "Alphabet Inc.", price: "2107.60", percentChange: "+1.22"),
            Stocks(symbol: "TSLA", name: "Tesla, Inc.", price: "719.69", percentChange: "+1.60"),
            Stocks(symbol: "NVDA", name: "NVIDIA Corporation", price: "501.32", percentChange: "+1.17"),
            Stocks(symbol: "FB", name: "Meta Platforms, Inc.", price: "257.64", percentChange: "+1.10"),
            Stocks(symbol: "JPM", name: "JPMorgan Chase & Co.", price: "150.00", percentChange: "+0.72"),
            Stocks(symbol: "V", name: "Visa Inc.", price: "211.78", percentChange: "+0.57"),
            Stocks(symbol: "PYPL", name: "PayPal Holdings, Inc.", price: "283.26", percentChange: "+0.47")
        ] 
    }
}

// MARK: - UITableViewDelegate

extension StocksViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension StocksViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "StocksTableViewCell",
            for: indexPath
        ) as? StocksTableViewCell, let stock = stocks?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.symbol.text = stock.symbol
        cell.name.text = stock.name
        cell.price.text = stock.price
        cell.percentChange.text = stock.percentChange
        
        return cell
    }
}

