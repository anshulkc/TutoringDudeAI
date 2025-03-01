//
//  ContentView.swift
//  TutoringDudeAI
//
//  Created by Anshul Chennavaram on 2/28/25.
//

import SwiftUI

struct ContentView: View {
    var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]
    @State private var selected = "Baseball"
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]
    @State private var id = 1
    var body: some View {
        VStack {
            Text("\(selected)!")
                .font(.largeTitle.bold())
        }
        Spacer()
        VStack {
            Circle()
                .fill(colors.randomElement() ?? .blue)
                .padding()
                .overlay(
                    Image(systemName: "figure.\(selected.lowercased())")
                        .font(.system(size: 144))
                        .foregroundColor(.white)
                )
                .transition(.slide)
                .id(id)
            Text("\(selected)")
                .font(.title)
        }
        Spacer()
        Button("Try again") {
            withAnimation(.easeInOut(duration: 1)) {
                selected = activities.randomElement() ?? "Archery"
                id += 1
            }
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    ContentView()
}
