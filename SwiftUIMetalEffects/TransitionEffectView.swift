import SwiftUI

extension AnyTransition {
    static let circles: AnyTransition =
        .modifier(
            active: CirclesTransition(amount: 0),
            identity: CirclesTransition(amount: 1)
        )
}

struct CirclesTransition: ViewModifier {
    var amount = 0.0
    var insertion = true
    
    func body(content: Content) -> some View {
        content
            .visualEffect { content, proxy in
                content
                    .colorEffect(
                        ShaderLibrary.circles(
                            .float2(proxy.size),
                            .float(amount)
                        )
                    )
            }
    }
}

struct TransitionView: View {
    @State var on: Bool = true
    
    var body: some View {
        VStack {
            ZStack {
                if on {
                    Image("1")
                        .resizable()
                        .scaledToFit()
                        .transition(.circles)
                } else {
                    Image("2")
                        .resizable()
                        .scaledToFit()
                        .transition(.circles)
                }
            }
            
            Button(action: {
                withAnimation(.linear(duration: 2.0), {
                    on.toggle()

                })
            }, label: {
                Text("Toggle")
            })
        }
        .padding()
    }
}

#Preview {
    TransitionView()
}
