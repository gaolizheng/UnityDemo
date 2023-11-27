Shader "MatCap/MatCapShader"
{
    Properties
    {
        _MainTex ("Main Texture", 2D) = "white" {}
        _MatCapTex ("MatCap Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM

            #pragma exclude_renderers d3d11
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
                float2 matcapUV: TEXCOORD1;
            };

            uniform float4 _MainTex_ST;

            v2f vert (appdata_full v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
                // 法线从世界空间转换到视图空间
                float3 tmpNormal = mul((float3x3)UNITY_MATRIX_V, normalize(mul((float3x3)unity_WorldToObject, v.normal)));
                // 法线数据从[-1,1]映射到[0,1]之间
                o.matcapUV = tmpNormal.xy * 0.5 + 0.5;
                return o;
            }

            sampler2D _MainTex;
            sampler2D _MatCapTex;

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                col *= tex2D(_MatCapTex, i.matcapUV);
                return col;
            }
            ENDCG
        }
    }
}
