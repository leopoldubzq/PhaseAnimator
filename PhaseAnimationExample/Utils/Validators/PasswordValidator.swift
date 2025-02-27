import SwiftUI

@Observable
final class PasswordValidator: FieldValidator {
    
    var isValid: Bool = true
    
    var errorMessage: String {
        "Password has to be at least 8 characters long"
    }
    
    func validate(_ text: String) {
        isValid = text.count >= 8 && text.isEmpty == false
    }
}
