uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;
// uniform mat4 modelViewMatrix

attribute vec3 position;

// ### Function ###
float loremIpsum(float a, float b) {
    return a + b;
}

void main()
{
    // Shorter version where the viewMatrix and the modelMatrix are combined into a modelViewMatrix 
    // gl_Position = projectionMatrix * modelViewMatrix  * vec4(position, 1.0);

    gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);


    // #### Don't do it like this
    // gl_Position.x += 0.5;
    // gl_Position.y += 0.5;
}