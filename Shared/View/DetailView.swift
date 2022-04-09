//
//  DetailView.swift
//  SwiftUIMemo
//
//  Created by 김화균 on 2022/04/10.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer = false
    
    var body: some View {
        VStack {
            ScrollView {
                // default: vertical scroll
                VStack {
                    HStack {
                        Text(memo.content)
                            .padding()
                        
                        Spacer(minLength: 0) // 위에 Text를 옆으로  밀기 위해 사용
                    }
                    
                    Text(memo.insertDate, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("메모 보기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $showComposer) {
            ComposeView(memo: memo)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(memo: Memo(content: "Hello"))
                .environmentObject(MemoStore())
        }
    }
}
