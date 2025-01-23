#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 recolor(float2 position, half4 color) {
    return half4(1, 0, 0, color.a);
}
