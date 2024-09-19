//
//  PhaseSpecificInsightView.swift
//  Ovaya
//
//  Created by Yash Somkuwar on 11/09/24.
//

import SwiftUI

struct PhaseSpecificInsightsView: View {
    @ObservedObject var viewModel: PeriodViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Phase Insights")
                .font(.headline)
                .foregroundColor(AppStyle.primaryColor)
            
            if let currentPhase = viewModel.currentPhase {
                phaseOverview(for: currentPhase)
                insightCards(for: currentPhase)
            } else {
                Text("Track your cycle to get personalized insights!")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    
    private func phaseOverview(for phase: CyclePhase) -> some View {
        HStack {
            Image(systemName: phaseIcon(for: phase))
                .foregroundColor(phaseColor(for: phase))
                .font(.title2)
            VStack(alignment: .leading, spacing: 4) {
                Text(phase.rawValue.capitalized)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(phaseDuration(for: phase))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    private func insightCards(for phase: CyclePhase) -> some View {
        VStack(spacing: 12) {
            insightCard(
                title: "Physical",
                content: physicalInsight(for: phase),
                icon: "figure.walk"
            )
            insightCard(
                title: "Emotional",
                content: emotionalInsight(for: phase),
                icon: "heart.fill"
            )
            insightCard(
                title: "Productivity",
                content: productivityInsight(for: phase),
                icon: "chart.bar.fill"
            )
            insightCard(
                title: "Nutrition",
                content: nutritionInsight(for: phase),
                icon: "leaf.fill"
            )
        }
    }
    
    private func insightCard(title: String, content: String, icon: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(phaseColor(for: viewModel.currentPhase ?? .follicular))
                .font(.title3)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(content)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(phaseColor(for: viewModel.currentPhase ?? .follicular).opacity(0.1))
        .cornerRadius(10)
    }
    
    private func phaseIcon(for phase: CyclePhase) -> String {
        switch phase {
        case .menstrual: return "drop.fill"
        case .follicular: return "leaf.fill"
        case .ovulation: return "sparkles"
        case .luteal: return "moon.fill"
        }
    }
    
    private func phaseColor(for phase: CyclePhase) -> Color {
        switch phase {
        case .menstrual: return .red
        case .follicular: return .green
        case .ovulation: return .blue
        case .luteal: return .purple
        }
    }
    
    private func phaseDuration(for phase: CyclePhase) -> String {
        switch phase {
        case .menstrual: return "Typically lasts 3-7 days"
        case .follicular: return "Usually 7-10 days after menstruation"
        case .ovulation: return "About 24 hours, midway through cycle"
        case .luteal: return "Usually 10-14 days before next period"
        }
    }
    
    private func physicalInsight(for phase: CyclePhase) -> String {
        switch phase {
        case .menstrual:
            return "You may experience fatigue and cramps. Light exercise like yoga can help alleviate discomfort."
        case .follicular:
            return "Your energy is increasing. It's a great time for high-intensity workouts and new physical challenges."
        case .ovulation:
            return "You're likely feeling your best physically. Take advantage of peak energy levels for demanding activities."
        case .luteal:
            return "You might notice bloating and breast tenderness. Gentle exercises like walking can help manage symptoms."
        }
    }
    
    private func emotionalInsight(for phase: CyclePhase) -> String {
        switch phase {
        case .menstrual:
            return "You may feel more introspective. It's a good time for reflection and self-care activities."
        case .follicular:
            return "Your mood is likely improving. Embrace social activities and new experiences."
        case .ovulation:
            return "You might feel more confident and outgoing. Great time for important social or work interactions."
        case .luteal:
            return "You may experience mood swings. Practice stress-reduction techniques like meditation or journaling."
        }
    }
    
    private func productivityInsight(for phase: CyclePhase) -> String {
        switch phase {
        case .menstrual:
            return "Focus on planning and organization. It's a good time for brainstorming and setting intentions."
        case .follicular:
            return "Your creativity is high. Start new projects and tackle challenging tasks."
        case .ovulation:
            return "Your communication skills are enhanced. Schedule important meetings or presentations."
        case .luteal:
            return "You excel at detailed work. Focus on completing existing projects and tying up loose ends."
        }
    }
    
    private func nutritionInsight(for phase: CyclePhase) -> String {
        switch phase {
        case .menstrual:
            return "Focus on iron-rich foods like leafy greens and lean meats to replenish iron lost during menstruation."
        case .follicular:
            return "Eat foods high in antioxidants like berries and nuts to support hormonal balance."
        case .ovulation:
            return "Incorporate foods rich in zinc and magnesium, such as pumpkin seeds and dark chocolate."
        case .luteal:
            return "Opt for complex carbohydrates and foods high in B vitamins to help manage PMS symptoms."
        }
    }
}
#Preview {
    PhaseSpecificInsightsView()
}
