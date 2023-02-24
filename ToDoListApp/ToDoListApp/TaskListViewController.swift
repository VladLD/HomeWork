//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Vlad Lapchynskyi on 21.02.2023.
//

import UIKit

struct Task {
    var name: String
    var description: String
}

var tasks = [Task]()


class TaskListViewController: UIViewController {
    var tasks: [Task] = []

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        updateTaskList()
    }
    
    private func configure() {
        
        addButton.setTitleColor(.white, for: .normal)
        addButton.layer.cornerRadius = 9
        
        tableView.register(.init(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "TaskTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func updateTaskList() {
        tableView.reloadData()
    }
    
    
    @IBAction func addTask(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addTaskVC = storyboard.instantiateViewController(withIdentifier: "AddTaskViewController") as! AddTaskViewController
        addTaskVC.delegate = self
        present(addTaskVC, animated: true, completion: nil)
    }
    
}

extension TaskListViewController: AddTaskDelegate {
    func addTask(name: String, description: String) {
        let task = Task(name: name, description: description)
        tasks.append(task)
        updateTaskList()
    }
}

extension TaskListViewController: UITableViewDelegate {
    
}

extension TaskListViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as? TaskTableViewCell
        else {
            return UITableViewCell()
        }
        cell.nameLabel.text = tasks[indexPath.row].name
        cell.descriptionLabel.text = tasks[indexPath.row].description
        
        return cell
        
    }
    
}
