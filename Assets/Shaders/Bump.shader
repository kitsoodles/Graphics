Shader "Custom/Bump"
{
    Properties{
        _myDiffuse("Diffuse Texture", 2D) = "blue" {}
        _myBump("Bump Texture", 2D) = "bump" {}      
        _mySlider("Bump Amount", Range(0,10)) = 1
        _Color("Color", Color) = (1, 1, 1, 1)
        _MetallicTex("Metallic (R)", 2D) = "blue" {}
        _Metallic("Metallic", Range(0.0, 1.0)) = 0.0
        _myCube("Reflection Map", Cube) = "blue" {}
    }

        SubShader{
            Tags
            {
                "Queue" = "Geometry"
            }

         CGPROGRAM
         #pragma surface surf StandardSpecular 
         sampler2D _MetallicTex;
         samplerCUBE _myCube;
         half _Metallic;
         fixed4 _Color;
         sampler2D _myDiffuse;
         sampler2D _myBump;
         half _mySlider;

         struct Input {
         float2 uv_myDiffuse;
         float2 uv_myBump;
         float2 uv_MetallicTex;
         };

         void surf(Input IN, inout SurfaceOutputStandardSpecular o) {
             o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse).rgb;
             o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump));
             o.Normal *= float3(_mySlider, _mySlider, 1);
             o.Albedo = _Color.rgb;
             o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex).r;
             o.Specular = _Metallic;

         }
         ENDCG
        }
    FallBack "Diffuse"
}
