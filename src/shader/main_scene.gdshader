shader_type canvas_item;

uniform vec4 color1 : source_color = vec4(0.0, 0.0, 0.0, 0.0);
uniform vec4 color2 : source_color = vec4(0.0, 0.0, 1.0, 1.0);

void fragment() {
    // 获取当前片元的UV坐标
    //vec2 uv = FRAGCOORD.xy / SCREEN_PIXEL_SIZE.xy;

    // 计算颜色渐变
    vec4 color = mix(color1, color2, sin(UV.x*PI*0.5));

    // 设置片元颜色
    COLOR = color;
}
