#!/bin/bash
echo "#############insmod###############"
sudo insmod ./rtl8812au/88XXau_wfb.ko
if [ "$?" -eq 0 ]; then
    echo "install  success"
else
    echo "install failed"
fi
sleep 1
echo "###########kill wpa_supplicant########"
str=`ps aux | grep "wpa_supplicant/wpa_supplicant.conf -iwlan1" | grep -v grep | awk '{print $2}'`
echo $str
kill -9 $str
if [ "$?" -eq 0 ]; then
    echo "kill success"
else
    echo "kill failed"
fi
sleep 1
echo "###########python3 -m telemetry.server grone########"
sudo python3 -m telemetry.server drone wlan1 &
if [ "$?" -eq 0 ]; then
    echo "start gs  success"
else
    echo "start gs failed"
fi
sleep 1
echo "###########gstreamer########"
#gst-launch-1.0 v4l2src device=/dev/video0  ! videoconvert ! video/x-raw ,format=NV12 ,width=1280,height=480 ! x264enc tune=ze#rolatency bitrate=2000  ! rtph264pay mtu=1400 config-interval=1 ! udpsink host=127.0.0.1 port=5602 sync=false 

GST_DEBUG=3 gst-launch-1.0 v4l2src device=/dev/video0  ! videoconvert ! video/x-raw ,format=NV12 ,width=1280,height=480 ! v4l2h264enc   ! 'video/x-h264,level=(string)4'! rtph264pay mtu=1400 config-interval=1 ! udpsink host=127.0.0.1 port=5602 sync=false

