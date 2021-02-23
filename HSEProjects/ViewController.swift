//
//  ViewController.swift
//  HSEProjects
//
//  Created by Павел Петров on 11/01/2021.
//  Copyright © 2021 Павел Петров. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var parsedText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Project")
        request.returnsObjectsAsFaults = false
        do {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let result = try context.fetch(request)
            for data in result as! [Project] {
                parsedText.text = (data.value(forKey: "text") as! String)
          }
            
        } catch {
            
            print("Failed")
        }

    }
    //@IBAction func updateProjects(_ sender: UISwipeGestureRecognizer) {
    //    viewDidLoad()
    //}
    @IBAction func updateProjects(_ sender: UISwipeGestureRecognizer) {
        let parser = Parser()
        parser.parseProjects()
        viewDidLoad()
    }
    

}

