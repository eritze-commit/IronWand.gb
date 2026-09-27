#version 140

in mediump vec2 var_texcoord0;

out vec4 out_fragColor;

uniform mediump sampler2D texture_sampler;
uniform fs_uniforms
{
    mediump vec4 alpha;
};

void main()
{
    
    lowp vec4 frag_color = texture(texture_sampler, var_texcoord0) ;
    float a = texture(texture_sampler, var_texcoord0).a;
 
    
    if (a > 0.0) {
        //a = alpha.x ;
        frag_color.r *= alpha.x  ;
        frag_color.g *= alpha.x  ;
        frag_color.b *= alpha.x  ;
        frag_color.a *= alpha.x  ;
    }
   
    
    
    out_fragColor = frag_color;
}
