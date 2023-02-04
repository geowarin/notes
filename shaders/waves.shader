shader_type spatial;

uniform sampler2D u_island_tex: source_color;
uniform float u_speed: hint_range(0.0, 100.0, 1) = 1.;

void fragment() {
	vec4 tex = texture(u_island_tex, UV);

	float shape = UV.x;
	//float shape = tex.r;

	float waves = (sin(shape / 0.01 + TIME * u_speed) + 1.) * 0.5;

	ALBEDO = vec3(waves);
}
