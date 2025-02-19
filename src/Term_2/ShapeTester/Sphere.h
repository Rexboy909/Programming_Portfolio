#ifndef SPHERE_H
#define SPHERE_H
#include <string>
#include <cmath>
using namespace std;

class Sphere {
private:
    float R;
    const double pi = 3.14159265358979323846;
public:
    // Constructor
    Sphere(float R){
        this->R = R;
    }

    // Methods
    double getV(){
        double vol = ((4.0/3.0)*pi*(pow(R,3.0)));
        return vol;
    }
    double getSA(){
        double surf = (4.0*pi*(pow(R,2.0)));
        return surf;
    }
    double getC(){
        double circum = (2.0*pi*R);
        return circum;
    }

};

#endif