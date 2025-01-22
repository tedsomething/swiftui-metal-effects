import SwiftUI

struct DistortionEffectView: View {
    @State var start: Date = .now
    
    var body: some View {
        TimelineView(.animation) { tl in
            let time = start.distance(to: tl.date)
            
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
            .visualEffect { content, proxy in
                content
                    .distortionEffect(
                        ShaderLibrary.waveFlag(
                            .float(time),
                            .float2(proxy.size)
                        ),
                        maxSampleOffset: .zero
                    )
            }
        }
    }
}

#Preview {
    DistortionEffectView()
}
