//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float Time;

void main()
{
   float mult = 0.1;
   vec4 bc = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
   
   float Red = (0.8 +bc.r *mult);
   float Green = (0.1 +bc.g *mult);
   float Blue = 0.1;
   float Alpha = bc.a;
   vec4 New_Color = vec4(Red, Green, Blue, Alpha);
   gl_FragColor = New_Color;
}