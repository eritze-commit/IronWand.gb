
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 tint;

void main()
{
	vec4 color = texture2D(texture_sampler, var_texcoord0);

	// Threshold for darkness (0 = black, 1 = white)
	float threshold = 0.1;

	// If R,G,B all below threshold, keep opaque, else transparent
	float mask = (color.r < threshold && color.g < threshold && color.b < threshold) ? 1.0 : 0.0;

	// Set alpha and optionally fade out the color
	color.a = mask;
	color.rgb = vec3(var_texcoord0.x,var_texcoord0.y,0.5);
	//color.rgb *= mask; // if you want bright pixels to be invisible

	gl_FragColor = color; 
	
}
