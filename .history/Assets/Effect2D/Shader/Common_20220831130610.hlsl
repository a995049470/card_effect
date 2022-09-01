#ifndef INCLUDE_COMMON_HLSL
#define INCLUDE_COMMON_HLSL

float2 ConvertRectToPolar(float2 uv, float2 center)
{
    float2 offset = uv - center;
    float2 len = length(offset);
    float y = 
}

#endif