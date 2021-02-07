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

class Parser{
    var projectList = [Project]()
    func parseProjects() -> String{
        let url = URL(string: "https://pf.hse.ru/")
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
                var n = 1
                for item in projectString.xpath("//div[@class = 'small with-indent']"){
                    let projectList = item
                    for item in projectList.xpath("//div/span | //div/a"){
                        projectItem += "\(String(describing: item.text!)) "
                        if (n % 2 == 0){
                            projectItem += "\n"
                        }
                        n += 1
                    }
                }
                break
            }
        }
        print(String((projectName ?? "none") + "\n" + projectItem))
        return String((projectName ?? "none") + "\n" + projectItem)
    }
}
