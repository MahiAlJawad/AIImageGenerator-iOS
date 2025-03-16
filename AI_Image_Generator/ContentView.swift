//
//  ContentView.swift
//  AI_Image_Generator
//
//  Created by Mahi Al Jawad on 15/3/25.
//

import SwiftUI
import ImagePlayground

@available(iOS 18.1, macOS 15.1, *)
struct ContentView: View {
    @State private var showImagePlayground: Bool = false
    @State private var imageURL: URL?
    @State private var text: String = ""
    
    var imageView: some View {
        AsyncImage(url: imageURL) { image in
            image
                .resizable()
        } placeholder: {
            Text("No Image Generated!!!")
        }
        .frame(width: 400, height: 400)
        .border(.foreground, width: 2.0)
    }
    
    var textFieldView: some View {
        TextField("Enter text to generate image", text: $text, axis: .vertical)
            .textFieldStyle(.roundedBorder)
            .lineLimit(3...5)
            .border(.gray, width: 1.0)
            .padding(.horizontal)
    }
    
    var generateButton: some View {
        HStack {
            Button(action: {
                showImagePlayground = true
            }, label: {
                Text("Generate")
            })
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
            Spacer()
        }
    }
    
    var body: some View {
        VStack {
            textFieldView
            generateButton
            imageView
        }
        .imagePlaygroundSheet(isPresented: $showImagePlayground, concept: text, onCompletion: { url in
            imageURL = url
        }, onCancellation: {
            print("Cancelled")
        })
        .navigationTitle("Generate Image")
    }
}

#Preview {
    ContentView()
}
