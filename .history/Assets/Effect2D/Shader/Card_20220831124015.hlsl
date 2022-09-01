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
        float st = _BlendTex##id##_ST;

    } \
    
    

#endif