extern "C" 
__device__
float cuda_saxpy_dev(float a, float x, float y){
    return a * x + y;
}

extern "C" float saxpy_dev(float a, float x, float y){
    return a * x + y;
}




