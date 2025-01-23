#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 sinebow(float2 position, half4 color, float2 size, float time) {
    float2 uv = (position / size) * 2 - 1; // -1...1 range
    uv.y *= size.y / size.x; // Fix line to center by using aspect ratio
    
    float wave = sin(uv.x * sin(time)); // Fix "sin(time)" instead of "time"
    
    wave = wave * wave * 50;
    
    half3 waveColor = half3(0);
    for (float i = 0; i < 10; i++) {
        float luma = abs(1 / (100 * uv.y + wave));
        
        float y = sin(uv.x * sin(time) + i * 0.2 + time);
        uv.y += 0.05 * y;
        
        half3 rainbow = half3(
            sin(i * 0.3 + time) * 0.5 + 0.5,
            sin(i * 0.3 + 2 + sin(0.3 * time) * 2) * 0.5 + 0.5,
            sin(i * 0.3 + 4) * 0.5 + 0.5
       );
        
        waveColor += rainbow * luma;
    }
                          
    return half4(waveColor, 1);
}
