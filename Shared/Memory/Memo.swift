//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by 김화균 on 2022/04/10.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject {
//    Identifiable: data를 list에 쉽게 binding 하기 위함
//    ObservableObject: memo를 수정할 때 View를 자동으로 update 하기 위해 필요함
    let id: UUID
    @Published var content: String // Published 속성 -> 해당 값이 update될 때 마다 자동으로 View update
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date.now) {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
    
}
