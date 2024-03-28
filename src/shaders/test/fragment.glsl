precision mediump float;

// ########## accessing varying in fragment shader ###########
// varying float vRandom;

// ####### retrive uniform value
uniform vec3 uColor; 

// ####### retrive uniform texture value
uniform sampler2D uTexture;

// ####### retrive varying uv value
varying vec2 vUv;

// ####### retrive varying vElevation value
varying float vElevation;


void main()
{
    // We have to took the pixel color from the texture and than apply it in the fragment shader,

    // To do this we have to use texture2D() function.
    // The first parameter is the texture
    // The second parameter are the coordinates of from where to pick the color from the texture. 

    // The second parameter value is uv coordinates but we cannot access it here directly as it is an attribute.
    // So we have to pass it through the Vertex shader
    vec4 textureColor = texture2D(uTexture, vUv);

    // adding shadow effect using vElevation
    textureColor.rgb *= vElevation * 2.0 + 1.0;

    //gl_FragColor = vec4(vRandom, vRandom*0.8, 1.0, 1.0);
    // gl_FragColor = vec4(1.0, 0.0,0.5, 1.0);
    // gl_FragColor = vec4(uColor, 1.0);

    gl_FragColor = textureColor;
}