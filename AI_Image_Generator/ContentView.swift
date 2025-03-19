//
//  ContentView.swift
//  AI_Image_Generator
//
//  Created by Mahi Al Jawad on 15/3/25.
//

import SwiftUI
import ImagePlayground

@available(iOS 18.1, macOS 15.1, *)
struct ImageDescriptionView: View {
    @FocusState var isFocusedTextField: Bool
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
    }
    
    var textFieldView: some View {
        TextField("Describe an image to generate", text: $text, axis: .vertical)
            .focused($isFocusedTextField)
            .textFieldStyle(.roundedBorder)
            .lineLimit(3...5)
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button {
                        isFocusedTextField.toggle()
                    } label: {
                        Text("Done")
                    }

                }
            }
    }
    
    var generateButton: some View {
        Button(action: {
            showImagePlayground = true
        }, label: {
            Text("Generate")
                .frame(height: 35)
                .frame(maxWidth: .infinity)
        })
        .buttonStyle(.borderedProminent)
        .padding(.horizontal)
        .disabled(text == "")
    }
    
    var body: some View {
        List {
            if imageURL != nil {
                imageView
                    .listRowSeparator(.hidden)
            }
            textFieldView
                .listRowSeparator(.hidden)
            generateButton
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .imagePlaygroundSheet(isPresented: $showImagePlayground, concept: text, onCompletion: { url in
            imageURL = url
            isFocusedTextField = false
            text = ""
        }, onCancellation: {
            isFocusedTextField = false
            text = ""
            print("Cancelled")
        })
        .navigationTitle("Generate AI Image")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ImageDescriptionView()
}
