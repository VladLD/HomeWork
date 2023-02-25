//
//  NewsViewController.swift
//  news
//
//  Created by Vlad Lapchynskyi on 30.08.2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var newsTableView: UITableView!
    
    // MARK: - Properties
    
    var newList: [News]?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News"
        
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search")?.withRenderingMode(.alwaysTemplate), style: .plain, target: nil, action: nil)
        
        setupData()
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        newsTableView.register(
            UINib(nibName: "NewsCardTableViewCell", bundle: nil),
            forCellReuseIdentifier: "NewsCardTableViewCell"
        )
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //        print("viewWillAppear NewsViewController")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //        print("viewDidAppear NewsViewController")
    }
    
    private func setupData() {
        newList = [
            News(title: "США оголосили нову допомогу Україні", newsDescription: "Пентагон оголосив новий пакет допомоги Україні на суму 2 мільярди доларів у річницю російського вторгнення, йдеться в прес-релізі Міноборони США.", icon: UIImage(named: "icon.usa"), creationDate: Date()),
            News(title: "Британія готова захистити союзників, які відправлять радянські винищувачі Україні", newsDescription: "Велика Британія готова надати свої винищувачі східноєвропейським союзникам, щоб вони могли відправити свої винищувачі радянського зразка в Україну.", icon: UIImage(named: "icon.uk"), creationDate: Date()),
            News(title: "У даний час уряд не планує розпочинати податкову реформу", newsDescription: "Прем’єр-міністр Денис Шмигаль заявив, що наразі податків, які надходять щомісяця до держбюджету, не вистачає навіть на покриття всіх потреб оборонного сектору. Тому зараз уряд не планує розпочинати повноцінну податкову реформу.", icon: UIImage(named: "icon.ukraine"), creationDate: Date()),
            News(title: "Server Optimization Maintenance Notice", newsDescription: "To provide better gaming experience to players, a server optimization maintenance will be carried out. We ask for your kind understanding as you may experience some delays accessing the game.", icon: UIImage(named: "icon.bg"), creationDate: Date()),
            News(title: "США оголосили нову допомогу Україні", newsDescription: "Пентагон оголосив новий пакет допомоги Україні на суму 2 мільярди доларів у річницю російського вторгнення, йдеться в прес-релізі Міноборони США.", icon: UIImage(named: "icon.usa"), creationDate: Date()),
            News(title: "Британія готова захистити союзників, які відправлять радянські винищувачі Україні", newsDescription: "Велика Британія готова надати свої винищувачі східноєвропейським союзникам, щоб вони могли відправити свої винищувачі радянського зразка в Україну.", icon: UIImage(named: "icon.uk"), creationDate: Date())
        ]
    }
    
    // MARK: - Selectors
    
    @IBAction func selectSecondTab(_ sender: Any) {
    }
    
}

// MARK: - UITableViewDelegate

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension NewsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newList?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "NewsCardTableViewCell",
            for: indexPath
        ) as? NewsCardTableViewCell, let news = newList?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.addData(news: news)
        
        return cell
    }
}
