shader_type canvas_item;

uniform vec4 post = vec4(1f);

vec4 posterize(vec4 In, vec4 Steps){
	 return floor(In / (1f / Steps)) * (1f / Steps);
}

void fragment(){
	COLOR = posterize(texture(TEXTURE, UV), post);
}

