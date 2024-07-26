//
// Simple passthrough fragment shader

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float Time;
uniform vec2 Texel;

//Modify the following three consts to change the wave effect to your liking
const float xSpeed = 3.5;
const float xFreq = 8.0;
const float xSize = 3.;

void main()
{
    float xWave = sin(Time/ (1000. *xSpeed) + v_vTexcoord.y*xFreq) * (xSize*Texel.x);
	float yWave = sin(Time/ (1000. *xSpeed) + v_vTexcoord.x*xFreq) * (xSize*Texel.y);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord + vec2(xWave, yWave));
}