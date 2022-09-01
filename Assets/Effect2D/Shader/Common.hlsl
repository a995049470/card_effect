#ifndef INCLUDE_COMMON_HLSL
#define INCLUDE_COMMON_HLSL

#define PI 3.1415926

//参考ASE提供的极坐标转换节点
float2 ConvertRectToPolar(float2 uv, float2 center)
{
    float2 offset = uv - center;
    float2 len = length(offset);
    float x = len * 2;
    float y = atan2(offset.x, offset.y) / 2.0 / PI;
    return float2(x, y);
}

float2 ConvertPolarToRect(float2 uv, float2 center)
{
    float px = uv.x;
    float py = uv.y;
    float len = px * 0.5f;
    float ag = py * 2 * PI;
    float2 offset = float2(len * sin(ag), len * cos(ag));
    return center + offset;
}

#endif