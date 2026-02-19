//#version 140

varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;



void main()
{	
	vec4 color = texture2D(texture_sampler, var_texcoord0);

	float threshold = 0.1;

	float mask = (color.r < threshold && color.g < threshold && color.b < threshold) ? 1.0 : 0.0;


	color.a = mask;
	color.rgb += mask; 

	gl_FragColor = color;
	
	
}
