//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
   
   vec4 Base_Color = texture2D( gm_BaseTexture, v_vTexcoord );
   
   float Red = Base_Color.r *0.8;
   float Green = Base_Color.g *0.8;
   float Blue = Base_Color.b *1.1;
   float Alpha = Base_Color.a;
   
   vec4 New_Color = vec4(Red, Green, Blue, Alpha);
    gl_FragColor = New_Color;
}