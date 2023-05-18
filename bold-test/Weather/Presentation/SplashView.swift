//
//  SplashView.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import SwiftUI

struct SplashView: View {
    
    private struct Constants {
        static let weather = "Weather"
    }
    
    var body: some View {
        Color.gray.ignoresSafeArea()
        VStack {
            Text(Constants.weather)
                .font(.title)
                .foregroundColor(.black)
            Image(PresentationConstants.images.weather)
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
                .frame(width: 300, height: 300)
        }
    }
        
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
