//
//  PeriodCalendarView.swift
//  Ovaya
//
//  Created by Yash Somkuwar on 23/08/24.
//

import SwiftUI

struct PeriodCalendarView: View {
    @ObservedObject var viewModel: PeriodViewModel
    @State private var selectedDate = Date()
    @State private var showingAddEntry = false
    
    var body: some View {
        NavigationView {
            VStack {
                CalendarView(viewModel: viewModel, selectedDate: $selectedDate)
                    .frame(height: 330)
                
                if let duration = viewModel.predictedDuration {
                    InfoCard(title: "Predicted Duration", content: "\(duration) days")
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Period Calendar")
            .background(AppStyle.backgroundColor.edgesIgnoringSafeArea(.all))
            .floatingActionButton(
                systemName: "plus.circle.fill",
                text: "Add Entry",
                action: { showingAddEntry = true },
                alignment: .bottomTrailing,
                horizontalPadding: 20,
                verticalPadding: 40
            )
            .sheet(isPresented: $showingAddEntry) {
                AddEntryView(viewModel: viewModel)
            }
        }
    }
}

//#Preview {
//    PeriodCalendarView()
//}
