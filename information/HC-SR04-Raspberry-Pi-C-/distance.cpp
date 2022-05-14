#include <iostream>
#include <wiringPi.h>
#include "libSonar.h"

using namespace std;

//int trigger = 4;
//int echo = 5;
/**
 * @brief 
 * 超声波wiringPi 引脚初始化
 * @param trigger   引脚编号
 * @param echo       引脚编号
 * @param sonar      Sonar实例
 * @return int 
 */
int Distance_Gpio_init(int trigger,int echo,Sonar &sonar ){
    if (wiringPiSetup() == -1)
        return -1;

    sonar.init(trigger, echo);
}
int Get_distance(Sonar &sonar)
{
        return  (int)sonar.distance(30000);   
}
