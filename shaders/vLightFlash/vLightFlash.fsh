//
// Invert Color Shader
//
// by WolfHybrid23 on gamemaker.io
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 OC = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    float NCr = OC.r +(OC.r / 0.4) *0.6;
    float NCg = OC.g +(OC.g / 0.4) *0.6;
    float NCb = OC.b +(OC.b / 0.2) *0.4;
    gl_FragColor = vec4( NCr, NCg, NCb, OC.a );
}