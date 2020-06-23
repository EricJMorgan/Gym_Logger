//
//  ContentView.swift
//  Gym Logger
//
//  Created by Eric Morgan on 2019-11-22.
//  Copyright © 2019 Eric Morgan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
       HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
