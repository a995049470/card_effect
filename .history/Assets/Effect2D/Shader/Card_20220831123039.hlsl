#ifndef INCLUDE_CARD_HLSL
#define INCLUDE_CARD_HLSL

#define BELND_EFFECT(id) \
    Texture2D _BlendTex##id; \
    SamplerState sampler_BlendTex##id; \
    float2 _MoveDir##id;
    

#endif