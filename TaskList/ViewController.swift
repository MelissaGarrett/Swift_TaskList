//
//  ViewController.swift
//  TaskList
//
//  Created by Melissa  Garrett on 10/19/16.
//  Copyright © 2016 MelissaGarrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasksArray: [TaskListModel] = []
    var taskListModel: TaskListModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let task1 = TaskListModel(dailyTask: "Gym Workout", details: "5 AM")
        let task2 = TaskListModel(dailyTask: "Grocery Store", details: "items for breakfast")
        let task3 = TaskListModel(dailyTask: "Laundry", details: "UGH!")
        let task4 = TaskListModel(dailyTask: "Call Client", details: "11:30 AM")
        let task5 = TaskListModel(dailyTask: "Martin Project", details: "finish latest app revisions")
        
        tasksArray = [task1, task2, task3, task4, task5]
        
        computeDate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    func computeDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let date = Date()
        let stringDate = dateFormatter.string(from: date)
        navigationItem.title = stringDate
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentTask = tasksArray[indexPath.row]
        let cell:TaskTableViewCell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskTableViewCell
        
        cell.taskLabel.text = currentTask.dailyTask + "..."
        cell.detailsLabel.text = currentTask.details
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            tasksArray.remove(at: indexPath.row);
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // to be able to RECEIVE data from AddTaskViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showTaskAdd") {
            let addTaskVC: AddTaskViewController = segue.destination as! AddTaskViewController
            addTaskVC.mainVC = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

