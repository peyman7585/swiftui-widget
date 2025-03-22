//
//  ContentView.swift
//  WidgetDemo
//
//  Created by Peyman on 3/22/25.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("streak")   var  streak = 0
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                Spacer()
                ZStack{
                    Circle()
                        .stroke(.white.opacity(0.1), lineWidth: 20)
                        
                    Circle()
                        .trim(from: 0,to: 0.34)
                        .stroke(.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round ))
                        .rotationEffect(.init(degrees: -90))
                        
                    VStack{
                        Text("Streak")
                            .font(.largeTitle)
                        Text(String(streak))
                            .font(.system(size: 70, weight: .bold))
                    }
                    .foregroundStyle(.white)
                    .fontDesign(.rounded)
                }
                .padding(.horizontal,50)
                
                Spacer()
                Button{
                    streak += 1
                
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.blue)
                            .frame(height: 50)
                        Text("+1")
                            .foregroundStyle(.white)
                    }
                  
                }
                .padding(.horizontal)
                Spacer()
            }
            .padding()
            
        }
       
    
    }
}

#Preview {
    ContentView()
}
