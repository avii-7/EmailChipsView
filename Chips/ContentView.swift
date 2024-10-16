//
//  ContentView.swift
//  Chips
//
//  Created by Arun Kumar on 01/10/24.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        EditorView()
        //myView2
            //.padding()
    }
}

#Preview {
    ContentView()
}


//extension ContentView {
//    
//    private var myView: some View {
//        ScrollView(.horizontal) {
//            HStack(alignment: .center) {
//                TextField("Enter your email", text: $text)
//                    .background(.gray)
//            }
//            .background(.blue)
//        }
//        .padding()
//    }
//    
//    
//    private var myView2: some View {
//        VStack (alignment: .leading) {
//            HStack(alignment: .center) {
//                
//                Text("Hey I'm Arun,")
//                    .lineLimit(1)
//                    .layoutPriority(1)
//                
//                ScrollView(.horizontal) {
//                    TextField("Enter your email", text: $text, axis: .horizontal)
//                        .background(.gray)
//                        .lineLimit(1)
//                        .textFieldStyle(.plain)
//                }
//                .onScrollGeometryChange(for: [Double].self) { scrollGeometry in
//                    [
//                        scrollGeometry.contentSize.width,
//                        scrollGeometry.containerSize.width
//                    ]
//                } action: { _, newValue in
//                    print(newValue)
//                    if newValue[0] > newValue[1] {
//                        print("move to next line")
//                    }
//                }
//            }
//            //.fixedSize()
//            //.background(.blue)
//        }
//        .background(.cyan)
//        
//    }
//    
//    private var myView3: some View {
//        VStack(alignment: .leading) {
//            
//            HStack(alignment: .center) {
//            ForEach (emails, id: \.self) { item in
//                
//                    
//                    Text(item)
//                        .lineLimit(1)
//                        .layoutPriority(20)
//                        .onAppear(perform: {
//                            print(item)
//                        })
//                    
//                    
//                }
//            }
//            .onAppear(perform: {
//                print("item")
//            })
//            .background(.red)
//            
//            Button("Add") {
//                emails.append("arun3@yahoo.com")
//            }
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(.green)
//    }
//}
