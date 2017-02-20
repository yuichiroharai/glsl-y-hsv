# glsl-y-hsv

The conversions between RGB and HSV for [glslify](http://github.com/chrisdickinson/glslify).

originally sources from  
https://www.shadertoy.com/view/lsdGzN  
https://www.shadertoy.com/view/MsS3Wc  
http://lolengine.net/blog/2013/07/27/rgb-to-hsv-in-glsl


## Usage

[![NPM](https://nodei.co/npm/glsl-y-hsv.png?mini=true)](https://nodei.co/npm/glsl-y-hsv/)

#### `vec3 hsv2rgb(in vec3 hsv)`

```glsl
uniform vec2 resolution;

#pragma glslify: hsv2rgb = require(glsl-y-hsv)
// or 
// #pragma glslify: hsv2rgb = require(glsl-y-hsv/hsv2rgb)

void main(void) {
    vec2 position = (gl_FragCoord.xy / resolution);
    
    vec3 hsv = vec3(position, 1.0);
    vec3 rgb = hsv2rgb(hsv);
    
    gl_FragColor = vec4(rgb, 1.0);
}
```

#### `vec3 hsv2rgbSmooth(in vec3 hsv)`

```glsl
uniform vec2 resolution;

#pragma glslify: hsv2rgbSmooth = require(glsl-y-hsv/hsv2rgbSmooth)

void main(void) {
    vec2 position = (gl_FragCoord.xy / resolution);
    
    vec3 hsv = vec3(position, 1.0);
    vec3 rgb = hsv2rgbSmooth(hsv);
    
    gl_FragColor = vec4(rgb, 1.0);
}
```


#### `vec3 rgb2hsv(in vec3 rgb)`

```glsl
uniform vec2 resolution;

#pragma glslify: hsv2rgb = require(glsl-y-hsv/hsv2rgb)
#pragma glslify: rgb2hsv = require(glsl-y-hsv/rgb2hsv)

void main(void) {
    vec2 position = (gl_FragCoord.xy / resolution);
    
    vec3 rgb = vec3(position, 1.0);
    vec3 hsv = rgb2hsv(rgb);
    hsv.x += 90.0/360.0;
    rgb = hsv2rgb(hsv);
    
    gl_FragColor = vec4(rgb, 1.0);
}
```

#### `vec3 lerpHSV(in vec3 hsv1, in vec3 hsv2, in float rate)`

```glsl
uniform vec2 resolution;
uniform float time;

#pragma glslify: hsv2rgb = require(glsl-y-hsv/hsv2rgb)
#pragma glslify: lerpHSV = require(glsl-y-hsv/lerpHSV)

void main(void) {
    vec2 position = (gl_FragCoord.xy / resolution);
    
    vec3 hsv1 = vec3(position, 1.0);
    vec3 hsv2 = vec3(position, 1.0);
    hsv2.x += 180.0/360.0;
    
    vec3 hsv = lerpHSV(hsv1, hsv2, sin(time) * 0.5 + 0.5);
    vec3 rgb = hsv2rgb(hsv);
	
    gl_FragColor = vec4(rgb, 1.0);
}
```