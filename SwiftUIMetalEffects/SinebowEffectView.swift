import SwiftUI

struct SinebowEffectView: View {
    @State var start: Date = .now
    
    var body: some View {
        TimelineView(.animation) { tl in
            let time = start.distance(to: tl.date)
            
            Rectangle()
                .visualEffect { content, proxy in
                    content.colorEffect(
                        ShaderLibrary.sinebow(
                            .float2(proxy.size),
                            .float(time)
                        )
                    )
                }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SinebowEffectView()
}
