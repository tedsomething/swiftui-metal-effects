#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] float2 waveFlag(float2 position, float time, float2 size) {
    float2 distance = position / size;
    position.y += sin(time * 5 + position.x / 20) * distance.x * 5;
    
    return position;
}
