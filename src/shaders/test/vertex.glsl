uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

attribute vec3 position;

// ### Function ###
float loremIpsum(float a, float b) {
    return a + b;
}

void main()
{
    // float a = 1.0;
    // int b = 3;
    // float c = a + float(b);

    // ######### vec3 ##########
    // vec2 foo = vec2(1.0,2.0);
    // foo *= 3.0;

    // vec3 bar = vec3(1.0,2.0,3.0);
    // bar.z = 4.0;

    // We can use r,g and b (aliases)
    // More adequat with colors
    vec3 purpleColor = vec3(0.0);
    purpleColor.r = 0.5;
    purpleColor.b = 1.0;

    // can be partially created from a vec2
    // vec2 foo = vec2(1.0, 2.0);
    // vec3 bar = vec3(foo, 3.0); or vec3(foo.x, foo.y, 3.0)

    // vec3 can be partially used to create vec2
    // called "swizzle"

    vec3 foo = vec3(1.0,2.0,3.0);
    vec2 bar = foo.xy;

    float result = loremIpsum(1.0, 3.0);

    gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
}