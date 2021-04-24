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
        
        let myURLString = "https://pf.hse.ru/index.html"
        guard let myUrl = URL(string: myURLString) else {return}
        
        do{
            let myHTMLString = try String(contentsOf: myUrl, encoding: .utf8)
            let htmlContent = myHTMLString
            do{
                let doc = try SwiftSoup.parse(htmlContent)
                
                
                do{
                    let element = try doc.select("h3").array()
                    
                    
                    do{
                        for index in 0..<element.count{
                            let text = try element[index].text()
                            var name = ProjectStudents(name: text)
                            infoProject.append(name)
                        }
                print(infoProject)

                    } 
                }catch{
                    
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
//        cell.recommendedProgramsLabel
//        cell.deadlineLabel
//        cell.realisationTimeLabel
//        cell.leaderLabel
        
        return cell
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }


}