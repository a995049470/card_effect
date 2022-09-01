#ifndef INCLUDE_COMMON_HLSL
#define INCLUDE_COMMON_HLSL

float2 ConvertRectToPolar(float2 uv, float2 center)
{
    float2 offset = uv - center;
    float2 len = length(offset);
    float y = len * 2;
    //参考ASE提供的极坐标转换节点
    float ag = atan2(offset.x, offset.y);
}

#endif