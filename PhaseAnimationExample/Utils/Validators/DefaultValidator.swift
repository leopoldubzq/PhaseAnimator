import SwiftUI

@Observable
final class DefaultValidator: FieldValidator {
    
    var isValid: Bool = true
    
    var errorMessage: String {
        "Field cannot be empty"
    }
    
    func validate(_ text: String) {
        isValid = text.isEmpty == false
    }
}
