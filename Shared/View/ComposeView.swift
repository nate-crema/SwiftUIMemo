//
//  ComposeView.swift
//  SwiftUIMemo
//
//  Created by 김화균 on 2022/04/10.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    
    var memo: Memo? = nil
    
    @Environment(\.dismiss) var dismiss
    
    @State private var content: String = "" // State Variable
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content) // to-A binding 방식
                    .padding()
                    .onAppear {
                        // TextEditor의 초기값 내용
                        if let memo = memo {
                            content = memo.content
                        }
                    }
            }
            .navigationTitle(memo != nil ? "메모 편집" : "새 메모") // navigation title
            .navigationBarTitleDisplayMode(.inline) // navigation title mode: inline -> large title mode disable
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) { // Leading: 왼쪽
                    Button {
                        dismiss() // Button function
                    } label: {
                        Text("취소") // Button title
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    // Trailing: 오른쪽
                    Button {
                        if let memo = memo {
                            store.update(memo: memo, content: content)
                        } else {
                            store.insert(memo: content)
                        }
                        
                        dismiss() // Button function
                    } label: {
                        Text("저장") // Button title
                    }
                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore())
    }
}
