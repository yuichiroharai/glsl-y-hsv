// HSV functions from iq (https://www.shadertoy.com/view/MsS3Wc)
vec3 hsv2rgb( in vec3 hsv )
{
    vec3 rgb = clamp( abs(mod(hsv.x*6.0+vec3(0.0,4.0,2.0),6.0)-3.0)-1.0, 0.0, 1.0 );

	return hsv.z * mix( vec3(1.0), rgb, hsv.y);
}

#pragma glslify: export(hsv2rgb)