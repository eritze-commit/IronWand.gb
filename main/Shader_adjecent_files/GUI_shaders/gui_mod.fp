#version 140

in mediump vec2 var_texcoord0;
in mediump vec4 var_color;


out vec4 out_fragColor;

uniform mediump sampler2D texture_sampler;

uniform fs_uniforms
{
    lowp vec4  u_time;
};


void main()
{
   float t = u_time.x * 0 ;
    //out_fragColor = texture(texture_sampler, var_texcoord0.xy) * var_color;
    out_fragColor = texture(texture_sampler, var_texcoord0.xy) * vec4(var_texcoord0.y*t ,var_texcoord0.x*t ,var_texcoord0.y*t ,1);
    
}
