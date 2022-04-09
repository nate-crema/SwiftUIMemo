//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by 김화균 on 2022/04/10.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store : MemoStore
    // View가 생성되는 시점에 공유 데이터 목록을 확인 후, Store 속성과 동일한 type을 가진 instance가 등록되어 있다면, Store 속성을 해당 instance로 자동으로 초기화
    // 하나의 데이터를 여러 View에서 공유하고 싶을 때 사용
    
    var body: some View {
        NavigationView { // Cmd + Shift + A -> embed => NavigationView
            List(store.list) { memo in
                MemoCell(memo: memo)
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")
            // [ SwiftUI ]
            /*
                modifier라는 특별한 method -> 필요한 속성 변경 or View 조작
            */
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}
