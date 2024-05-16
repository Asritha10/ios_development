//
//  DashboardView.swift
//  IOS development
//
//  Created by Asritha Veeramaneni on 15/05/24.
//

//
//  DashboardView.swift


import Foundation
import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCk W0ox8t bjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(viewModel.greeting)
                .font(.title)
                .fontWeight(.bold)
            
            if let chartData = viewModel.chartData {
                ChartView(chartData: chartData)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            
            HStack {
                Button("Top Links") {
                    // Do nothing
                }
                .foregroundColor(.blue)
                
                Button("Recent Links") {
                    // Do nothing
                }
                .foregroundColor(.blue)
                
                Spacer()
                
                TextField("Search", text: .constant(""))
                    .padding(8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(viewModel.links) { link in
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("https://openinapp.com/broken-link?url=http://samplelink.oia.bio/ashd")
                                    .font(.headline)
                                Text("22 Aug 2022")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 8) {
                                HStack {
                                    Text("2323")
                                        .font(.title3)
                                    Image(systemName: "arrow.up")
                                        .font(.title3)
                                }
                                Text("Clicks")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Image("amazon_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
            }
            
            HStack {
                Button("View All Links") {
                    // Do nothing
                }
                .foregroundColor(.blue)
                
                Spacer()
                
                Button(action: {
                    // Do something
                }) {
                    HStack {
                        Image(systemName: "whatsapp")
                            .foregroundColor(.green)
                        Text("Talk to us")
                            .foregroundColor(.green)
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Frequently Asked Questions")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Button(action: {
                    // Do something
                }) {
                    HStack {
                        Image(systemName: "questionmark.circle")
                            .font(.title)
                        Text("Question 1")
                            .font(.title2)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.title2)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
                
                Button(action: {
                    // Do something
                }) {
                    HStack {
                        Image(systemName: "questionmark.circle")
                            .font(.title)
                        Text("Question 2")
                            .font(.title2)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.title2)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
            }
            
            HStack {
                Button(action: {
                    // Do something
                }) {
                    HStack {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Campaigns")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                }
                
                Spacer()
                
                Button(action: {
                    // Do something
                }) {
                    HStack {
                        Image(systemName: "person.circle")
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Profile")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                }
            }
            
            // Added WhatsApp logo in "Talk to us on WhatsApp" and question mark in "Frequently Asked Questions"
            HStack {
                Button(action: {
                    // Do something
                }) {
                    HStack {
                        Image(systemName: "whatsapp")
                            .foregroundColor(.green)
                        Text("Talk to us")
                            .foregroundColor(.green)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    // Do something
                }) {
                    HStack {
                        Image(systemName: "questionmark.circle")
                            .font(.title)
                        Text("Frequently Asked Questions")
                            .font(.title2)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.title2)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
            }
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("123 clicks /n Ahamedabad Top Location")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("Instagram top source")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .task {
            await viewModel.fetchDashboardData()
        }
    }
}
struct TopLinksView: View {
    let links: [LinkItem]
    
    var body: some View {
        List(links) { link in
            HStack {
                VStack(alignment: .leading) {
                    Text(link.title)
                        .font(.headline)
                    Text(link.url)
                        .font(.subheadline)
                }
                Spacer()
                Image("amazon_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)}
            .padding()
        }
    }
}

struct RecentLinksView: View {
    let links: [LinkItem]
    
    var body: some View {
        List(links) { link in
            HStack {
                VStack(alignment: .leading) {
                    Text(link.title)
                        .font(.headline)
                    Text(link.url)
                        .font(.subheadline)
                }
                Spacer()
                Image("amazon_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }
            .padding()
        }
    }
}


