Shader "Custom/GrayScale"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _lerpValue ("GrayScale", Range(0, 1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        fixed _lerpValue;

        struct Input
        {
            float2 uv_MainTex;
        };


        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);

            //1. 컬러의 평균을 구하는 방법
            //o.Albedo = ( c.r + c.g + c.b ) / 3;

            //2. r, g, b 에 지정된 상수 값을 곱해주는 방식
            //o.Albedo = c.r * 0.3 + c.g * 0.59 + c.b * 0.11;

            //3. dot 연산 
            //o.Albedo = dot(c.rgb, float3(0.3, 0.59, 0.11));

            o.Albedo = lerp(c.rgb, dot(c.rgb, float3(0.3, 0.59, 0.11)), _lerpValue);
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
