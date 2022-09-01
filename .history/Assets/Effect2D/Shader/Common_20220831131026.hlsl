#ifndef INCLUDE_COMMON_HLSL
#define INCLUDE_COMMON_HLSL

#define PI 3.1415926

float2 ConvertRectToPolar(float2 uv, float2 center)
{
    float2 offset = uv - center;
    float2 len = length(offset);
    float x = len * 2;
    //参考ASE提供的极坐标转换节点
    float x = atan2(offset.x, offset.y) / 2.0 / PI;
    return float2()
}

#endif