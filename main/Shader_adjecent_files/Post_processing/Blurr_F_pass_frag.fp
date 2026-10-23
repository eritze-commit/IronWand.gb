#version 140
precision highp float;

in vec2 var_texcoord0;
out vec4 fragColor;

uniform sampler2D texture_sampler;

uniform fs_uniforms
{

uniform vec4 uTime;
uniform vec4 scrn_res;
};

void main() {
    // BARREL ROLL
    float power = 0.02;
    vec2 uv_centered = var_texcoord0 * 2.0 - 1.0;
    float r2 = dot(uv_centered, uv_centered);

    uv_centered *= 1.0 + power * r2;
    uv_centered /= (1.0 + power * 2.0);

    vec2 uv = uv_centered * 0.5 + 0.5;
    uv = clamp(uv, 0.0, 1.0);

    vec4 color = texture(texture_sampler, uv);

    // VIGNETTE
    // correct for aspect ratio so the vignette is actually circular
    vec2 vignette_uv = uv_centered;
    vignette_uv.x *= scrn_res.x / scrn_res.y;

    float dist = length(vignette_uv);
    float vignette = smoothstep(0.5, 1.8, dist);
    vignette = pow(vignette, 4.0);

    color.rgb *= 0.9 - vignette * 0.80;

    // GLOW BLUR EFFECT
    vec3 glow = vec3(0.0);
    vec2 offset = vec2(
        4.0 / scrn_res.x,
        4.0 / scrn_res.y
    );
    
    for(int x = -1; x <= 1; x++) {
        for(int y = -1; y <= 1; y++) {
            vec2 sampleUv = uv + vec2(float(x) * offset.x * 1.25, float(y) * offset.y * 1.25);
            vec3 sampleColor = texture(texture_sampler, clamp(sampleUv, 0.0, 1.0)).rgb;

            float brightness = max(sampleColor.r, max(sampleColor.g, sampleColor.b));
            float weight = pow(brightness, 10.0);

            glow += sampleColor * weight;
        }
    }
    
    color.rgb += (glow / 10.0) * 0.8;

    // COLOR SHIFT TO VIBRANCE
    float saturation = 1.2;
    vec3 LumW = vec3(0.2126, 0.7152, 0.0722);
    float Lum = dot(color.rgb, LumW);
    color.rgb = mix(vec3(Lum), color.rgb, saturation);
    color.rgb += 0.05;

    // SCAN LINES
    float speed = 1.5;
    float scan = 0.5 + 0.5 * sin(var_texcoord0.y * scrn_res.y * 3.14159 / 20.0 + uTime.x * speed);
    float scan_spike = pow(scan, 2.5);
 
    color.rgb += scan_spike * 0.02;

    // RGB MASK STRIPES
    float stripes = scrn_res.x * 0.4;
    float m = var_texcoord0.x * stripes * 2.09439;

    vec3 mask;
    mask.r = 0.5 + 0.5 * sin(m);
    mask.g = 0.5 + 0.5 * sin(m - 2.09439);
    mask.b = 0.5 + 0.5 * sin(m - 4.18879);

    mask = (mask * 0.5) + 0.5;
    color.rgb *= mask;

    fragColor = color;
}
