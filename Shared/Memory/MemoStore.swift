//
//  MemoStore.swift
//  SwiftUIMemo
//
//  Created by 김화균 on 2022/04/10.
//

import Foundation

class MemoStore: ObservableObject {
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "Hello", insertDate: Date.now),
            Memo(content: "Awesome", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "SwiftUI", insertDate: Date.now.addingTimeInterval(3600 * -48)),
        ]
    }
    
    // CRUD Functions
    
    // Insert(Create)
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0) // 새로운 memo를 0번 index에 추가 -> 항상 새로운 메모가 최상단에 표시됨
    }
    
    // Update
    func update(memo: Memo?, content: String) {
        guard let memo = memo else {
            return
        }
        
        memo.content = content
    }
    
    // Delete
    func delete(memo: Memo) {
        list.removeAll { $0.id == memo.id }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}
