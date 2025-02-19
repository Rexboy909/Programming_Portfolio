#ifndef PYRAMID_H
#define PYRAMID_H
#include <string>
#include <cmath>
using namespace std;

class Pyramid {
private:
    float S;
    float H;
    float SL;
public:
    // Constructor
    Pyramid(float S, float H, float SL){
        this->S = S;
        this->H = H;
        this->SL = SL;
    }

    // Methods
    float getV(){
        float ba = (pow(SL,2)*S)/(4+tan(180/S));
        float vol = (ba*H)/3;
        return vol;
    }
    float getSA(){
        float ba = (pow(SL,2)*S)/(4+tan(180/S));
        float slanth = sqrt(pow((SL/2),2)+pow(H,2));
        float surf = ((1/2)*(S*SL)*slanth)+ba;
        return surf;
    }
};

#endif