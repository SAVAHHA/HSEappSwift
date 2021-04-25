//
//  StartViewController.swift
//  HSEProjects
//
//  Created by Павел Петров on 11/01/2021.
//  Copyright © 2021 Павел Петров. All rights reserved.
//

import UIKit
import CoreData
import SwiftSoup

class StartViewController: UIViewController {
    
    var infoProject = [ProjectStudents]()
    
    
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        //        PARSER PETAR
        
        let myURLString = "https://pf.hse.ru/index.html"
        guard let myUrl = URL(string: myURLString) else {return}
        
        do{
            let myHTMLString = try String(contentsOf: myUrl, encoding: .utf8)
            let htmlContent = myHTMLString
            do{
                let doc = try SwiftSoup.parse(htmlContent)
                
                
                do{
                    let element = try doc.select("h3").array()
                    let elementRecommendendedProgramms = try doc.getElementsByClass("edu-dot-dot-dot").array()
                    let elementDeadline = try doc.getElementsMatchingOwnText("2021 г.").array()
                    
                    
                    
                    do{
                        for index in 0..<element.count{
                            let text = try element[index].text()
                            let textRecPrograms = try elementRecommendendedProgramms[index].text()
                            
                            let newtextRecPrograms = textRecPrograms.dropLast(12)
                            let textDeadline = try elementDeadline[index].text()
                            
                            
                            let info = ProjectStudents(name: text, recommendedPrograms: String(newtextRecPrograms), deadline: textDeadline)
                            infoProject.append(info)
                        }
                        
                        print(infoProject[0...3])
                        
                    } 
                }catch{
                    
                    
                    
                }
            }
        }catch let error{
            print("Error: \(error)")
        }
    }
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}

extension StartViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        infoProject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProjectCell.identifier, for: indexPath) as! ProjectCell
        
        let projects = infoProject[indexPath.row]
        cell.projectNameLabel.text = projects.name
        cell.recommendedProgramsLabel.text = "Рекомендуемые образовательные программы:" + " " + projects.recommendedPrograms
        cell.deadlineLabel.text = "Срок записи на проект:" + " " + projects.deadline
        //        cell.realisationTimeLabel
        //        cell.leaderLabel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let projectItem = infoProject[indexPath.row]
        
        performSegue(withIdentifier: "ShowDetail", sender: projectItem)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            guard let secondVC = segue.destination as? ProjectDetailViewController,
                  let ourProjects = sender as? ProjectStudents
            else{
                fatalError("ERROR ERROR")
            }
            secondVC.projectItem = ourProjects
        }
    }
    
}
