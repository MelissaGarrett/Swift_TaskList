//
//  AddTaskViewController.swift
//  TaskList
//
//  Created by Melissa  Garrett on 10/19/16.
//  Copyright © 2016 MelissaGarrett. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    
    var mainVC: ViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taskTextField.becomeFirstResponder()
    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveNewTaskButton(_ sender: UIButton) {
        let task = TaskListModel(dailyTask: taskTextField.text!, details: detailsTextField.text!)
        mainVC.tasksArray.append(task)
        
        taskTextField.text = ""
        detailsTextField.text = ""
        
        navigationController!.popViewController(animated: true)
    }
    
}
