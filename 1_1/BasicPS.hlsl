#include "Basic.hlsli"

Texture2D<float4> tex : register(t0);  	// 0�ԃX���b�g�ɐݒ肳�ꂽ�e�N�X�`��
SamplerState smp : register(s0);      	// 0�ԃX���b�g�ɐݒ肳�ꂽ�T���v���[

float4 main(VSOutput input) : SV_TARGET{
	float3 light = normalize(float3(1, -1, 1));//�E�����@�����̃��C�g
	float diffuse = saturate(dot(-light, input.normal));//diffuse��[0,1]�͈̔͂�Clamp����
	float brightness = diffuse + 0.3f;;
	float4 texcolor = float4(tex.Sample(smp, input.uv));
	return float4(texcolor.rgb * brightness, texcolor.a) * color;
	return float4(tex.Sample(smp, input.uv));
	//return float4(input.normal,1);//RGB�����ꂼ��@����XYZ,A��1�ŏo��
	//float brightness = dot(-light, input.normal);//�����ւ̃x�N�g���Ɩ@���x�N�g���̓���
	//return float4(brightness, brightness, brightness, 1);//�P�x��RGB�ɑ�����ďo��
	//return float4(1,1,1,1);
}

//#include "Basic.hlsli"
//
//float4 main(VSOutput input) : SV_TARGET
//{
//	return float4(input.uv, 0, 1);
//}
//�}�e���A��
//cbuffer ConstBufferDataMaterial : register(b0)
//{
//	float4 color; // �F(RGBA)
//};
//float4 main() : SV_TARGET
//{
//	return color;
//}
