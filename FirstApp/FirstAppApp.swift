//
//  FirstAppApp.swift
//  FirstApp
//
//  Created by Victor Cosqui on 22/8/24.
//

import SwiftUI
import BackgroundTasks
import CoreLocation

@main
struct FirstAppApp: App {
    
    @StateObject var lm = LocationManager()
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) {
            scheduleAppRefresh()
            if scenePhase == .active {
                print("[app.lifecycle] app is active")
            } else if scenePhase == .inactive {
                print("[app.lifecycle] app is inactive")
            } else if scenePhase == .background {
                print("[app.lifecycle] app is in background")
            }
        }
        .backgroundTask(.appRefresh("FirstApp.task.identifier")) {
            await sendLocationToServer(coordinates: lm.location)
        }
    }
    
    func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "FirstApp.task.identifier")
        request.earliestBeginDate = Date(timeIntervalSinceNow: 0)
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("[xxx] Could not schedule app refresh: \(error)")
        }
        print("[app.scheduler] task 'FirstApp.task.identifier' scheduled")
    }
    
    func sendLocationToServer(coordinates: CLLocationCoordinate2D?) async {
        print("[app.network] send location to backend \(lm.location as Optional)")
    }
}
