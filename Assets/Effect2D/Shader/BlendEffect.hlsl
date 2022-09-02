#ifndef INCLUDE_BLEND_EFFECT_HLSL
#define INCLUDE_BLEND_EFFECT_HLSL

#include "Assets\Effect2D\Shader\Common.hlsl"

float2 Rotate(float2 uv, float angle, float2 rotSpd, float2 rotCenter, float polar)
{
    float2 uv_poloar = ConvertRectToPolar(uv, rotCenter);
    uv_poloar.y += _Time.y * rotSpd + angle;
    float2 uv_rect = ConvertPolarToRect(uv_poloar, rotCenter);
    return lerp(uv_rect, uv_poloar, polar);
}

float Flash(float spd, float a, float b)
{   
    float w = sin(spd * _Time.y) * .5 + .5;
    return lerp(a, b, w);
}


//TODO:颜色的混合方式
#define BELND_EFFECT(id) \
    Texture2D _BlendTex##id; \
    SamplerState sampler_BlendTex##id; \
    float4 _BlendTex##id##_ST; \
    float2 _MoveDir##id; \
    float _MoveSpd##id; \
    int _MaskUse##id; \
    float4 _BlendColor##id; \
    float _Polar##id; \
    float _RotateSpd##id; \
    float _RotateAngle##id;\
    float2 _RotateCenter##id; \
    float _FlashSpd##id; \
    float _FlashMin##id; \
    float _FlashMax##id; \
    \
    void ApplyBlendEffect##id##(float2 uv, float4 maskColor, inout float4 color) \
    { \
        float4 st = _BlendTex##id##_ST; \
        float2 rotCenter = _RotateCenter##id; \
        float rotSpd = _RotateSpd##id * 0.01; \
        float isPolar = _Polar##id; \
        float rotateAngle = _RotateAngle##id;\
        uv = Rotate(uv, rotateAngle, rotSpd, rotCenter, isPolar);\
        float2 dir = normalize(_MoveDir##id); \
        float spd = _MoveSpd##id; \
        uv += _Time.y * spd * dir; \
        uv = uv * st.xy + st.zw; \
        float flash = Flash(_FlashSpd##id, _FlashMin##id, _FlashMax##id);\
        \
        int maskUse = _MaskUse##id; \
        float mask = maskColor[0] * (maskUse / 1 % 2 ) + \
                     maskColor[1] * (maskUse / 2 % 2 ) + \
                     maskColor[2] * (maskUse / 4 % 2 ) + \
                     maskColor[3] * maskColor[3] * (maskUse / 8 % 2 ) + \
                     (maskUse / 16 % 2); \
        float4 blendColor = _BlendTex##id.Sample(sampler_BlendTex##id, uv) * _BlendColor##id * mask * flash; \
        blendColor.a = _BlendColor##id.a;\
        /*需要更多的混合方式*/\
        color += blendColor;\
    } \
    
//飘动效果
Texture2D _DisturbTex;
SamplerState sampler_DisturbTex;
float4 _DisturbTex_ST;
float2 _DisturbDir;
float _DisturbStr;
float _DisturbSpd;
float _MaskUse;

float2 Disturb(float2 uv_origin, float4 maskColor)
{
    float2 uv = uv_origin;
    float4 st = _DisturbTex_ST;
    uv = uv * st.xy + st.zw;
    float2 dir = normalize(_DisturbDir);
    uv += _Time.y * _DisturbSpd * dir;
    float2 d = _DisturbTex.Sample(sampler_DisturbTex, uv).rg;
    d = d * 2.0 - 1.0;
    d *= _DisturbStr * 0.001;
    int maskUse = _MaskUse;
    float mask = maskColor[0] * (maskUse / 1 % 2) +
                 maskColor[1] * (maskUse / 2 % 2) +
                 maskColor[2] * (maskUse / 4 % 2) +
                 maskColor[3] * (maskUse / 8 % 2) +
                 maskUse / 16 % 2;
    float2 offset = mask * d;
    return offset + uv_origin;
}

#endif