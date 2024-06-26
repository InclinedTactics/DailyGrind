//
//  ViewExtension.swift
//  DailyGrind
//
//  Created by Joseph DeWeese on 4/3/24.
//

import SwiftUI


extension View {
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View {
        self
        .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment = .center) -> some View {
        self
        .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    @available(iOSApplicationExtension, unavailable)
    var safeArea: UIEdgeInsets {
        if let windowScene = (UIApplication.shared.connectedScenes.first as? UIWindowScene) {
            return windowScene.keyWindow?.safeAreaInsets ?? .zero
        }
        return .zero
    }
    
    func format(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func currencyString(_ value: Double, allowedDigits: Int = 2) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = allowedDigits
        
        return formatter.string(from: .init(value: value)) ?? ""
    }
    
    var currencySymbol: String {
        let locale = Locale.current
        
        return locale.currencySymbol ?? ""
    }
//    func savingsTotal(_ transactions: [Transaction], category: Category) -> Double {
//        return transactions.lazy.filter({ $0.category == category.rawValue }).lazy.reduce(Double.zero) { partialResult, transaction in
//            return partialResult + transaction.amount
//        }
//    }
//    func investmentTotal(_ transactions: [Transaction], category: Category) -> Double {
//        return transactions.lazy.filter({ $0.category == category.rawValue }).lazy.reduce(Double.zero) { partialResult, transaction in
//            return partialResult + transaction.amount
//        }
//    }
//    func total(_ transactions: [Transaction], category: Category) -> Double {
//        return transactions.lazy.filter({ $0.category == category.rawValue }).lazy.reduce(Double.zero) { partialResult, transaction in
//            return partialResult + transaction.amount
//        }
//    }
//    func budgetTotal(_ transactions: [Transaction], budget: Budget) -> Double {
//        return transactions.lazy.filter({ $0.budget == budget.budgetAmount }).lazy.reduce(Double.zero) { partialResult, transaction in
//            return partialResult + transaction.amount
//        }
//    }
    var appTint: Color {
        return UIConstants.shared.tintColor
    }
}



