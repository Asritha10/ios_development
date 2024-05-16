//
//  DashboardModels.swift
//  IOS development
//
//  Created by Asritha Veeramaneni on 15/05/24.
//

import Foundation
struct DashboardResponse: Codable {
    let chartData: [ChartItem]
    let topLinks: [LinkItem]
    let recentLinks: [LinkItem]
}

struct ChartItem: Codable, Identifiable {
    var id = UUID()
    let item: String
    let value: Double
}

struct LinkItem: Codable, Identifiable {
    var id = UUID()
    let title: String
    let url: String
}
