#ifndef INCLUDE_CARD_HLSL
#define INCLUDE_CARD_HLSL

#define BELND_EFFECT(id) \
    Texture2D _BlendTex##id; \
    SamplerState sampler_BlendTex##id; \
    float4 _BlendTex##id##_ST; \
    float2 _MoveDir##id; \
    float _MoveSpd##id; \
    int _MaskUse##id; \
    \
    void ApplyBlendEffect##id##(float2 uv, float4 maskColor) \
    { \
        float4 st = _BlendTex##id##_ST; \
        uv = uv * st.xy + st.zw; \
        float2 dir = normalize(_MoveDir##id); \
        float spd = _MoveSpd##id; \
        uv += _Time.y * spd * dir; \
        int maskUse = _MaskUse##id; \
        float max = 
    } \
    
    

#endif