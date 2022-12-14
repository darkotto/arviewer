/*#version 300 es
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

layout(location = 0) in vec3 aPosition;
layout(location = 1) in vec2 aTexCoord;
layout(location = 2) in vec3 aNormal;
*/
out vec2 vTexCoord;
out vec3 vNormal;
out vec3 vVertex;

vec4 projectPoint(in vec4 point) {
   return projectionMatrix * point;
}

void main() {
   mat4 normalMat = transpose(inverse(modelViewMatrix));
   vec4 normalVec = normalMat * vec4(normal, 0.0);
   vNormal = normalize(normalVec.xyz);
   vVertex = (modelViewMatrix * vec4(position, 1.0)).xyz;
   gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
   vTexCoord = uv;
}

