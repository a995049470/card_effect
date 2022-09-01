#ifndef INCLUDE_CARD_HLSL
#define INCLUDE_CARD_HLSL

#define BELND_EFFECT(id) \
    Texture2D _BlendTex##id; \
    SamplerState sampler_BlendTex##id; \
    float4 _BlendTex##id##_ST; \
    float2 _MoveDir##id; \
    float _MoveSpd##id; \
    int _MaskUse##id; \
    int _BlendColo
    \
    void ApplyBlendEffect##id##(float2 uv, float4 maskColor, inout float4 color) \
    { \
        float4 st = _BlendTex##id##_ST; \
        uv = uv * st.xy + st.zw; \
        float2 dir = normalize(_MoveDir##id); \
        float spd = _MoveSpd##id; \
        uv += _Time.y * spd * dir; \
        int maskUse = _MaskUse##id; \
        float mask = maskColor[0] * (maskUse / 1 % 2 ) + \
                     maskColor[1] * (maskUse / 2 % 2 ) + \
                     maskColor[2] * (maskUse / 4 % 2 ) + \
                     maskColor[3] * (maskUse / 8 % 2 ) + \
                     (maskUse / 16 % 2); \
        float4 blendTexColor = _BlendTex##id.Sample(sampler_BlendTex##id, uv) * ;
        
        
    } \
    
    

#endif