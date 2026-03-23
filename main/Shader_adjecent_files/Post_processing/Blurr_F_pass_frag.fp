
varying highp vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;

uniform vec4 uTime;

void main()

{	
	// BARREL ROLLL ____-___--_---_--------___--__--___-__--__-__
	float power = 0.02;
	vec2 uv_centered = var_texcoord0 * 2.0 - 1.0;
	float r2 = dot(uv_centered,uv_centered);

	uv_centered *= 1.0 + power * r2;

	uv_centered /= (1.0 + power * 2.0);

	vec2 uv = uv_centered * 0.5 + 0.5;

	uv = clamp(uv, 0.0, 1.0);

	
	vec4 color = texture2D(texture_sampler,uv);

	// GLOW BLURR EFFECT   ____-___--_---_--------___--__--___-__--__-__
	vec3 glow = vec3(0.0);
	float offset = 4.0 / 480.0;
	
	for(int x=-1; x<=1; x++) {
		for(int y= -1; y<=1; y++) {
			vec2 sampleUv = uv + vec2(float(x)*offset, float(y)*offset) ;
			vec3 sampleColor = texture2D(texture_sampler, clamp(sampleUv, 0.0, 1.0)).rgb;

			float brightness = max(sampleColor.r, max(sampleColor.g, sampleColor.b));

			float weight = pow(brightness, 10.0);

			glow += sampleColor * weight;
		}

	}
	
	color.rgb += (glow / 10.0) * 0.8;
	
	// VINGRETE  ____-___--_---_--------___--__--___-__--__-__
	
	float radIn = 0.05;
	float radOut = 1.5;

	float vingrete = smoothstep(radIn,radOut, length(uv_centered));

	vingrete = pow(vingrete, 2.0);
	
	color.a *= 1.0 -  vingrete / 0.99 ;

	// CCOLOR SHIFT TO VIBRANCE  ____-___--_---_--------___--__--___-__--__-__
	float saturation = 1.2;
	vec3 LumW = vec3(0.2126,0.7152,0.0722);
	float Lum = dot(color.rgb, LumW);
	color.rgb = mix(vec3(Lum),color.rgb,saturation);
	color.rgb += 0.05;
	
	
	// SCAN LINES  ____-___--_---_--------___--__--___-__--__-__
	float speed = 1.5;
	float scan = 0.5 + 0.5 * sin(var_texcoord0.y * 500 * 3.14159 + uTime.x * speed);

	float scan_spike = pow(scan, 10.0);
 
	color.rgb += scan_spike * 0.04;


	
	// RGB MASK  ____-___--_---_--------___--__--___-__--__-__
	float thickness = 350.0;
	float stripes = 350;
	float m = var_texcoord0.x * stripes * 2.09439;

	vec3 mask ;
		mask.r = 0.5 + 0.5 * sin(m);
		mask.g = 0.5 + 0.5 * sin(m - 2.09439 );
		mask.b = 0.5 + 0.5 * sin(m - 4.18879);

	mask = (mask * 0.5) + 0.5;
	color.rgb *= mask;

	
		
	
		
	gl_FragColor = color;
}