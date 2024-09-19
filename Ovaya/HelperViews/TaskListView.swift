//
//  TaskListView.swift
//  Ovaya
//
//  Created by Yash Somkuwar on 23/08/24.
//

import SwiftUI

struct TaskListView: View {
    var body: some View {
        VStack {
            Text("Today's Tasks")
                .font(AppStyle.titleFont)
                .foregroundColor(AppStyle.primaryColor)
            
            // Placeholder for actual task list
            ForEach(0..<3) { _ in
                HStack {
                    Image(systemName: "circle")
                    Text("Sample Task")
                        .font(AppStyle.bodyFont)
                }
                .padding(.vertical, 5)
            }
        }
        .padding()
        .background(AppStyle.roundedRectBackground())
    }
}
#Preview {
    TaskListView()
}
