#ifndef BOX_H
#define BOX_H
#include <string>
using namespace std;

class Box {
private:
    int L,W,H;
public:
    // Constructor
    Box(int L, int W, int H){
        this->L = L;
        this->W = W;
        this->H = H;
    }

    // Getter methods
    int getV(){
        int vol = L*W*H;
        return vol;
    }
    int getSA(){
        int surf = 2*(W*L+H*L+H*W);
        return surf;
    }

};

#endif