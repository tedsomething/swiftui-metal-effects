import SwiftUI

struct LayerEffectView: View {
    @State var start: Date = .now
    @State var touch: CGPoint = .zero
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Hello, world!")
        }
        .padding()
        .background(.teal.secondary)
        .padding()
        .background(.white)
        .drawingGroup()
        .visualEffect { [touch] content, proxy in // Fix for Swift 6 (https://www.reddit.com/r/iOSProgramming/comments/1dowu10/swift_6_main_actorisolated_property/)
            content
                .layerEffect(
                    ShaderLibrary.loupe(
                        .float2(proxy.size),
                        .float2(touch)
                    ),
                    maxSampleOffset: .zero
                )
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged {  touch = $0.location  }
        )
    }
}

#Preview {
    LayerEffectView()
}
