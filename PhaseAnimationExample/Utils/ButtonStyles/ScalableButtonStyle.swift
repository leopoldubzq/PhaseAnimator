import SwiftUI

struct ScalableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == ScalableButtonStyle {
    static var scalable: ScalableButtonStyle {
        get { ScalableButtonStyle() }
    }
}
