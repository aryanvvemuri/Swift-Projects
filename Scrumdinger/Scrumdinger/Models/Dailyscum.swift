//
//  Dailyscum.swift
//  Scrumdinger
//
//  Created by Aryan on 10/6/22.
//

import Foundation


struct Dailyscum{
    var title: String
    var attendies: [String]
    var theme: Theme
    
}

extension Dailyscum {
    static let sampleData: [Dailyscum] =
    [
        Dailyscum(title: "Design", attendies: ["Cathy", "Daisy", "Simon", "Jonathan"], theme: .yellow),
        Dailyscum(title: "App Dev", attendies: ["Katie", "Gray", "Euna", "Luis", "Darla"], theme: .orange),
        Dailyscum(title: "Web Dev", attendies: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], theme: .poppy)
    ]
}
