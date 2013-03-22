########################################################################
# SigmaSpectra 
# Copyright (C) 2011   Albert R. Kottke
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GPL License, Version 3.0
########################################################################

########################################################################
# Build type. For most cases this should be release, however during
# development of the software using the debug configuration can be
# beneficial.
########################################################################
#CONFIG += debug
#CONFIG += release
CONFIG += debug_and_release

########################################################################
# Compiler warning messages.
########################################################################
CONFIG += warn_on

########################################################################
# Setup of for the various libraries. This is most important on Windows.
########################################################################
# Linux
unix {
    LIBS += -lm \
        -lfftw3 \
        -lgsl \
        -lgslcblas \
        -L$$(QT_LIB_PATH) \
        -L$$(QWT_LIB_PATH) \
        -L"../qwt-6.0/lib/" \
        -lqwt
    INCLUDEPATH += . \
        ../qwt-6.0/src/ \
        $$(QT_INCLUDE_PATH) \
        $$(QWT_INCLUDE_PATH)
}
# Windows
win32 { 
    LIBS += -lm \
        -lfftw3-3 \
        -L"C:/devel/fftw-3.3.2" \
        -lgsl \
        -lgslcblas \
        -L"C:/devel/GnuWin32/bin"
    INCLUDEPATH += . \
        "C:/devel/fftw-3.3.2" \
        "C:/devel/qwt-6.0/src" \
        "C:/devel/GnuWin32/include"
    RC_FILE = sigmaSpectra.rc
    CONFIG(debug, debug|release ) {
        LIBS += -lqwtd \
            -L"C:/devel/qwt-6.0/lib"
    } else {
        LIBS += -lqwt \
            -L"C:/devel/qwt-6.0/lib"
    }
}
