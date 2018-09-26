execute_process(COMMAND "/VirtualShare/uva-robotics/main/build/audio_engine/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/VirtualShare/uva-robotics/main/build/audio_engine/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
