
varying float vstarSize;
varying vec3 vColor;

void main(){
    // gl_PointCoord is the coordinates within the point (smilar to uv corrdinates of a plane)
    
    // white disc
    float sCircle = 1.0 - step(0.5,distance(gl_PointCoord,vec2(0.5)));
    // diffuse point
    float sSiff = 1.0 - distance(gl_PointCoord,vec2(0.5))*2.0;
    // light point patern
    float sPow = pow(1.0 - distance(gl_PointCoord,vec2(0.5)),10.0);
    



    float starType[3] = float[3](sCircle,sSiff,sPow);

    //gives values between 0 - 2 from random size value to deternin random star type
    int index = int(mod((vstarSize*3.0),3.0));
    

    // Final color
    vec3 blackColor = vec3(0.0);
    vec3 mixedColor = mix(blackColor, vec3(vColor), starType[index]);



    gl_FragColor = vec4(mixedColor ,1);




}