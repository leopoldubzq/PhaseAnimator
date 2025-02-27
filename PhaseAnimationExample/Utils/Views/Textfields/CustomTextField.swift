import SwiftUI

struct CustomTextField<Validator: FieldValidator>: View {
    
    let type: InputType
    @Binding var text: String
    @State var validator: Validator
    @FocusState var isFocused: Bool
    var isSecure: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            getTextField()
                .padding(12)
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.secondary.opacity(0.15))
                        
                }
                .focused($isFocused)
                .background {
                    if validator.isValid == false {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(lineWidth: 1.5)
                            .fill(.red.opacity(0.7))
                    }
                }
                .textInputAutocapitalization(.never)
                .phaseAnimator([0, 7, -7, 4, -4, 0], trigger: validator.isValid) { content, offset in
                    content
                        .offset(x: validator.isValid ? 0 : offset)
                } animation: { _ in
                        .snappy(duration: 0.07, extraBounce: 0.0)
                }

            if validator.isValid == false {
                errorMessageText
            }
        }
        .animation(.easeInOut(duration: 0.2), value: validator.isValid)
    }
    
    @ViewBuilder
    private func getTextField() -> some View {
        if isSecure {
            SecureField(type.rawValue, text: $text)
        } else {
            TextField(type.rawValue, text: $text)
        }
    }
    
    private var errorMessageText: some View {
        Text(validator.errorMessage)
            .foregroundStyle(.red)
            .font(.caption)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            .padding(.top, 4)
            .frame(height: 20)
            .transition(.blurReplace)
    }
}

#Preview {
    MainScreen()
}
