#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/VirtualShare/uva-robotics/main/src/speech_recognition/dialogflow"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/VirtualShare/uva-robotics/main/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/VirtualShare/uva-robotics/main/install/lib/python2.7/dist-packages:/VirtualShare/uva-robotics/main/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/VirtualShare/uva-robotics/main/build" \
    "/usr/bin/python" \
    "/VirtualShare/uva-robotics/main/src/speech_recognition/dialogflow/setup.py" \
    build --build-base "/VirtualShare/uva-robotics/main/build/speech_recognition/dialogflow" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/VirtualShare/uva-robotics/main/install" --install-scripts="/VirtualShare/uva-robotics/main/install/bin"
