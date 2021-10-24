//
//  Project-CoreDataHelpers.swift.swift
//  Project-CoreDataHelpers.swift
//
//  Created by maartz on 24/10/2021.
//

import Foundation

extension Project {
    var projectTitle: String {
        title ?? ""
    }
    
    var projectDetail: String {
        detail ?? ""
    }
    
    var projectColor: String {
        color ?? "Light Blue"
    }
    
    var projectItems: [Item] {
        let allItemsArray = items?.allObjects as? [Item] ?? []
        
        return allItemsArray.sorted { first, second in
            // TODO: Refactor this with ternary
            if first.completed == false {
                if second.completed == true {
                    return true
                }
            } else if first.completed == true {
                if second.completed == false {
                    return false
                }
            }
            
            if first.priority > second.priority {
                return true
            } else if second.priority > first.priority {
                return false
            }
            
            return first.itemCreationDate < second.itemCreationDate
        }
    }
    
    var completionAmount: Double {
        let orignalItems = items?.allObjects as? [Item] ?? []
        
        guard orignalItems.isEmpty == false else { return 0}
        
        let completedItems = orignalItems.filter(\.completed)
        return Double(completedItems.count) / Double(orignalItems.count)
    }
    
    static var example: Project {
        let controller = DataController.init(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let project = Project(context: viewContext)
        project.title = "Project title"
        project.detail = "This is an example project"
        project.closed = true
        project.creationDate = Date()
        
        return project
    }
}
