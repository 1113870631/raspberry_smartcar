#include <iostream>
#include <wiringPi.h>
#include "libSonar.h"

using namespace std;

int trigger = 4;
int echo = 5;

int main()
{
    if (wiringPiSetup() == -1)
        return -1;

    Sonar sonar;
    sonar.init(trigger, echo);

    while(1){
        cout << "Distance is " << sonar.distance(30000) << " cm." << endl;
    }
}
