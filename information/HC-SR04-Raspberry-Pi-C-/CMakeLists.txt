aux_source_directory(. SR04_DISTANCE)
find_library(WIRINGPI_LIBRARIES NAMES wiringPi)

add_library(SR04_DISTANCE_LIB ${SR04_DISTANCE})
target_link_libraries(SR04_DISTANCE_LIB ${WIRINGPI_LIBRARIES})