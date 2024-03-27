# Shaders

1. Everthing showing up on the WebGL render is made possible because of shaders.

2. We have been using shaders by using three.js materials, these shaders are made by other developers for the community. So that the development process can be faster.

3. What is a Shader

   1. One of the main component of WebGL.
   2. For just simply creating a cube we have to write many line of codes. if we are using native WebGL.
   3. Shader is basically a Program written in GLSL. Just like our javascript program, this program is sent to GPU for compile. In these programs we basicaly do two things. First, We position our geometry, that is we position the each vertex of the geometry and shader will put the geometry in the scene on the render. Second, it colorize each visible pixel of that geometry.

   For colorizing pixel isn't accurate because each point in the render dosen't necessarily match each pixel of the screen. So we are going to use 'fragment'. Because somtimes the render can be drawn but not visible on screen and sometimes it can be very large render but squished to a small.

4. We send a lot of data to the shaders

   1. Vertices coordinates.
   2. Mesh transformation. (if postion of x is 1, than every vertices needs to move or rotate)
   3. information about the camera.
   4. Colors.
   5. Textures.
   6. Lights.
   7. Fog
   8. etc
      The GPU processes all of this data, by following the code we write for shaders.

5. There are two types of shaders

   1. Vertex shaders:
      Position each vertex of the geometry.
      We send shader to the GPU with data like vertices coordinates, the mesh transformations, camera info etc.
      The GPU will follow the instructions and position the vertices on the render.

      The same vertex shader will be used to create every vertices.
      Some data like the vertex position will be different for each vertex, These type of data is called 'attributes'.

      Some data like the position of mesh or camera are same for every vertices, These type of data is called 'uniforms'.

      Once the vertices are placed by the vertex shader, the GPU knows what pixels of the geometry are visible and can proceed to the fragment shader.

   2. Fragment Shader:
      Color each visible pixel of the geometry.
      The same fragment shader will be used for every visible fragment of the geometry.

      We create the fragment shader.
      We send the shader to the GPU with data like a color.
      The GPU follows the instructions and color the fragments.

      We can send uniform values to the fragments.

      We cannot send attributes to fragments, But we can send data from vertex shader to fragment shader these values that we send from vertex to fragment is called varying.

      The values will be interpolated between the vertices as we move away from vertexes.

6. Why use shaders
   Three.js materials are limited.
   Our built shaders can be very simple and performant.
   We can add custom post-processing.

7. First Shader With RawShaderMaterial
   We can use a ShaderMaterial or a RawShaderMaterial

   1. The ShaderMaterail will have some code automatically added to the shader codes.
   2. The RawShaderMaterial will have nothing.

8. The shader language is called GLSL (OpenGL Shading language), it is close to C language.

   1. cannot do logging(console.log()) or print in .glsl file
   2. The indentation is not essential.
   3. The 'semicolon' at the end of line is required.
   4. Variables :

      It is a typed language.
      We have to specify a variable type and cannot assign any other type to that variable.

      float firstVar = 0.012;
      int secondVar = -2;

   5. We can do mathematical operations. But can't mix float with int in operations.
      We can convert the type and than do the operations

      float a = 1.0;
      int b = 3;
      float c = a + float(b)

   6. Vec2 :
      Used to store 2 coordinates (x and y).
      A little like Three.js Vector2

      vec2 foo = vec2(1.0,2.0)

      // Properties can be changed after
      vec2 foo = vec2(0.0);
      foo.x = 1.0;
      foo.y = 2.0;

      // Doing operations on vec2 will multiply both the x and y
      vec2 foo = vec2(0.0);
      foo += 2.0;

   7. Vec3 :
      Similar to vec2 but with 'z'
      A little like Three.js Vector3.
      Convenient for 3D coordinates.

      vec3 foo = vec3(0.0);
      vec3 bar = vec3(1.0,2.0,3.0);
      bar.z = 4.0;

      // We can use r,g and b (aliases)
      // More adequat with colors

      vec3 purpleColor = vec3(0.0);
      purpleColor.r = 0.5;
      purpleColor.b = 1.0;

      // can be partially created from a vec2

      vec2 foo = vec2(1.0, 2.0);
      vec3 bar = vec3(foo, 3.0); or vec3(foo.x, foo.y, 3.0);

      // vec3 can be partially used to create vec2
      // called "swizzle"

      vec3 foo = vec3(1.0,2.0,3.0);
      vec2 bar = foo.xy

   8. Vec4 :
      Similar to vec3 but with a 'w'.
      A little like Three.js Vector4.
      a is an alias of w.

      vec4 foo = vec4(1.0,2.0,3.0,4.0);
      vec4 bar = vec4(foo.zw, vec2(5.0, 6.0));

   9. Function :

      A function must start with the type of value that will be returned.

      float loremIpsum() {
      float a = 1.0;
      float b = 3.0;

      return a+b;
      }

   10. Many built-in classic functions sin, cos, max, min, pow, exp, mod, clamp.
       And many more functions like cross, dot, mix, step, smoothstep, length, distance, reflect, refract, normalise.

   11. Shaderific : https://shaderific.com/glsl.html
   12. Book of shaders glosary : https://thebookofshaders.com/glossary/

9. Understanding Vertex Shader :
   Main function:

   1. Called automatically. The GPU will call this function.
   2. Doesn't return anything (void).

   3. Inside this main function we have a "gl_position" variable. This variable already exists, we just re-assign value to it.
   4. It contain the position of the vertex on the screen. And at the end it will position the vertex at the right place in the screen or on the render.

   5. "gl_position" will have a vec4 in it (according to our example).
   6. The render is a 2D but still we have to provide vec4 to it. Because the coordinates are in fact in clip space. It's like positioning an object in a box. The "z" is for the depth(to know which part is in front of the other) and "w" is responsible for the perspective

   7. We can move the shader using
      gl_Position.x += 0.5;
      gl_Position.y += 0.5;

   8. position attribute :
      Provide us the position attribute
      Different between each vertex.
      Contain x,y and z coordinate from the attribute.
