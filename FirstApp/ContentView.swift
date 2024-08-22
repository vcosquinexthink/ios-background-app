//
//  ContentView.swift
//  FirstApp
//
//  Created by Victor Cosqui on 22/8/24.
//

import SwiftUI

struct ContentView: View {
    
    // state object notifies view when published variables are changed
    @StateObject var lm = LocationManager()
    
    var body: some View {
        VStack {
            if let location = lm.location {
                Text("your coordinates are \(location.longitude), \(location.latitude)").italic()
            }
            if lm.isLoading {
                ProgressView()
            } else {
                LocationView().environmentObject(lm)
            }
        }
        .background(.white)
    }
}

#Preview {
    ContentView()
}
