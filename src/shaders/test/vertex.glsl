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
    gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);

    // #### Don't do it like this
    // gl_Position.x += 0.5;
    // gl_Position.y += 0.5;
}