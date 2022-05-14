Shader "Custom/lambert"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert // 라이팅 함수를 램버트 라이팅 함수로 변경함.

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        // 라이팅 함수의 구조체도 SurfaceOutputStandard 에서 SurfaceOutput 으로 바꿔줌.
        // 이 라이팅 구조체가 램버트 라이팅과 블린 퐁 라이팅이라는 유니티에 내장된 구형 라이팅에서 사용하는 구조체임. 
        void surf (Input IN, inout SurfaceOutput o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}

/*
    램버트 라이팅에 대한 설명은
    p.252 ~ 255 에 잘 나와있으니 참고할 것.
*/
