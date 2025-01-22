//
//  Passthrough.metal
//  LayerKit
//
//  Created by Teodors Zeltins on 08/01/2025.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 invertAlpha(float2 position, half4 color) {
    return half4(0, 0, 0, 1 - color.a);
}
