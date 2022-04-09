//
//  MemoCell.swift
//  SwiftUIMemo
//
//  Created by 김화균 on 2022/04/10.
//

import SwiftUI

struct MemoCell: View {
    @ObservedObject var memo: Memo
    
    var body: some View {
        VStack(alignment: .leading) {// Cmd + Shift + A -> embed in VStack
            /*
             VStack: Vertical Stack
             => 포함된 View를 수직으로 나란히 배치
             => 수평으로는 가운데 정렬이 default (좌측정렬: alignment: .leading)
             */
            Text(memo.content)
                .font(.body) // font style
                .lineLimit(1) // 메모 내용을 1줄만 표시. 길경우 자동 생략
            
            Text(memo.insertDate, style: .date)
                .font(.caption)
                .foregroundColor(.secondary) // font color
        }
    }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "Test"))
    }
}
