//
//  HomeViewController.swift
//  TaskTracker
//
//  Created by Anirudha Kumar on 09/03/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeSegmentControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    var taskData: [TaskDataModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeSegmentControl.selectedSegmentIndex = 1
        fetchTaskData()
    }
    
    func fetchTaskData() {
        guard let jsonPath = Bundle.main.path(forResource: "data", ofType: "json") else { return }
        do {
            if let jsonData = try? NSData(contentsOfFile: jsonPath) as Data {
                let json = try? JSONDecoder().decode([TaskDataModel].self, from: jsonData)
                taskData = json ?? []
            }
            
        }
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        
        case 0:
            let filteredData = taskData?.filter({$0.status.lowercased() == "to do"})
            prepareTaskContoller(data: filteredData)
            
        case 1:
            let filteredData = taskData?.filter({$0.status.lowercased() == "doing"})
            prepareTaskContoller(data: filteredData)
        case 2:
            let filteredData = taskData?.filter({$0.status.lowercased() == "done"})
            prepareTaskContoller(data: filteredData)
        default:
            break
        }
    }
    
    func prepareTaskContoller(data: [TaskDataModel]?) {
        
        guard let taskVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "TaskViewController") as? TaskViewController else { return }
        taskVC.taskData = self.taskData
        containerView.addSubview(taskVC.view)
    }
    

}

