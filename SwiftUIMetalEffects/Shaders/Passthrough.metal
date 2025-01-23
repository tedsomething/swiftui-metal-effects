#include <metal_stdlib>
using namespace metal;


[[ stitchable ]] half4 passthrough(float2 position, half4 color) {
    return color;
}
