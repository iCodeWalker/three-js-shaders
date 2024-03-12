# Shaders

1. Everthing showing up on the WebGL render is mage possible because of shaders.

2. We have been using shaders by using three.js materials, these shaders are made by other developers for the community.

3. What is a Shader

   1. One of the main component of WebGL.
   2. For just simply creating a cube we have to write many line of codes. if we are using native WebGL.
   3. Shader is basically a Program written in GLSL. Just like our javascript program, this program is sent to GPU for compile. In these programs we basicaly do two things. First, We position our geometry, that is we position the each vertex of the geometry and shader will put the geometry on the render. Second, it colorize each visible pixel of that geometry.

   For colorizing pixel isn't accurate because each point in the render dosen't necessarily match each pixel of the screen. So we are going to 'fragment'. Because somtimes the render can be drawn but not visible on screen and sometimes it can be very large render but squished to a small.

4. We send a lot of data to the shaders

   1. Vertices coordinates.
   2. Mesh transformation.
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

      We cannot send attributes to fragments, But we can send data from vertex shader to fragment shader these values that we send from vertex fragment to fragment is called varying.

      The values will be interpolated between the vertices.

6. Why use shaders
   Three.js materials are limited.
   Our built shaders can be very simple and performant.
   We can add custom post-processing.
