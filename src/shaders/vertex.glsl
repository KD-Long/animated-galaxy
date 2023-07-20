
uniform float uSize;
uniform float uTime;

attribute float starSize;
attribute vec3 aRandomness;


varying float vstarSize;
varying vec3 vColor;

void main(){
    // projection view model vec positions


    vec4 modelPosition = modelMatrix * vec4(position,1.0);

    // animate the particles
    float angle = atan(modelPosition.x,modelPosition.z);
    float distanceToCenter = length(modelPosition.xz);
    float angleOffset = (1.0/distanceToCenter)*uTime*0.2;

    angle+=angleOffset;

    modelPosition.x = distanceToCenter*cos(angle);
    modelPosition.z = distanceToCenter*sin(angle);

    modelPosition.xyz += aRandomness.xyz;


    vec4 viewModelPosition = viewMatrix * modelPosition;
    gl_Position = projectionMatrix * viewModelPosition;


    gl_PointSize = uSize * starSize;
    gl_PointSize *= (1.0/ - viewModelPosition.z );

    vstarSize = starSize;
    vColor = color;
}