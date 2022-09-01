// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Card"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin]_MainTex("MainTex", 2D) = "white" {}
		_DisturbTex1("DisturbTex1", 2D) = "black" {}
		_spd_dis_1("spd_dis_1", Float) = 1
		_strength_dis_1("strength_dis_1", Float) = 0
		_spd_rot_2("spd_rot_2", Float) = 1
		_Center_Rot_2("Center_Rot_2", Vector) = (0.5,0.5,0,0)
		_RotTex2("RotTex2", 2D) = "black" {}
		[HDR]_color_rot_2("color_rot_2", Color) = (1,1,1,0)
		_spd_rot_1("spd_rot_1", Float) = 1
		_Center_Rot_1("Center_Rot_1", Vector) = (0.5,0.5,0,0)
		_RotTex1("RotTex1", 2D) = "black" {}
		[HDR]_color_rot_1("color_rot_1", Color) = (1,1,1,0)
		_spd_b_1("spd_b_1", Float) = 1
		_old_b_1("old_b_1", Range( 0 , 1)) = 0
		_max_b_1("max_b_1", Range( 0 , 1)) = 1
		_LightTex1("LightTex1", 2D) = "black" {}
		[HDR]_color_b_1("color_b_1", Color) = (1,1,1,0)
		_MixTex2("MixTex2", 2D) = "black" {}
		_dir2("dir2", Vector) = (1,0,0,0)
		_spd2("spd2", Float) = 1
		[HDR]_color2("color2", Color) = (1,1,1,1)
		_MixTex1("MixTex1", 2D) = "black" {}
		_dir1("dir1", Vector) = (1,0,0,0)
		_spd1("spd1", Float) = 1
		[HDR]_color1("color1", Color) = (1,1,1,1)
		[ASEEnd]_MaskTex("MaskTex", 2D) = "black" {}

	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" }

		Cull Off
		HLSLINCLUDE
		#pragma target 2.0
		ENDHLSL

		
		Pass
		{
			Name "Unlit"
			

			Blend Off
			ZTest LEqual
			ZWrite On
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM
			#define ASE_SRP_VERSION 999999

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile _ ETC1_EXTERNAL_ALPHA

			#define _SURFACE_TYPE_TRANSPARENT 1
			#define SHADERPASS_SPRITEUNLIT

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			sampler2D _MainTex;
			sampler2D _MaskTex;
			sampler2D _DisturbTex1;
			sampler2D _LightTex1;
			sampler2D _MixTex1;
			sampler2D _MixTex2;
			sampler2D _RotTex1;
			sampler2D _RotTex2;
			CBUFFER_START( UnityPerMaterial )
			float4 _DisturbTex1_ST;
			float4 _RotTex2_ST;
			float4 _color_rot_1;
			float4 _RotTex1_ST;
			float4 _color2;
			float4 _MixTex2_ST;
			float4 _MixTex1_ST;
			float4 _color1;
			float4 _LightTex1_ST;
			float4 _color_b_1;
			float4 _color_rot_2;
			float2 _dir1;
			float2 _Center_Rot_2;
			float2 _dir2;
			float2 _Center_Rot_1;
			float _spd1;
			float _max_b_1;
			float _spd2;
			float _old_b_1;
			float _spd_rot_1;
			float _spd_b_1;
			float _strength_dis_1;
			float _spd_rot_2;
			float _spd_dis_1;
			CBUFFER_END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 color : COLOR;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 texCoord0 : TEXCOORD0;
				float4 color : TEXCOORD1;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#if ETC1_EXTERNAL_ALPHA
				TEXTURE2D( _AlphaTex ); SAMPLER( sampler_AlphaTex );
				float _EnableAlphaTexture;
			#endif

			float4 _RendererColor;

			
			VertexOutput vert( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.normal = v.normal;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.vertex.xyz );

				o.texCoord0 = v.uv0;
				o.color = v.color;
				o.clipPos = vertexInput.positionCS;

				return o;
			}

			half4 frag( VertexOutput IN  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				float2 appendResult11 = (float2(IN.texCoord0.xy.x , ( 1.0 - IN.texCoord0.xy.y )));
				float2 uv13 = appendResult11;
				float4 tex2DNode22 = tex2D( _MaskTex, uv13 );
				float mask_b26 = tex2DNode22.b;
				float2 uv141_g69 = uv13;
				float2 normalizeResult65_g69 = normalize( float2( 1,0 ) );
				float spd68_g69 = _spd_dis_1;
				float mulTime75_g69 = _TimeParameters.x * spd68_g69;
				float2 appendResult73_g69 = (float2(tex2D( _DisturbTex1, (uv141_g69*_DisturbTex1_ST.xy + ( _DisturbTex1_ST.zw + ( normalizeResult65_g69 * mulTime75_g69 ) )) ).rg));
				float2 disturb_f274_g69 = ( (float2( -1,-1 ) + (appendResult73_g69 - float2( 0,0 )) * (float2( 1,1 ) - float2( -1,-1 )) / (float2( 1,1 ) - float2( 0,0 ))) * ( _strength_dis_1 / 1000.0 ) );
				float mulTime2_g64 = _TimeParameters.x * _spd_b_1;
				float2 normalizeResult20_g63 = normalize( _dir1 );
				float mulTime39_g63 = _TimeParameters.x * _spd1;
				float2 uv112_g63 = (uv13*_MixTex1_ST.xy + ( _MixTex1_ST.zw + ( normalizeResult20_g63 * mulTime39_g63 ) ));
				float mask_g25 = tex2DNode22.g;
				float2 normalizeResult20_g62 = normalize( _dir2 );
				float mulTime39_g62 = _TimeParameters.x * _spd2;
				float2 uv112_g62 = (uv13*_MixTex2_ST.xy + ( _MixTex2_ST.zw + ( normalizeResult20_g62 * mulTime39_g62 ) ));
				float mulTime9_g65 = _TimeParameters.x * _spd_rot_1;
				float2 appendResult11_g65 = (float2(0.0 , ( mulTime9_g65 / 100.0 )));
				float2 uv_rot_121_g65 = (uv13*_RotTex1_ST.xy + _RotTex1_ST.zw);
				float2 center_rot_16_g65 = (_Center_Rot_1*_RotTex1_ST.xy + _RotTex1_ST.zw);
				float2 CenteredUV15_g66 = ( uv_rot_121_g65 - center_rot_16_g65 );
				float2 break17_g66 = CenteredUV15_g66;
				float2 appendResult23_g66 = (float2(( length( CenteredUV15_g66 ) * 1.0 * 2.0 ) , ( atan2( break17_g66.x , break17_g66.y ) * ( 1.0 / TWO_PI ) * 1.0 )));
				float2 break5_g67 = ( appendResult11_g65 + appendResult23_g66 );
				float len15_g67 = ( 0.5 * break5_g67.x );
				float temp_output_7_0_g67 = ( break5_g67.y * TWO_PI );
				float2 appendResult18_g67 = (float2(( len15_g67 * sin( temp_output_7_0_g67 ) ) , ( cos( temp_output_7_0_g67 ) * len15_g67 )));
				float mask_r24 = tex2DNode22.r;
				float mulTime9_g59 = _TimeParameters.x * _spd_rot_2;
				float2 appendResult11_g59 = (float2(0.0 , ( mulTime9_g59 / 100.0 )));
				float2 uv_rot_221_g59 = (uv13*_RotTex2_ST.xy + _RotTex2_ST.zw);
				float2 center_rot_16_g59 = (_Center_Rot_2*_RotTex2_ST.xy + _RotTex2_ST.zw);
				float2 CenteredUV15_g60 = ( uv_rot_221_g59 - center_rot_16_g59 );
				float2 break17_g60 = CenteredUV15_g60;
				float2 appendResult23_g60 = (float2(( length( CenteredUV15_g60 ) * 1.0 * 2.0 ) , ( atan2( break17_g60.x , break17_g60.y ) * ( 1.0 / TWO_PI ) * 1.0 )));
				float2 break5_g61 = ( appendResult11_g59 + appendResult23_g60 );
				float len15_g61 = ( 0.5 * break5_g61.x );
				float temp_output_7_0_g61 = ( break5_g61.y * TWO_PI );
				float2 appendResult18_g61 = (float2(( len15_g61 * sin( temp_output_7_0_g61 ) ) , ( cos( temp_output_7_0_g61 ) * len15_g61 )));
				float4 outputColor47 = ( tex2D( _MainTex, ( ( 1.0 * mask_b26 * disturb_f274_g69 ) + uv141_g69 ) ) + ( (_old_b_1 + (sin( mulTime2_g64 ) - -1.0) * (_max_b_1 - _old_b_1) / (1.0 - -1.0)) * tex2D( _LightTex1, (uv13*_LightTex1_ST.xy + _LightTex1_ST.zw) ) * 1.0 * _color_b_1 ) + ( tex2D( _MixTex1, uv112_g63 ).g * _color1 * mask_g25 ) + ( tex2D( _MixTex2, uv112_g62 ).g * _color2 * mask_g25 ) + ( tex2D( _RotTex1, ( appendResult18_g67 + center_rot_16_g65 ) ) * mask_r24 * _color_rot_1 ) + ( tex2D( _RotTex2, ( appendResult18_g61 + center_rot_16_g59 ) ) * mask_r24 * _color_rot_2 ) );
				
				float4 Color = outputColor47;

				#if ETC1_EXTERNAL_ALPHA
					float4 alpha = SAMPLE_TEXTURE2D( _AlphaTex, sampler_AlphaTex, IN.texCoord0.xy );
					Color.a = lerp( Color.a, alpha.r, _EnableAlphaTexture );
				#endif

				Color *= IN.color;

				return Color;
			}

			ENDHLSL
		}
	}
	CustomEditor "UnityEditor.ShaderGraph.PBRMasterGUI"
	Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=18909
