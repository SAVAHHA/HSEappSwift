//
//  Parser.swift
//  HSEProjects
//
//  Created by Павел Петров on 11/01/2021.
//  Copyright © 2021 Павел Петров. All rights reserved.
//

import Foundation
import SwiftSoup

class Parser{
    var projectList = [Project]()
    func parseProjects() -> String{
        let url = URL(string: "https://pf.hse.ru/")
        var html: String
        do{
            try html = String(contentsOf: url!)
        }
        catch{
            html = "error"
        }
        return html
    }
}
