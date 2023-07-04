//
//  InitialView.swift
//  testsample
//
//  Created by 泰山恭輔 on 2023/07/04.
//

import SwiftUI

struct InitialView: View {
    @State private var isSearchViewPresented = false
    
    var body: some View {
        if isSearchViewPresented {
            searchView()
        } else {
            VStack {
                Text("This is the initial view.")
                    .font(.title)
                    .padding()
                
                Button(action: {
                    isSearchViewPresented = true
                }) {
                    Text("Go to Search View")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}

