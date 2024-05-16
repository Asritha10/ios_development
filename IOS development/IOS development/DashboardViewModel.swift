//
//  DashboardViewModel.swift
//  IOS development
//
//  Created by Asritha Veeramaneni on 15/05/24.
//

import Foundation
import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var chartData: [ChartItem]?
    @Published var topLinks: [LinkItem] = []
    @Published var recentLinks: [LinkItem] = []
    @Published var greeting: String = ""
    
    private let networkClient: NetworkClient
    
    init(accessToken: String) {
        self.networkClient = NetworkClient(accessToken: accessToken)
    }
    
    func fetchDashboardData() async {
        do {
            let data = try await networkClient.fetchDashboardData()
            let dashboardResponse = try JSONDecoder().decode(DashboardResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.chartData = dashboardResponse.chartData
                self.topLinks = dashboardResponse.topLinks
                self.recentLinks = dashboardResponse.recentLinks
                self.greeting = self.getGreeting()
            }
        } catch {
            print("Error fetching dashboard data: \(error)")
        }
    }
    
    private func getGreeting() -> String {
        let currentTime = Date()
        let hour = Calendar.current.component(.hour, from: currentTime)
        
        var greetingMessage = ""
        if hour < 12 {
            greetingMessage = "Good morning! 👋"
        } else if hour < 18 {
            greetingMessage = "Good afternoon! 👋"
        } else {
            greetingMessage = "Good evening! 👋"
        }
        
        return "\(greetingMessage)\n\nAjay Manva"
    }
}



