
varying highp vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;

uniform vec4 uTime;
uniform vec4 scrn_res;

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


	// VINGRETE  ____-___--_---_--------___--__--___-__--__-__
	// correct for aspect ratio so the vignette is actually circular
	uv_centered.x *= scrn_res.x / scrn_res.y; // swap if your res uniform is y/x

	float dist = length(uv_centered);
	float vignette = smoothstep(0.5, 1.8, dist); // radIn, radOut — tweak these
	vignette = pow(vignette, 4); // pow(x, 1) does literally nothing btw

	color.rgb *= 0.9 - vignette * 0.80 ;

	
	// GLOW BLURR EFFECT   ____-___--_---_--------___--__--___-__--__-__
	vec3 glow = vec3(0.0);
	float offset = 4.0 /  scrn_res.y;
	
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
	// CCOLOR SHIFT TO VIBRANCE  ____-___--_---_--------___--__--___-__--__-__
	float saturation = 1.2;
	vec3 LumW = vec3(0.2126,0.7152,0.0722);
	float Lum = dot(color.rgb, LumW);
	color.rgb = mix(vec3(Lum),color.rgb,saturation);
	color.rgb += 0.05;
	
	
	// SCAN LINES  ____-___--_---_--------___--__--___-__--__-__
	float speed = 1.5;
	float scan = 0.5 + 0.5 * sin(var_texcoord0.y * scrn_res.y * 3.14159 / 20 + uTime.x * speed);

	float scan_spike = pow(scan, 2.5);
 
	color.rgb += scan_spike * 0.02;


	
	// RGB MASK  ____-___--_---_--------___--__--___-__--__-__
// 	vec2 pixel  =  	var_texcoord0 * vec2(scrn_res.x,scrn_res.y);
// 	float col =  mod(pixel.x,3);
// 
// 	vec3 mask;
// 	mask.r  = step(col,1.0);
// 	mask.g = step(1.0,col) * step(col,2.0);
// 	mask.b = step(2.0,col);
// 	mask = mix(mask, vec3(1.0),0.2);
// 	color.rgb *= mask;
// 
// 	float Scn_ln = mod(pixel.y, 2.0);
// 	Scn_ln = step(1.0,  Scn_ln);
// 	Scn_ln = mix(1.0, 0.3,  Scn_ln);
// 	color.rgb *= Scn_ln;
	


	float thickness = 350.0;
	float stripes =  scrn_res.x * 0.4;
	float m = var_texcoord0.x * stripes * 2.09439;

	vec3 mask ;
		mask.r = 0.5 + 0.5 * sin(m);
		mask.g = 0.5 + 0.5 * sin(m - 2.09439 );
		mask.b = 0.5 + 0.5 * sin(m - 4.18879);

	mask = (mask * 0.5) + 0.5;
	color.rgb *= mask;


	
	

	
		
	
		
	gl_FragColor = color;
}