//
//  Passthrough.metal
//  LayerKit
//
//  Created by Teodors Zeltins on 08/01/2025.
//

#include <metal_stdlib>
using namespace metal;


[[ stitchable ]] half4 passthrough(float2 position, half4 color) {
    return color;
}
