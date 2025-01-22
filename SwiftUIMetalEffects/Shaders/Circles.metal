//
//  Passthrough.metal
//  LayerKit
//
//  Created by Teodors Zeltins on 08/01/2025.
//

#include <metal_stdlib>
using namespace metal;
#include <SwiftUI/SwiftUI_Metal.h>

[[ stitchable ]] half4 circles(float2 position, half4 color, float2 size, float amount) {
    float2 uv = position / size;
    float strength = 20;
    float2 f = fract(position / strength);
    float d = distance (f, 0.5);
    
    if (d + uv.x + uv.y < amount * 3) {
        return color;
    } else {
        return 0;
    }
}
