//
//  Budget.swift
//  DailyGrind
//
//  Created by Joseph DeWeese on 4/3/24.
//

import Foundation
import SwiftData


@Model
class Budget{
    /// Properties
    var budgetName: String = ""
    var budgetDesc: String = ""
    var icon: String = ""
    var spendAmount: Double
    var totalAmount: Double
    var balanceRemaing: Double
    
    init(
        budgetName: String,
        budgetDesc: String,
        icon: String,
        spendAmount: Double,
        totalAmount: Double,
        balanceRemaing: Double
    ) {
        self.budgetName = budgetName
        self.budgetDesc = budgetDesc
        self.icon = icon
        self.spendAmount = spendAmount
        self.totalAmount = totalAmount
        self.balanceRemaing = balanceRemaing
    }
}
