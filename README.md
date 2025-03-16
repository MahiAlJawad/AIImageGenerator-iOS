# AIImageGenerator-iOS

A simple demo of Apple's new in-house Apple Intelligence Image Playground integration in Swift iOS App. Since Apple has released its Apple Intelligence features including AI Image Playground, now developers also can take advantage of Apple Intelligence features in their App.

To use AI Image Playground inside your App, Swift has released some APIs. The SwiftUI version is as follows:

```swift
imagePlaygroundSheet(isPresented: Binding<Bool>, concept: String, sourceImage: Image? = nil, onCompletion: @escaping (_ url: URL) -> Void, onCancellation: (() -> Void)? = nil) -> some View
```

Check out the API documentation in [here](https://developer.apple.com/documentation/swiftui/view/imageplaygroundsheet(ispresented:concept:sourceimage:oncompletion:oncancellation:)).


## Simple Demo

// Video will be attached later


## Code example

Inside a SwiftUI `View`'s `body`, the following modifier does the work:

```swift
    var body: some View {
        VStack {
            textFieldView
            generateButton
            imageView
        }
// <------ Here you go ------->
        .imagePlaygroundSheet(isPresented: $showImagePlayground, concept: text, onCompletion: { url in
            imageURL = url
        }, onCancellation: {
            print("Cancelled")
        })
        .navigationTitle("Generate Image")
    }
```

There are more options such as giving photo input and making an AI image out of it using input photo characters. For long text, there are options for giving a `concept` array and so on. Check out the detail API documentation for details.

Here's the `UIKit` alternative [AI Image Playground for UIKit](https://developer.apple.com/documentation/imageplayground/imageplaygroundviewcontroller)
