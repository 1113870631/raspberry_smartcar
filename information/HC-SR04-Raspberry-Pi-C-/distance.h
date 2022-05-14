#ifndef  __DISTANCE_H__
#include "libSonar.h"


int Distance_Gpio_init(int trigger,int echo,Sonar &sonar );
int Get_distance(Sonar &sonar);

#endif // ! __DISTANCE_H__

