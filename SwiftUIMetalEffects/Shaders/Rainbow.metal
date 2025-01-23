#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 rainbow(float2 position, half4 color, float t) {
    float angle = atan2(position.y, position.x) + t;
    
    return half4(
        sin(angle),
        sin(angle + 2),
        sin(angle + 4),
        color.a
    );
}
