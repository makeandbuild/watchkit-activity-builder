//
//  DataManager.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/24/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import Foundation

class DataManager {

    class var instance : DataManager {
        struct Static {
            static let instance : DataManager = DataManager()
        }
        return Static.instance
    }
    
    func addStep(group: String, title: String, description: String) {
        
        
    }
    
    func deleteStep() {
        
    }
    
    func completeStep() {
        
    }
    
    
    
}