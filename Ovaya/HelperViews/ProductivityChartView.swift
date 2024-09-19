//
//  ProductivityChartView.swift
//  Ovaya
//
//  Created by Yash Somkuwar on 23/08/24.
//

import SwiftUI

struct ProductivityChartView: View {
    var body: some View {
        VStack {
            Text("Productivity Chart")
                .font(AppStyle.titleFont)
                .foregroundColor(AppStyle.primaryColor)
            
            // Placeholder for actual chart
            Rectangle()
                .fill(AppStyle.secondaryColor)
                .frame(height: 200)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ProductivityChartView()
}
