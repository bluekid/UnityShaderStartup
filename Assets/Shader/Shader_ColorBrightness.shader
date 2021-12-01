Shader "Custom/Shader_ColorBrightness"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Red ("Red", Range(0,1)) = 0
        _Green ("Green", Range(0, 1)) = 0
        _Blue ("Blue", Range(0,1)) = 0
        _Brightness ("Brightness", Range(-1, 1)) = 0
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

        struct Input
        {
            float4 color : COLOR;
        };

        float _Red;
        float _Green;
        float _Blue;
        float _Brightness;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            //o.Albedo = float3(_Red,_Green,_Blue) + _Brightness;
            o.Emission = float3(_Red,_Green,_Blue) + _Brightness;
            o.Alpha = 1;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
