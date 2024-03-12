//
//  CardView.swift
//  Scrumdinger
//
//  Created by Aryan on 10/6/22.
//

import SwiftUI

struct CardView: View {
    let scrum: Dailyscum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
            HStack {
                Label("\(scrum.attendies.count)", systemImage: "person.3")
                Spacer()

            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = Dailyscum.sampleData[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
    }
}
