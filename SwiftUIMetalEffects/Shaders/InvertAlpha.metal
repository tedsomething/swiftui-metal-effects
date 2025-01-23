#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 invertAlpha(float2 position, half4 color) {
    return half4(0, 0, 0, 1 - color.a);
}
