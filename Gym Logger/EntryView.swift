//
//  EntryView.swift
//  Gym Logger
//
//  Created by Eric Morgan on 2020-02-01.
//  Copyright © 2020 Eric Morgan. All rights reserved.
//

import Combine
import SwiftUI

class exerciseEntry: ObservableObject, Codable {
    enum CodingKeys: String, CodingKey {
        case name, notes, reps, weight, sets
    }
    var objectWillChange = ObservableObjectPublisher()
    
    //static let validReps = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    // may be switched out for a log per set
    var name: String {willSet { update() }}
    var notes: String {willSet { update() }}
    var reps: String {willSet { update() }}
    var weight: String {willSet { update() }}
    var sets = 0 {willSet { update() }}
    
    init() {
        name = ""
        notes = ""
        reps = ""
        weight = ""
        sets = 1
    }
    
    // update the variable inside of the class
    func update() {
        objectWillChange.send()
    }
    
    // variable to hold validity status
    func isValidEntry() -> Bool {
        if name.isEmpty || reps.isEmpty || weight.isEmpty {
            return false
        }
        return true
    }
}

struct EntryView: View {
    @ObservedObject var entry = exerciseEntry()
    @State private var setStartVal = 1
    
    @State var confirmationMessage = ""
    @State var showingConfirmation = false
   
    
    var body: some View {
        NavigationView {
           Form {
                Section {
                    TextField("Exercise Name", text: $entry.name)
                
                }
                Section {
                    TextField("Weight", text: $entry.weight)
                        .keyboardType(.numberPad)
                    
                    TextField("Reps", text: $entry.reps)
                        .keyboardType(.numberPad)

                    Stepper(value: $entry.sets, in: 1...20){
                        Text("Sets: \(entry.sets)")
                    }
                }
                Section {
                    TextField("Notes (optional)", text: $entry.notes)
                }
                Section {
                    Button(action: {
                        self.addEntry()
                    }) {
                        Text("Add Entry")
                    }
                }.disabled(!entry.isValidEntry())
            }
            .navigationBarTitle("New Entry")
        
            .alert(isPresented: $showingConfirmation){
                   Alert(title: Text("Entry logged!"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
               }
        }
       
    }
    
    func addEntry(){
        guard let encoded = try? JSONEncoder().encode(entry) else {
            print("Failed to encode entry")
            return
        }
        
        let apiURL = URL(string: "https://reqres.in/api/entry")!
        
        var request = URLRequest(url: apiURL)
        request.setValue("application/json",forHTTPHeaderField:"Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { (data, res, err) in
            guard let returnedData = data else {
                print("No data returned")
                return
            }
            if let decodedEntry = try? JSONDecoder().decode(exerciseEntry.self, from: returnedData){
                self.confirmationMessage = "\(decodedEntry.name) has been logged."
                self.showingConfirmation = true
            }else{
                let dataString = String(decoding: returnedData, as: UTF8.self)
                print("Invalid response \(dataString)")
            }
        }.resume()
        
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView()
    }
}
