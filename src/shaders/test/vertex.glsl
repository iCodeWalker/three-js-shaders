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

// ####### retrieve the uv attribute value in the vertex shader
attribute vec2 uv;

// ####### send the uv attribute value to the fragment shader
varying vec2 vUv;

// ####### send the elevation variable value to the fragment shader, so we need one varying.
varying float vElevation;

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
    // modelPosition.z += sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
    // modelPosition.z += sin(modelPosition.y * uFrequency.y - uTime) * 0.1;

    // --->> Store the wind elevation in the variable as we need to send it to the Fragment shader for color variation
    float elevation = sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
    elevation += sin(modelPosition.y * uFrequency.y - uTime) * 0.1;

    modelPosition.z += elevation;
    // ########### As it is a Mesh we can still change it's position, rotation and scale
    // modelPosition.y *= 0.5;


    // modelPosition.z = aRandom * 0.1;
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectionPostion = projectionMatrix * viewPosition;

    gl_Position = projectionPostion;

    // assign uv attribute value to varying uUV
    vUv = uv;

    // update the vElevation varying
    vElevation = elevation;

    // assign attribute value to varying
    // vRandom = aRandom;


    // #### Don't do it like this
    // gl_Position.x += 0.5;
    // gl_Position.y += 0.5;
}