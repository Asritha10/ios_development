//
//  ChartView.swift
//  IOS development
//
//  Created by Asritha Veeramaneni on 15/05/24.
//

import Foundation
import SwiftUI
import Charts

struct ChartView: View {
    let chartData: [ChartItem]
    
    var body: some View {
        Chart(chartData) { item in
            BarMark(
                x: .value("Month", item.month),
                y: .value("Value", item.value)
            )
            .foregroundStyle(LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue]),
                startPoint: .bottom,
                endPoint: .top
            ))
        }
        .chartXAxis {
            AxisMarks(position: .bottom, values: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug"]) { value in
                AxisGridLine()
                AxisTick()
                AxisValueLabel()
            }
        }
        .chartYAxis {
            AxisMarks(position: .leading, step: 20, range: 0...100) { value in
                AxisGridLine()
                AxisTick()
                AxisValueLabel(format: .number)
            }
        }
        .chartTitle("Overview")
        .chartTitleModifier(position: .trailing)
        .chartSubtitle("22nd Aug to 23rd Sept")
        .chartSubtitleModifier(position: .leading)
        .frame(height: 300)
    }
}

struct ChartItem: Identifiable {
    let id = UUID()
    let month: String
    let value: Double
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(chartData: [
            ChartItem(month: "Jan", value: 30),
            ChartItem(month: "Feb", value: 50),
            ChartItem(month: "Mar", value: 77),
            ChartItem(month: "Apr", value: 75),
            ChartItem(month: "May", value: 100),
            ChartItem(month: "Jun", value: 50),
            ChartItem(month: "Jul", value: 25),
            ChartItem(month: "Aug", value: 100)
        ])
    }
}
