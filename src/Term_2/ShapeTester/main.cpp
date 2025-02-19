#include <iostream>
#include <string>
#include "Box.h"
#include "Sphere.h"
#include "Pyramid.h"
#include "Cylinder.h"
using namespace std;

int main()
{
    cout << "Welcome to the Shape Tester." << endl;
    bool L = true;
    while(L)
    {
        cout << "Type 1 for Box, type 2 for Sphere, type 3 for Pyramid, type 4 for Cylinder: " << endl;
        int t;
        cin >> t;
        if (!cin) {
            cout << "please re-run and enter a valid number" << endl;
            return 0;
        }
        if (t<1 || t>4) {
            cout << "please re-run and enter a valid number" << endl;
            return 0;
        }
        if (t == 1){
            cout << "Please Enter Length, width, and height:" << endl;
            int l,w,h;
            cout << "Length: " << endl;
            cin >> l;
            cout << "Width: " << endl;
            cin >> w;
            cout << "Height: " << endl;
            cin >> h;
            if (!cin) {
                cout << "please re-run and enter a number" << endl;
                return 0;
            }
            Box obj1(l,w,h);
            cout << "Box Volume is " << obj1.getV() << " units ^3" << endl;
            cout << "Box Surface Area is " << obj1.getSA() << " units ^2" << endl;
        } else if (t == 2){
            cout << "Please Enter Sphere Radius with decimals:" << endl;
            cout << "if it is a whole number, enter the decimal as 0. Example:" << endl << "12.0" << endl;
            cout << "Radius: " << endl;
            float R;
            cin >> R;
            if (!cin) {
                cout << "please re-run and enter a number" << endl;
                return 0;
            }
            Sphere obj2(R);
            cout << "Sphere Circumference is " << obj2.getC() << " units" << endl;
            cout << "Sphere Volume is " << obj2.getV() << " units ^3" << endl;
            cout << "Sphere Surface Area is " << obj2.getSA() << " units ^2" << endl;
        } else if (t == 3){
            int S,SL,H;
            cout << "Enter Number of Sides: " << endl;
            cin >> S;
            cout << "Enter Pyramid Height: " << endl;
            cin >> H;
            cout << "Enter Base Side Lengths: " << endl;
            cin >> SL;
            if (!cin) {
                cout << "please re-run and enter a number" << endl;
                return 0;
            }
            float SF = static_cast<float>(S);
            float HF = static_cast<float>(H);
            float SLF = static_cast<float>(SL);
            Pyramid obj3(SF,HF,SLF);
            cout << "Pyramid Volume is " << obj3.getV() << " units ^3" << endl;
            cout << "Pyramid Surface Area is " << obj3.getSA() << " units ^2" << endl;
        } else if (t == 4){
            int R,H;
            cout << "Enter Cylinder Radius: " << endl;
            cin >> R;
            cout << "Enter Cylinder Height: " << endl;
            cin >> H;
            float RF = static_cast<float>(R);
            float HF = static_cast<float>(H);
            Cylinder obj4(RF,HF);
            cout << "Pyramid Volume is " << obj4.getV() << " units ^3" << endl;
            cout << "Pyramid Surface Area is " << obj4.getSA() << " units ^2" << endl;
        }
        cout << "would you like to make another shape? (y/n)"<< endl;
        char s;
        cin >> s;
        if (!cin) {
            cout << "Invalid response. closing program." << endl;
            return 0;
        }
        if(s == 'n' || s == 'N'){
            cout << "Closing program" << endl;
            L = false;
        } else if (!cin){
            cout << "Invalid response. closing program." << endl;
            return 0;
        }else if (s == 'y' || s == 'Y'){
            L = true;
        } else {
            cout << "Invalid response. closing program." << endl;
            return 0;
        }
    }
}