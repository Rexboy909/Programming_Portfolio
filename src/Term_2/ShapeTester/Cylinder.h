#ifndef CYLINDER_H
#define CYLINDER_H
#include <string>
using namespace std;

class Cylinder {
private:
    int R,H;
    const double pi = 3.14159265358979323846;
public:
    // Constructor
    Cylinder(int R, int H){
        this->R = R;
        this->H = H;
    }

    // Getter methods
    int getV(){
        int vol = (pi*pow(R,2)*H);
        return vol;
    }
    int getSA(){
        int surf = 2*pi*R*H+2*pi*pow(R,2);
        return surf;
    }

};

#endif