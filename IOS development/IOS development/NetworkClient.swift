//
//  NetworkClient.swift
//  IOS development
//
//  Created by Asritha Veeramaneni on 15/05/24.
//

import Foundation
struct NetworkClient {
    let accessToken: String
    
    func fetchDashboardData() async throws -> Data {
        guard let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew") else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        return data
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case other(Error)
}
