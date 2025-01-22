//
//  Passthrough.metal
//  LayerKit
//
//  Created by Teodors Zeltins on 08/01/2025.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] float2 wave(float2 position, float time) {
    position.y += sin(time * 5 + position.y / 20) * 5;
    
    return position;
}
