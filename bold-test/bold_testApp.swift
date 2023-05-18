//
//  bold_testApp.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

import SwiftUI

@main
struct bold_testApp: App {
    private struct Constants {
        static let timeSplash = 2.5
    }
    
    let factory = Factory(baseUrl: DataConstants.baseUrl)
    @State var isActiveSplash: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if isActiveSplash {
                    SplashView()
                } else {
                    SearchCitiesView<SearchCitiesViewModel>()
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + Constants.timeSplash) {
                    withAnimation {
                        isActiveSplash = false
                    }
                }
            }
            
        }
    }
}
