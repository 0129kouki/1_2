#include "Basic.hlsli"

float4 main(VSOutput input) : SV_TARGET
{
	return float4(input.uv, 0, 1);
}

//マテリアル
//cbuffer ConstBufferDataMaterial : register(b0)
//{
//	float4 color; // 色(RGBA)
//};
//float4 main() : SV_TARGET
//{
//	return color;
//}
