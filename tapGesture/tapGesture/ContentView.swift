//
//  ContentView.swift
//  tapGesture
//
//  Created by 전지훈 on 2022/04/27.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    @State private var icons: Image = Image(systemName: "minus.circle")
    var body: some View {
        ZStack {
            VStack {
                Text("\(count)")
                    .font(.system(size: 250))
                    .onTapGesture(count: 2) {
                        count = 0
                    }
                    .onTapGesture {
                        count += 1
                    }
                
                HStack {
                    Image(systemName: "minus.circle")
                        .font(.system(size: 100))
                        .foregroundColor(.red)
                        .padding()
                        .gesture(
                            TapGesture()
                                .onEnded {
                                    if count > 0 {
                                        self.count -= 1
                                    } else {
                                        self.count = 0
                                    }
                                }
                        )
                    
                    Image(systemName: "plus.circle")
                        .font(.system(size: 100))
                        .foregroundColor(.blue)
                        .padding()
                        .gesture(
                            TapGesture()
                                .onEnded {
                                        self.count += 1
                                }
                        )
                }
            }
            
            Image(systemName: "")
                .resizable()
                .foregroundColor(.black)
                .gesture(
                    TapGesture()
                        .onEnded {
                            DispatchQueue.main.async {
                                self.icons
                            }
                        }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
