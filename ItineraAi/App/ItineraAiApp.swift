//
//  ItineraAiApp.swift
//  ItineraAi
//
//  Created by Gideon Adewuyi on 07/09/2025.
//

import SwiftUI
import FirebaseCore
import SwiftData

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
				   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
	FirebaseApp.configure()
	return true
  }
}


@main
struct ItineraAiApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
	
	
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
		.modelContainer(for: ItineryChat.self)
		.modelContainer(for: Itinery.self)
    }
}
