// Linear interpolation between two colors in normalized (0..1) HSV space
vec3 lerpHSV(in vec3 hsv1, in vec3 hsv2, in float rate)
{
    float hue = (mod(mod((hsv2.x-hsv1.x), 1.) + 1.5, 1.)-0.5)*rate + hsv1.x;
    return vec3(hue, mix(hsv1.yz, hsv2.yz, rate));
}

#pragma glslify: export(lerpHSV)