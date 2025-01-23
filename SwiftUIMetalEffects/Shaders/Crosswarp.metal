#include <metal_stdlib>
using namespace metal;
#include <SwiftUI/SwiftUI_Metal.h>

[[ stitchable ]] half4 crosswarp(float2 position, SwiftUI::Layer l, float2 size, float amount) {
    float2 uv = position / size;

    float x = smoothstep(0, 1, amount * 2 + uv.x - 1);
    
    float2 positionNew = mix(uv, float2(0.5), x);
    half4 color = mix(l.sample(positionNew * size), 0, x);
    
    return color;
}
