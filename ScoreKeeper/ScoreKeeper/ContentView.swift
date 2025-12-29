//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Uri on 29/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = [Player(name: "Dani", score: 0, color: .blue),
                                            Player(name: "Larry", score: 0, color: .red),
                                            Player(name: "Oscar", score: 0, color: .orange)]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)

            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)

                ForEach($players) { $player in
                    GridRow {
                        TextField("Name", text: $player.name)
                        Text("\(player.score)")
                            .foregroundStyle(Color(player.color))
                        Stepper("\(player.score)", value: $player.score, in: 0...20)
                            .labelsHidden()
                    }
                }
            }
            .padding(.vertical)

            Button("Add Player", systemImage: "plus") {
                players.append(Player(name: "", score: 0, color: .black))
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
