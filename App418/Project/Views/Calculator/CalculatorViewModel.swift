//
//  CalculatorViewModel.swift
//  App418
//
//  Created by IGOR on 28/03/2024.
//

import SwiftUI
import CoreData

final class CalculatorViewModel: ObservableObject {

    @Published var currencies: [String] = ["EUR/USD", "GBP/USD", "AUD/USD", "USD/CAD", "USD/CHF", "NZD/USD"]
    @Published var currCur = "EUR/USD"
    @AppStorage("currentCurrency") var currentCurrency = ""

    @AppStorage("scheduled") var scheduled = ""
    @AppStorage("completed") var completed = ""
    @Published var bet = ""
    @Published var workingHours = ""
    @Published var Vbet: Int = 0
    @Published var VWH: Int = 0
    
    @Published var isAdd: Bool = false
    @Published var isCurr: Bool = false
    @Published var isDetail: Bool = false
    @Published var isChart: Bool = false
    @Published var isDelete: Bool = false
    @Published var isEdit: Bool = false
    @Published var isResult: Bool = false
 
    func calculatePercentage() -> Double {
        
        let value = Vbet
        let maxValue = VWH
        
        let percentCircle = Double(value) * Double(maxValue)
        
        return percentCircle
    }
    
    func calculatePercentageDaily() -> Double {
        
        let value = Vbet
        let maxValue = VWH
        
        let percentCircle = Double(value) * Double(maxValue) * 8
        
        return percentCircle
    }
    
    func calculatePercentageWeekly() -> Double {
        
        let value = Vbet
        let maxValue = VWH
        
        let percentCircle = Double(value) * Double(maxValue) * 8 * 6
        
        return percentCircle
    }
    
    func calculatePercentage2Week() -> Double {
        
        let value = Vbet
        let maxValue = VWH
        
        let percentCircle = Double(value) * Double(maxValue) * 8 * 6 * 2
        
        return percentCircle
    }
}