533;1062;1857;1200;1277.581;971.9026;1;True;False
Node;AmplifyShaderEditor.TexCoordVertexDataNode;10;-1114.055,-67.38409;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;12;-868.1919,-119.2703;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;11;-692.1919,-189.2703;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;13;-578.1919,-367.2703;Inherit;False;uv;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;23;-635.1919,337.7297;Inherit;False;13;uv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;22;-394.1919,322.7297;Inherit;True;Property;_MaskTex;MaskTex;31;0;Create;True;0;0;0;False;0;False;-1;None;9130f5dd861594b43b9d79d06b162ea7;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;26;2.808105,466.7297;Inherit;False;mask_b;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;24;-21.19189,304.7297;Inherit;False;mask_r;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;15;-837.7993,-830.9028;Inherit;False;13;uv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;25;-6.191895,377.7297;Inherit;False;mask_g;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;66;-877.1735,-648.5435;Inherit;False;26;mask_b;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;19;-408.1919,-262.2703;Inherit;False;13;uv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;32;-398.2321,-157.5804;Inherit;False;25;mask_g;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;42;-443.2615,33.82727;Inherit;False;24;mask_r;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;60;-475.1139,194.3966;Inherit;False;24;mask_r;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;51;-451.297,102.9985;Inherit;False;13;uv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;58;-483.1494,263.5678;Inherit;False;13;uv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;33;-398.2321,-55.58044;Inherit;False;13;uv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;27;-397.1919,-377.2703;Inherit;False;25;mask_g;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;41;-438.2615,-452.1727;Inherit;False;13;uv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;84;-653.3847,-702.1694;Inherit;False;Disturb1;1;;69;b281f746c0215634ba1e8138bf9c2c15;0;2;4;FLOAT2;0,0;False;37;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;61;-140.0417,213.0971;Inherit;False;Rot2;5;;59;323bdc4683c51f94a8698d5f42283a7c;0;2;28;FLOAT;1;False;3;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;34;-145.2321,-111.5804;Inherit;False;Mix2;21;;62;da49a83b1ec28464daa0a0a40279ff89;0;2;38;FLOAT;0;False;2;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;14;-413.4685,-788.8596;Inherit;True;Property;_MainTex;MainTex;0;0;Create;True;0;0;0;False;0;False;-1;None;efd04a24d07cc6c47bb9f5385f484b8e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;31;-160.1919,-321.2703;Inherit;False;Mix1;26;;63;c3c80620f7653374e858c2b0adcb7bbc;0;2;38;FLOAT;0;False;2;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;57;-144.0098,17.75757;Inherit;False;Rot1;10;;65;cc485b4cd47691c4080e4afb59237b73;0;2;28;FLOAT;1;False;3;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;46;-167.2615,-488.1727;Inherit;False;Breath1;15;;64;66564fd441a1c5143a0b7a2cdd5ceb0b;0;2;9;FLOAT;1;False;11;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;16;310.2574,-296.3354;Inherit;False;6;6;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;47;639.9143,-505.1182;Inherit;False;outputColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;48;318.9785,-2.289171;Inherit;False;47;outputColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;82;616.7999,-29.2;Float;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;13;Card;cf964e524c8e69742b1d21fbe2ebcc4a;True;Unlit;0;0;Unlit;3;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;True;0;0;True;True;0;5;False;-1;10;False;-1;0;1;False;-1;10;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;0;Hidden/InternalErrorShader;0;0;Standard;1;Vertex Position;1;0;1;True;False;;False;0
WireConnection;12;0;10;2
WireConnection;11;0;10;1
WireConnection;11;1;12;0
WireConnection;13;0;11;0
WireConnection;22;1;23;0
WireConnection;26;0;22;3
WireConnection;24;0;22;1
WireConnection;25;0;22;2
WireConnection;84;4;15;0
WireConnection;84;37;66;0
WireConnection;61;28;60;0
WireConnection;61;3;58;0
WireConnection;34;38;32;0
WireConnection;34;2;33;0
WireConnection;14;1;84;0
WireConnection;31;38;27;0
WireConnection;31;2;19;0
WireConnection;57;28;42;0
WireConnection;57;3;51;0
WireConnection;46;11;41;0
WireConnection;16;0;14;0
WireConnection;16;1;46;0
WireConnection;16;2;31;0
WireConnection;16;3;34;0
WireConnection;16;4;57;0
WireConnection;16;5;61;0
WireConnection;47;0;16;0
WireConnection;82;1;48;0
ASEEND*/
//CHKSM=6F771115769FB6016BD4CE06D63D99ECE6A7B6C6