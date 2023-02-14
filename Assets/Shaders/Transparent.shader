Shader "Custom/Transparent"
{
    Properties
    {
     _RimColor("Rim Color", Color) = (0, 0.5, 0.5, 0.0)
     _RimPower ("Rim Power", Range(0.5, 8.0)) = 3.0
     _MainTex("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "Queue"="Transparent" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Lambert alpha:fade

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
            float3 viewDir;
        };

        float4 _RimColor;
        float _RimPower;


        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Alpha = tex2D(_MainTex, IN.uv_MainTex).r;
            o.Emission = _RimColor.rgb * pow(rim, _RimPower) * 10;
            o.Alpha = pow(rim, _RimPower);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
