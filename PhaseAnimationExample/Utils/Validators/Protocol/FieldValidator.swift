protocol FieldValidator {
    var isValid: Bool { get set }
    var errorMessage: String { get }
    
    func validate(_ text: String)
}
