//
//  Player.swift
//  ScoreKeeper
//
//  Created by Uri on 29/12/25.
//

import Foundation
import UIKit

struct Player: Identifiable {
    let id = UUID()
    var name: String
    var score: Int
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}
