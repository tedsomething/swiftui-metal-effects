#include <metal_stdlib>
using namespace metal;
#include <SwiftUI/SwiftUI_Metal.h>

[[ stitchable ]] half4 loupe(float2 position, SwiftUI::Layer l, float2 size, float2 touch) {
    float maxDistance = 0.05;
    
    float2 uv = position / size;
    float2 center = touch / size;
    float2 delta = uv - center;
    float aspectRatio = size.x / size.y;
    
    // Fix for incorrect aspectRatio usage in original
    float distance = (delta.x * delta.x) + pow((delta.y / aspectRatio), 2);
    
    float totalZoom = 1;
    
    if (distance < maxDistance) {
        totalZoom /= 2;
        totalZoom += distance * 10;
    }
    
    float2 positionNew = delta * totalZoom + center;
    
    return l.sample(positionNew * size);
}
