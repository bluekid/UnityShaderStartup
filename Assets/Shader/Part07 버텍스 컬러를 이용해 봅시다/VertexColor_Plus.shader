// 라이트맵을 베이크 할 수 없는 상황에서 엠비언트 오클루전(Ambient Occlusion)처럼 이용가능
// 저렴한 라이트맵(Lightmap) 처럼 이용할 수도 있다.
Shader "Custom/VertexColor_Plus"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard noambient

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
            float4 color:COLOR;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            //o.Albedo = c.rgb;
            o.Emission = c.rgb + IN.color.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
