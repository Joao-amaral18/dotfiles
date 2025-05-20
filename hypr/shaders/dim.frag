#version 330

// This shader dims the screen by multiplying the colors by a factor

// Input from vertex shader
in vec2 v_texcoord;

// Output to framebuffer
out vec4 fragColor;

// Texture sampler
uniform sampler2D tex;

// Dimming factor - this will be set by hyprshade based on the selected preset
// 0.75 = 25% dimming, 0.5 = 50% dimming, 0.25 = 75% dimming
uniform float dim_factor = 0.75;  // Default for dim-25

void main() {
    // Get the original pixel color
    vec4 originalColor = texture(tex, v_texcoord);
    
    // Apply dimming by multiplying RGB channels by dim_factor
    // Keep alpha channel unchanged
    fragColor = vec4(originalColor.rgb * dim_factor, originalColor.a);
}
