#version 140

in mediump vec2 var_texcoord0;

out vec4 out_fragColor;

uniform mediump sampler2D texture_sampler;
uniform fs_uniforms
{
    mediump vec4 tint;
    vec4 flasher;
};

void main()
{
    // Pre-multiply alpha since all runtime textures already are
    mediump vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    lowp vec4 frag_color = texture(texture_sampler, var_texcoord0.xy) * tint_pm;
   
    frag_color.rgb *= flasher.x;
    
    
    out_fragColor = frag_color;
}
