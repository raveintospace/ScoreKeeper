//
//  Scoreboard.swift
//  ScoreKeeper
//
//  Created by Uri on 29/12/25.
//

import Foundation

struct Scoreboard {

    var players: [Player] = [
        Player(name: "Dani", score: 0),
        Player(name: "Larry", score: 0),
        Player(name: "Oscar", score: 0)
    ]

    var state = GameState.setup

    mutating func resetScores(to newValue: Int) {}
}
