# iOS_Development

This is an iOS application that displays a dashboard with a greeting message, a chart, and lists of top and recent links. The application is built using SwiftUI, the standard UI framework provided by Apple for iOS development.

# Features

Displays a greeting message based on the local time ("Good morning", "Good afternoon", "Good evening")
Presents a chart visualization using the Charts framework
Provides a tab view to switch between "Top Links" and "Recent Links" lists
Utilizes the List view to display the links in a clean and organized manner

# Installation and Setup

**1.Clone the repository:**
   
(git clone https://github.com/your-username/ios-dashboard-app.git)

**2. Open the project in Xcode:**

Launch Xcode on your macOS device.
Open the IOS development.xcodeproj file located in the cloned repository.

**3.Build and run the app:**

In the Xcode toolbar, click the "Play" button (the triangle icon) to build and run the app.
The app will launch in the selected simulator or on a connected physical iOS device.

# Dependencies

This project uses only the standard iOS SDK frameworks and does not require any external dependencies. The key frameworks used are:

SwiftUI: For building the user interface
Foundation: For core programming tasks, such as networking and data handling
Charts: For the chart visualization

# Project Structure

The project is organized into the following files and folders:

IOS_developmentApp.swift: The main app entry point.
ContentView.swift: The initial view of the application.
DashboardView.swift: The main dashboard view.
DashboardViewModel.swift: The view model that handles the data and logic for the dashboard.
DashboardModels.swift: The data models used in the application.
NetworkClient.swift: The network client that fetches the data from the API.
ChartView.swift: The custom view for displaying the chart.

# Contributing
If you find any issues or have suggestions for improvements, feel free to open a new issue or submit a pull request. Contributions are welcome!
