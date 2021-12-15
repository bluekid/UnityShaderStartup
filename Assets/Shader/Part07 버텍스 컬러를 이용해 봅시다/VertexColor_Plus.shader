// ����Ʈ���� ����ũ �� �� ���� ��Ȳ���� �����Ʈ ��Ŭ����(Ambient Occlusion)ó�� �̿밡��
// ������ ����Ʈ��(Lightmap) ó�� �̿��� ���� �ִ�.
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
