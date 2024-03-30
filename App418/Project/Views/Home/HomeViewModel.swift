//
//  HomeViewModel.swift
//  App418
//
//  Created by IGOR on 28/03/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {

    @Published var taskName: String = ""
    @Published var taskClient: String = ""
    @Published var taskCost: String = ""
    
    @AppStorage("scheduled") var scheduled = ""
    @AppStorage("completed") var completed = ""
    @Published var schedel = ""
    @Published var complet = ""
    
    @Published var isAdd: Bool = false
    @Published var isCurr: Bool = false
    @Published var isDetail: Bool = false
    @Published var isChart: Bool = false
    @Published var isDelete: Bool = false
    @Published var isEdit: Bool = false
    @Published var isTasks: Bool = false
    @Published var isCalculator: Bool = false


    @Published var tasks: [TasksModel] = []
    @Published var selectedTask: TasksModel?

    func addTask() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TasksModel", into: context) as! TasksModel

        loan.taskName = taskName
        loan.taskClient = taskClient
        loan.taskCost = taskCost

        CoreDataStack.shared.saveContext()
    }
    
    func fetchTasks() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TasksModel>(entityName: "TasksModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.tasks = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.tasks = []
        }
    }
}

