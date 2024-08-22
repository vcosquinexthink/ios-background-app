//
//  LocationView.swift
//  FirstApp
//
//  Created by Victor Cosqui on 22/8/24.
//

import SwiftUI
import CoreLocationUI

struct LocationView: View {
    
    @EnvironmentObject var lm: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20, content: {
                Text("Tracking location...").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("please, share your location").padding()
                LocationButton(.shareCurrentLocation) {
                    lm.requestLocation()
                }.cornerRadius(30).foregroundColor(.white)
            }).background(.white)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
}

#Preview {
    LocationView()
}
