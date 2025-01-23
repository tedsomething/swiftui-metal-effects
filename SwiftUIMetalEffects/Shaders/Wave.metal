#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] float2 wave(float2 position, float time) {
    position.y += sin(time * 5 + position.y / 20) * 5;
    
    return position;
}
