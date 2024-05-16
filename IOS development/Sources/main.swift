// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

let viewModel = DashboardViewModel(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCk W0ox8t bjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI")
let view = DashboardView()

Task {
    await viewModel.fetchDashboardData()
    let hostingController = UIHostingController(rootView: view)
    hostingController.view.frame = UIScreen.main.bounds
    hostingController.view.backgroundColor = .white
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = hostingController
    window.makeKeyAndVisible()
}

RunLoop.current.run()
