# 🚀 Shake Effect in SwiftUI with .phaseAnimator

A simple and effective way to enhance user feedback in text field validation by using **shake effect** in **SwiftUI**. This implementation uses the **.phaseAnimator** modifier, available from iOS 17, to create a subtle shaking animation when a validation error occurs.

## 📸 Preview

<img src="https://github.com/user-attachments/assets/420d25bb-f132-4eb1-a445-6b7ad04d220b" width=30%>

## ✨ Features

- 🚀 Uses **.phaseAnimator** to create a smooth shake effect
- ⚡ Enhances user feedback by clearly indicating validation errors
- 🔧 Simple and reusable implementation in SwiftUI

## 🛠️ Implementation

### 📌 Example code
```swift
import SwiftUI

struct ShakingTextField: View {
    @State private var text: String = ""
    @State private var isError: Bool = false
    
    var body: some View {
        VStack {
            TextField("Enter text", text: $text)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(isError ? Color.red : Color.gray)
                        .phaseAnimator([0, 7, -7, 4, -4, 0], trigger: isError, content: { content, offset in
                            content.offset(x: isError ? offset : 0)
                        }, animation: { _ in
                                .snappy(duration: 0.07, extraBounce: 0.0)
                        })
                }
                .onSubmit {
                    validate()
                }
            Button("Validate") {
                validate()
            }
            .padding(.top)
        }
        .padding()
    }
    
    private func validate() {
        isError = text.count < 6
    }
}

#Preview {
    ShakingTextField()
}
```

## 🔥 Requirements

- 📱 **iOS 17+**
- 💻 **Xcode 15+**
- 🔹 **SwiftUI**

## 📌 Additional Improvements

- 🎨 **Custom Styling:** Adjust colors, border effects, or add shadows for more visual appeal.
- 🛠 **Reusability:** Wrap the effect into a SwiftUI modifier for easy reuse.

## 🌟 Contribute

If you find this useful, give it a ⭐ on GitHub! Contributions are welcome—feel free to submit a PR or open an issue.


