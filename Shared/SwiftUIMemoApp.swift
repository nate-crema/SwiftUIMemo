//
//  SwiftUIMemoApp.swift
//  Shared
//
//  Created by 김화균 on 2022/04/10.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    @StateObject var store = MemoStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store) // 이어지는 View에서 동일한 객체를 쉽게 사용할 수 있음
        }
    }
}
