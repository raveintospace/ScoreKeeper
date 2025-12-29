//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by Uri on 29/12/25.
//

import Testing
@testable import ScoreKeeper

struct ScoreKeeperTests {

    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {

        // Given
        var scoreboard = Scoreboard(players: [Player(name: "Dani", score: 5),
                                              Player(name: "Larry", score: 6)
                                             ])

        // When
        scoreboard.resetScores(to: newValue)

        // Then
        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }

    @Test("Highest score wins")
    func highestScoreWins() {

        // Given
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Dani", score: 10),
                Player(name: "Larry", score: 5)
            ],
            state: .gameOver,
            doesHighestScoreWin: true
        )

        // When
        let winners = scoreboard.winners

        // Then
        #expect(winners == [Player(name: "Dani", score: 10)])
    }

    @Test("Lowest score wins")
    func lowestScoreWins() {

        // Given
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Dani", score: 10),
                Player(name: "Larry", score: 5)
            ],
            state: .gameOver,
            doesHighestScoreWin: false
        )

        // When
        let winners = scoreboard.winners

        // Then
        #expect(winners == [Player(name: "Larry", score: 5)])
    }

}
