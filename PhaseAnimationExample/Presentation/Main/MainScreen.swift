import SwiftUI

struct MainScreen: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @FocusState private var passwordFocused: Bool
    @FocusState private var usernameFocused: Bool
    
    private var defaultValidator = DefaultValidator()
    private var passwordValidator = PasswordValidator()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                CustomTextField(
                    type: .username,
                    text: $username,
                    validator: defaultValidator,
                    isFocused: _passwordFocused
                )
                
                CustomTextField(
                    type: .password,
                    text: $password,
                    validator: passwordValidator,
                    isFocused: _usernameFocused,
                    isSecure: true
                )
                
                validateButton
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.background)
            .onTapGesture {
                passwordFocused = false
                usernameFocused = false
            }
            .padding()
            .navigationTitle("Register")
        }
    }
    
    private var validateButton: some View {
        Button { validateFields() } label: {
            Text("Validate")
                .bold()
                .font(.system(size: 18))
                .frame(maxWidth: .infinity)
                .padding()
                .background(.red)
                .clipShape(.rect(cornerRadius: 12))
                .foregroundStyle(.white)
        }
        .buttonStyle(.scalable)
    }
    
    private func validateFields() {
        defaultValidator.validate(username)
        passwordValidator.validate(password)
    }
}

#Preview {
    MainScreen()
}
