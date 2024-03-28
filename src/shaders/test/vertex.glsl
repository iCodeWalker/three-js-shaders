uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;
// uniform mat4 modelViewMatrix

// ####### retrieve the value in the vertex shader and use it for the waves frequency ########
// uniform float uFrequency;
uniform vec2 uFrequency;

// ####### retrieve the uniform value in the vertex shader
uniform float uTime;

attribute vec3 position;

// ########### Get custom attribute in vertex shader ############
// attribute float aRandom;

// ########### varying ###########
// varying float vRandom;

// ### Function ###
float loremIpsum(float a, float b) {
    return a + b;
}

void main()
{
    // Shorter version where the viewMatrix and the modelMatrix are combined into a modelViewMatrix 
    // gl_Position = projectionMatrix * modelViewMatrix  * vec4(position, 1.0);
    
    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);

    // ######## Separating each matrix ###########

    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    // Now we can manipulate the shader position.
    // modelPosition.x += 1.0;
    // Now we can create a wave.

    // modelPosition.z += sin(modelPosition.x * 10.0) * 0.1;
    modelPosition.z += sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
    modelPosition.z += sin(modelPosition.y * uFrequency.y - uTime) * 0.1;

    // ########### As it is a Mesh we can still change it's position, rotation and scale
    // modelPosition.y *= 0.5;


    // modelPosition.z = aRandom * 0.1;
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectionPostion = projectionMatrix * viewPosition;

    gl_Position = projectionPostion;

    // assign attribute value to varying
    // vRandom = aRandom;


    // #### Don't do it like this
    // gl_Position.x += 0.5;
    // gl_Position.y += 0.5;
}