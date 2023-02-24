//
//  ViewController.swift
//  CV
//
//  Created by Vlad Lapchynskyi on 16.09.2022.
//

import UIKit

class CvViewController: UIViewController {
    
    enum RowType {
        case title(UIImage?, String)
        case experience(UIImage?, String)
        case job(Job)
        case skills([Skill])
    }

    @IBOutlet weak var cvTableView: UITableView!
    
//    var jobExperienceList: [Job]?
//    var skillList: [Skill]?
    
    var rows = [RowType]()
    
    private let imageTableViewCellID = "ImageTableViewCell"
    private let experienceTableViewCellID = "ExperienceTableViewCell"
    private let experienceListTableViewCellID = "ExperienceListTableViewCell"
    private let skillListTableViewCellID = "SkillListTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rows = [
            .title(UIImage(named: "icon.main"), "Vlad L"),
            .experience(UIImage(named: "icon.experience"), "Job experience"),
            .job(Job(company: "MonoBank", speciality: "Tester", yearOfWork: "2019-2022")),
            .job(Job(company: "PrivatBank", speciality: "Tester", yearOfWork: "2015-2019")),
            .job(Job(company: "PrivatBank", speciality: "Manager", yearOfWork: "2014-2015")),
            .job(Job(company: "PrivatBank", speciality: "Consultant", yearOfWork: "2011-2014")),
            .experience(UIImage(named: "icon.skill2"), "Skills"),
            .skills([
                Skill(image: UIImage(named: "icon.swift"), name: "Swift", level: 3),
                Skill(image: UIImage(named: "icon.ellipse"), name: "HTML", level: 2)
            ])
        ]
        
        cvTableView.backgroundColor = .white
        cvTableView.delegate = self
        cvTableView.dataSource = self
        cvTableView.register(
            UINib(nibName: imageTableViewCellID, bundle: nil),
            forCellReuseIdentifier: imageTableViewCellID
        )
        cvTableView.register(
            UINib(nibName: experienceTableViewCellID, bundle: nil),
            forCellReuseIdentifier: experienceTableViewCellID
)
        cvTableView.register(
            UINib(nibName: experienceListTableViewCellID, bundle: nil),
            forCellReuseIdentifier: experienceListTableViewCellID
)
        cvTableView.register(
            UINib(nibName: skillListTableViewCellID, bundle: nil),
            forCellReuseIdentifier: skillListTableViewCellID
)
    }
}

extension CvViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension CvViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch rows[indexPath.row] {
        case let .title(image, title):
            let cell = tableView.dequeueReusableCell(withIdentifier: imageTableViewCellID, for: indexPath) as! ImageTableViewCell
            cell.mainImageView.image = image
            cell.titleLabel.text = title
            return cell
            
        case let .experience(image, title):
            let cell = tableView.dequeueReusableCell(withIdentifier: experienceTableViewCellID, for: indexPath) as! ExperienceTableViewCell
            cell.experienceImageView.image = image
            cell.experienceTitleLabel.text = title
            return cell
            
        case let .job(job):
            let cell = tableView.dequeueReusableCell(withIdentifier: experienceListTableViewCellID, for: indexPath) as! ExperienceListTableViewCell
            cell.yearOfWorkTitleLabel.text = job.yearOfWork
            cell.companyTitleLabel.text = job.company
            cell.specialityTitleLabel.text = job.speciality
            return cell
            
            
            
        case let .skills(skills):
            let cell = tableView.dequeueReusableCell(withIdentifier: skillListTableViewCellID, for: indexPath) as! SkillListTableViewCell
            cell.skills = skills
            return cell
        }
    }
    
}
