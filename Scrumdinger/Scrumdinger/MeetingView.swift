//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Aryan on 10/6/22.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack{
            ProgressView(value: 5, total: 20.0)
            Spacer(minLength: 50)
            HStack{
                VStack{
                    Text("Hello WOrld")
                    Spacer(minLength: 25)
                    Label("hello", systemImage: "hourglass.tophalf.fill")
                }
            }
        }
    }
}

struct MeetingView_Preview: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
