#include "../paracompFinalConstants/constants.cu"
#include <math.h>

__global__
void findCoordinate(int numFFTPairs, Coordinate* micCoordinates,
                    WavePairContainer* filteredPairs) {

  int tid = blockIdx.x * blockDim.x + threadIdx.x;

  if (tid >= numPairs){
    return;
  }

  decimal micDistances[numPairs];

  int mic1 = filteredPairs[idx].firstFFT;
  int mic2 = filteredPairs[idx].secondFFT;
  micDistances[tid] = sqrt(micCoordinates[mic1].x * micCoordinates[mic1].x +
                      micCoordinates[mic2].y * micCoordinates[mic2].y);
  
  //speed of sound is about 34320 centimeters per second (ma.
  
