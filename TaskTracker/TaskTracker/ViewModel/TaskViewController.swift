//
//  TaskViewController.swift
//  TaskTracker
//
//  Created by Anirudha Kumar on 09/03/21.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var taskData: [TaskDataModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchTaskData()
    }
    
    func fetchTaskData() {
        let jsonData = Bundle.main.path(forResource: "taskData", ofType: "json")
        print(jsonData)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let taskCell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as? TaskTableViewCell else { return UITableViewCell() }
        return taskCell
    }
    

}
