//
//  Main.swift
//  FirstApp
//
//  Created by Victor Cosqui on 22/8/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    let lm = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        lm.delegate = self
        print("app start")
        
        DispatchQueue.global(qos: .background).async {
            Task {
                var i = 0
                while true {
                    try await Task.sleep(nanoseconds: UInt64(5 * Double(NSEC_PER_SEC)))
                    print("[thread] backgroud task executed...\(i)")
                    i+=1
                    self.lm.requestLocation()
                }
            }
        }
    }
    
    func requestLocation() {
        print("[LocationManager] requesting location...")
        isLoading = true
        lm.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
        print("[LocationManager] location obtained \(location as Optional)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("[LocationManager] didUpdateLocations...", error)
        isLoading = false
    }
}
