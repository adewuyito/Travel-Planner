//
//  Router.swift
//  ItineraAi
//
//  Created by Gideon Adewuyi on 15/09/2025.
//

import SwiftUI

@MainActor
class NavigationRouter: ObservableObject {
	@Published var path = NavigationPath()
	
	enum Destination: Hashable {
		case itineraryResult(prompt: String)
	}
	
	func push(_ destination: Destination) {
		path.append(destination)
	}
	
	func pop() {
		path.removeLast()
	}
	
	func popToRoot() {
		path = NavigationPath()
	}
}
