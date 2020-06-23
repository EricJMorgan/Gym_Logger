//
//  HomeView.swift
//  Gym Logger
//
//  Created by Eric Morgan on 2019-11-22.
//  Copyright © 2019 Eric Morgan. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView() {
            VStack {
                Spacer()
                    .frame(height: 11.0)
                // top button to navigate
                NavigationLink(destination: Exercises()) {
                    
                    Spacer()
                    Text("Start a Workout")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .lineLimit(2)
                        .padding(.all)
                        .blendMode(.hardLight)
                        .background(Color(red: 0.2, green: 0.3, blue: 0.4, opacity: 1.0) .cornerRadius(10))
                        .offset(x:-93, y: 70)
                        //.cornerRadius(10.0)
                        
                    //Spacer()
                }
                .frame(height:230)
                .background(Image("grayscale_barbell").resizable())
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                .shadow(radius: 6)
                
               // .offset(x: 0, y: -80)
                Spacer()
                    .frame(height: 20.0)
                NavigationLink(destination: LogView()) {
                                   
                   Spacer()
                   Text("View Log")
                       .font(.title)
                       .fontWeight(.bold)
                       .foregroundColor(Color.white)
                       .lineLimit(2)
                       .padding(.all)
                       .blendMode(.hardLight)
                       .background(Color(red: 0.5, green: 0.6, blue: 0.1, opacity: 1.0) .cornerRadius(10))
                       .offset(x:-177, y: 40)
                       //.cornerRadius(10.0)
                       
                   //Spacer()
               }
               .frame(height:170)
               .background(Image("planner").resizable())
               .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
               .shadow(radius: 6)
                /*
                NavigationLink(destination: LogView()) {
                    Spacer()
                    Text("View My Log")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1.0))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .padding(.all)
                        .blendMode(/*@START_MENU_TOKEN@*/.hardLight/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                .frame(height:70)
                .background(Color.white)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                .shadow(radius: 6)
               // .offset(x: 0, y: -40)
 */
            Spacer()
                /*
                NavigationLink(destination: Exercises()) {
                    Text("View Calendar")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1.0))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .padding(.leading)
                        .blendMode(/*@START_MENU_TOKEN@*/.hardLight/*@END_MENU_TOKEN@*/)
                    
                }
                .padding(.horizontal)
                .frame(height:60)
                .background(Color.white)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                .shadow(radius: 6)
                */
                // bottom 2 buttons
               /* HStack {
                    NavigationLink(destination: Exercises()) {
                        Text("View My Log")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1.0))
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .padding(.leading)
                            .blendMode(/*@START_MENU_TOKEN@*/.hardLight/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.horizontal)
                    .frame(width:150, height:150)
                    .background(Color.white)
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 6)
                    
                    NavigationLink(destination: Exercises()) {
                        Text("Add a Custom Activity")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1.0))
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                            .padding(.leading)
                            .blendMode(/*@START_MENU_TOKEN@*/.hardLight/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.horizontal)
                    .frame(width:150, height:150)
                    .background(Color.white)
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 6)
                }*/
                
            }
            .padding()
            .navigationBarTitle("Welcome Back!")
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
