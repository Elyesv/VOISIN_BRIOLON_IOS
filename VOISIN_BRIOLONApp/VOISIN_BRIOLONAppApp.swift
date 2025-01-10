import SwiftUI

@main
struct VOISIN_BRIOLONApp: App {
    let context = CoreDataManager.shared.context
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, context)
        }
    }
}

