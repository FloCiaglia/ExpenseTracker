//
//  User.swift
//  Expense Test
//
//  Created by Bethany Hull on 11/4/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var name: String
    
    init(name n: String) {
        self.name = n
    }
    
    
}
