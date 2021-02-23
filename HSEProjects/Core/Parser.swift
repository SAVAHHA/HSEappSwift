//
//  Parser.swift
//  HSEProjects
//
//  Created by Павел Петров on 11/01/2021.
//  Copyright © 2021 Павел Петров. All rights reserved.
//

import Foundation
import SwiftSoup
import Kanna
import CoreData
import UIKit


class Parser{
    var projectList = [Project]()
    func parseProjects() -> String{
        let url = URL(string: "https://pf.hse.ru/")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Project", in: context)
        var html: String
        var projectName: String = ""
        var projectItem: String = ""
        do{
            try html = String(contentsOf: url!)
        }
        catch{
            html = "error"
        }
        if let doc = try? HTML(html: html, encoding: .utf8) {
            // Search for nodes by XPath

            for item in doc.xpath("//div[@class = 'posts_group_clean']/div"){
                let projectString = item
                projectName = item.at_xpath("//h3[@class = 'first_child']")!.text ?? "none"
                projectItem = ""
                for item in projectString.xpath("//div[@class = 'small with-indent']"){
                    let projectList = item
                    for item in projectList.xpath("//div"){
                        projectItem += "\(String(describing: item.text!)) "
                    }
                }
                let newProject = NSManagedObject(entity: entity!, insertInto: context)
                var _n: Int = 0
                var _splitIndex: Int = 0
                var _checkWhiteSpace: Bool = false
                var _checkUpperCase: Bool = false
                for char in projectItem{
                    if !char.isWhitespace{
                        _checkWhiteSpace = true
                    }
                    else{
                        _checkWhiteSpace = false
                    }
                    if !char.isUppercase && _checkWhiteSpace == true {
                        _splitIndex = _n
                    }
                    else{
                        _checkWhiteSpace = false
                    }
                    n += 1
                }
                var textValue = (String((projectName ?? "none") + "\n" + projectItem))
                textValue = textValue.replacingOccurrences(of: "Показать все", with: "")
                print(textValue)
                newProject.setValue(textValue, forKey: "text")
                do {
                   try context.save()
                  } catch {
                   print("Failed saving")
                }
            }
        }
        return String((projectName ?? "none") + "\n" + projectItem)
    }
}
