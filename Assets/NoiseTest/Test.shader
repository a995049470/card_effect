Shader "LPipeline/Test"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _P1("p1", vector) = (0, 0, 0, 0)
        _P2("p2", vector) = (0, 0, 0, 0)
        
        _T("t", Range(-1, 1)) = 0

    }
    SubShader
    {

        Tags 
        { 
            "RenderType"="Opaque"
            "Queue"="Geometry"
        }
        Pass
        {
            Tags
            {
                //"LightMode"="LPipeline"
            }
            Blend One Zero
            ZWrite On
            ZTest Less
            Cull Back
            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct appdata
            {
                float4 positionOS : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 positionCS : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            Texture2D _MainTex;
            SamplerState sampler_MainTex;
            float4 _P1, _P2;
            float _T;

            float sdBox( in float2 p, in float2 b )
            {
                float2 d = abs(p) -b;
                return length(max(d,0.0)) + min(max(d.x,d.y),0.0);
            }

            v2f vert (appdata v)
            {
                v2f o = (v2f)0;
                o.uv = v.uv;
                o.positionCS = TransformObjectToHClip(v.positionOS.xyz);
                return o;
            }

            float4 frag (v2f i) : SV_Target
            {
                float2 uv = i.uv;
                float dis = min(sdBox(uv - _P1.zw, _P1), sdBox(uv - _P2.zw, _P2));

                return step(_T, dis);
            }
            ENDHLSL
        }
    }
}
