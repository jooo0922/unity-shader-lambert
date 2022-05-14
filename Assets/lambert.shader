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
        #pragma surface surf Lambert // ������ �Լ��� ����Ʈ ������ �Լ��� ������.

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        // ������ �Լ��� ����ü�� SurfaceOutputStandard ���� SurfaceOutput ���� �ٲ���.
        // �� ������ ����ü�� ����Ʈ �����ð� �� �� �������̶�� ����Ƽ�� ����� ���� �����ÿ��� ����ϴ� ����ü��. 
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
    ����Ʈ �����ÿ� ���� ������
    p.252 ~ 255 �� �� ���������� ������ ��.
*/
