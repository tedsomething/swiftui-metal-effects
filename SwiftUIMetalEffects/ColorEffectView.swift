import SwiftUI

struct ColorEffectView: View {
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
            .drawingGroup()
            .colorEffect(ShaderLibrary.rainbow(
                .float(time)
            ))
        }
    }
}

#Preview {
    ColorEffectView()
}
