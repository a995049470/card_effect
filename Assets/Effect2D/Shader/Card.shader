 Shader "LPipeline/Card"
{
    
    Properties
    {

        [Title(Card)]
        [Main(Common, _, Off, Off)]_Common("公用", float) = 0
        [Sub(Common)]_MainTex("主贴图", 2d) = "black" {}
        [Sub(Common)]_MaskTex("遮罩", 2d) = "white" {}

        [Main(Group0, _BLEND_EFFECT0)]_Group0 ("合成效果 0", float) = 0
        [Sub(Group0)] _BlendTex0("合成图", 2d) = "white" {}
        [Sub(Group0)] _MoveDir0("平移方向", vector) = (1, 0, 0, 0)
        [Sub(Group0)] _MoveSpd0("平移速度", float) = 0
        [Enum(R, 1, G, 2, B, 4, A, 8, None, 16)]
        [Sub(Group0)] _MaskUse0("遮罩类型", int) = 0
        [Sub(Group0)] [HDR] _BlendColor0("颜色", color) = (1, 1, 1, 1)
        [SubToggle(Group0)] _Polar0("极坐标", float) = 0
        [Sub(Group0)] _RotateSpd0("旋转速度", float) = 0
        [Sub(Group0)] _RotateCenter0("旋转中心", vector) = (0.5, 0.5, 0, 0)
        [Sub(Group0)] _FlashSpd0("闪烁速度", float) = 0
        [Sub(Group0)] _FlashMin0("闪烁谷值", float) = 1
        [Sub(Group0)] _FlashMax0("闪烁峰值", float) = 1

        [Main(Group1, _BLEND_EFFECT1)]_Group1 ("合成效果 1", float) = 0
        [Sub(Group1)] _BlendTex1("合成图", 2d) = "white" {}
        [Sub(Group1)] _MoveDir1("平移方向", vector) = (1, 0, 0, 0)
        [Sub(Group1)] _MoveSpd1("平移速度", float) = 0
        [Enum(R, 1, G, 2, B, 4, A, 8, None, 16)]
        [Sub(Group1)] _MaskUse1("遮罩类型", int) = 0
        [Sub(Group1)] [HDR] _BlendColor1("颜色", color) = (1, 1, 1, 1)
        [SubToggle(Group1)] _Polar1("极坐标", float) = 0
        [Sub(Group1)] _RotateSpd1("旋转速度", float) = 0
        [Sub(Group1)] _RotateCenter1("旋转中心", vector) = (0.5, 0.5, 0, 0)
        [Sub(Group1)] _FlashSpd1("闪烁速度", float) = 0
        [Sub(Group1)] _FlashMin1("闪烁谷值", float) = 1
        [Sub(Group1)] _FlashMax1("闪烁峰值", float) = 1

        [Main(Group2, _BLEND_EFFECT2)]_Group2 ("合成效果 2", float) = 0
        [Sub(Group2)] _BlendTex2("合成图", 2d) = "white" {}
        [Sub(Group2)] _MoveDir2("平移方向", vector) = (1, 0, 0, 0)
        [Sub(Group2)] _MoveSpd2("平移速度", float) = 0
        [Enum(R, 1, G, 2, B, 4, A, 8, None, 16)]
        [Sub(Group2)] _MaskUse2("遮罩类型", int) = 0
        [Sub(Group2)] [HDR] _BlendColor2("颜色", color) = (1, 1, 1, 1)
        [SubToggle(Group2)] _Polar2("极坐标", float) = 0
        [Sub(Group2)] _RotateSpd2("旋转速度", float) = 0
        [Sub(Group2)] _RotateCenter2("旋转中心", vector) = (0.5, 0.5, 0, 0)
        [Sub(Group2)] _FlashSpd2("闪烁速度", float) = 0
        [Sub(Group2)] _FlashMin2("闪烁谷值", float) = 1
        [Sub(Group2)] _FlashMax2("闪烁峰值", float) = 1

        [Main(Group3, _BLEND_EFFECT3)]_Group3 ("合成效果 3", float) = 0
        [Sub(Group3)] _BlendTex3("合成图", 2d) = "white" {}
        [Sub(Group3)] _MoveDir3("平移方向", vector) = (1, 0, 0, 0)
        [Sub(Group3)] _MoveSpd3("平移速度", float) = 0
        [Enum(R, 1, G, 2, B, 4, A, 8, None, 16)]
        [Sub(Group3)] _MaskUse3("遮罩类型", int) = 0
        [Sub(Group3)] [HDR] _BlendColor3("颜色", color) = (1, 1, 1, 1)
        [SubToggle(Group3)] _Polar3("极坐标", float) = 0
        [Sub(Group3)] _RotateSpd3("旋转速度", float) = 0
        [Sub(Group3)] _RotateCenter3("旋转中心", vector) = (0.5, 0.5, 0, 0)
        [Sub(Group3)] _FlashSpd3("闪烁速度", float) = 0
        [Sub(Group3)] _FlashMin3("闪烁谷值", float) = 1
        [Sub(Group3)] _FlashMax3("闪烁峰值", float) = 1

        [Main(Group4, _BLEND_EFFECT4)]_Group4 ("合成效果 4", float) = 0
        [Sub(Group4)] _BlendTex4("合成图", 2d) = "white" {}
        [Sub(Group4)] _MoveDir4("平移方向", vector) = (1, 0, 0, 0)
        [Sub(Group4)] _MoveSpd4("平移速度", float) = 0
        [Enum(R, 1, G, 2, B, 4, A, 8, None, 16)]
        [Sub(Group4)] _MaskUse4("遮罩类型", int) = 0
        [Sub(Group4)] [HDR] _BlendColor4("颜色", color) = (1, 1, 1, 1)
        [SubToggle(Group4)] _Polar4("极坐标", float) = 0
        [Sub(Group4)] _RotateSpd4("旋转速度", float) = 0
        [Sub(Group4)] _RotateCenter4("旋转中心", vector) = (0.5, 0.5, 0, 0)
        [Sub(Group4)] _FlashSpd4("闪烁速度", float) = 0
        [Sub(Group4)] _FlashMin4("闪烁谷值", float) = 1
        [Sub(Group4)] _FlashMax4("闪烁峰值", float) = 1

        [Main(Disturb, _BLEND_DISTURB)]_Disturb ("飘动", float) = 0
        [Sub(Disturb)] _MaskUse("遮罩类型", int) = 0
        [Sub(Disturb)] _DisturbTex("扰动图", 2d) = "white" {}
        [Sub(Disturb)] _DisturbDir("扰动方向", vector) = (1, 0, 0, 0)
        [Sub(Disturb)] _DisturbStr("扰动强度", float) = 0
        [Sub(Disturb)] _DisturbSpd("扰动速度", float) = 0


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
            //Blend One Zero
            ZWrite On
            ZTest Less
            Cull Back
            HLSLPROGRAM
            #pragma shader_feature _BLEND_EFFECT0
            #pragma shader_feature _BLEND_EFFECT1
            #pragma shader_feature _BLEND_EFFECT2
            #pragma shader_feature _BLEND_EFFECT3
            #pragma shader_feature _BLEND_EFFECT4
            #pragma shader_feature _BLEND_DISTURB



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
            Texture2D _MaskTex;
            SamplerState sampler_MaskTex;

            #include "Assets\Effect2D\Shader\BlendEffect.hlsl"
			
        #if _BLEND_EFFECT0
            BELND_EFFECT(0)
        #endif
        #if _BLEND_EFFECT1
            BELND_EFFECT(1)
        #endif
        #if _BLEND_EFFECT2
            BELND_EFFECT(2)
        #endif
        #if _BLEND_EFFECT3
            BELND_EFFECT(3)
        #endif
        #if _BLEND_EFFECT4
            BELND_EFFECT(4)
        #endif
        
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
                float4 mask = _MaskTex.Sample(sampler_MaskTex, uv);
                float2 uv_main = uv;
            #if _BLEND_DISTURB
                uv_main = Disturb(uv, mask);
            #endif
                float4 col = _MainTex.Sample(sampler_MainTex, uv_main);
            #if _BLEND_EFFECT0
                ApplyBlendEffect0(uv, mask, col);
            #endif
            #if _BLEND_EFFECT1
                ApplyBlendEffect1(uv, mask, col);
            #endif
            #if _BLEND_EFFECT2
                ApplyBlendEffect2(uv, mask, col);
            #endif
            #if _BLEND_EFFECT3
                ApplyBlendEffect3(uv, mask, col);
            #endif
            #if _BLEND_EFFECT4
                ApplyBlendEffect4(uv, mask, col);
            #endif
            
                return col;
            }
            ENDHLSL
        }
    }
    CustomEditor "LWGUI.LWGUI"
}
