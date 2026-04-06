#version 140

in mediump vec2 var_texcoord0;

out vec4 out_fragColor;

uniform mediump sampler2D texture_sampler;
uniform fs_uniforms
{
    mediump vec4 tint;
    vec4 flasher;
    mediump vec4 color_mod;
};

void main()
{
    // Pre-multiply alpha since all runtime textures already are
    mediump vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    lowp vec4 frag_color = texture(texture_sampler, var_texcoord0.xy)  * tint_pm ;
    float brightness = dot(frag_color.rgb,vec3(0.333,0.333,0.333));
    float white = smoothstep(0.2,1.0,brightness);
    float white_prot = 1.0 - white;
    
    float color_ranger = color_mod.x / 0.99;
    
    float boost = max(color_ranger,0.0);
    float darken = max(-color_ranger,0.0);
    
    frag_color.r += frag_color.r * boost * white_prot ;
    frag_color.b +=  frag_color.b * boost* 1.2 * white_prot;

    float darkness_modu = 4;
    frag_color.rgb *= 1.0 - (darken* darkness_modu) * white_prot ;
    frag_color.r += frag_color.r * (darken *  darkness_modu) * white_prot;
    frag_color.b += frag_color.b * (darken *  darkness_modu * 1.5 )* white_prot;


  
   
  
    
    frag_color.rgb *= flasher.x;
    
    
    out_fragColor = frag_color;
}
