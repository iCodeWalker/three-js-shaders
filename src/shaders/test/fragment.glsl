precision mediump float;

// ########## accessing varying in fragment shader ###########
varying float vRandom;

void main()
{
    gl_FragColor = vec4(vRandom, vRandom*0.8, 1.0, 1.0);
}