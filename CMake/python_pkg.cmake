set(PYTHON_MAJOR 2)
set(PYTHON_MINOR 7)
set(PYTHON_PATCH 3)
set(PYTHON_MAJOR_SRC 2)
set(PYTHON_MINOR_SRC 7)
set(PYTHON_PATCH_SRC 3)
set(PYTHON_VERSION ${PYTHON_MAJOR_SRC}.${PYTHON_MINOR_SRC}.${PYTHON_PATCH_SRC})
set(PYTHON_URL ${LLNL_URL})
set(PYTHON_GZ Python-${PYTHON_VERSION}.tgz)
set(PYTHON_MD5 1b2127262ac007df0c7004ab50eb110c)
set(PYVER ${PYTHON_MAJOR_SRC}.${PYTHON_MINOR_SRC})

add_cdat_package(Python 2.7.3 "" "")

# FIXME: Name style
set(CDAT_OS_XTRA_PATH "")

if (CDAT_USE_SYSTEM_PYTHON)
   include(FindPythonInterp)
   set(PYVER ${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR})
   # \NOTE This is required or else FindPythonLibs may find whatever version is
   # listed first internally and if that version exists on the system. For example
   # a system might have python version 2.6 and 2.7 both installed.
   set(Python_ADDITIONAL_VERSIONS ${PYVER})
   include(FindPythonLibs)
   message("Using system python ${PYTHON_EXECUTABLE}")
   set(PYTHON_SITE_PACKAGES ${CMAKE_INSTALL_PREFIX}/lib/python${PYVER}/site-packages)
   message("Putting packages in directory ${PYTHON_SITE_PACKAGES}")
   set(PYTHON_EXTRA_PREFIX "--prefix=${CMAKE_INSTALL_PREFIX}")
   message("Setting up prefix for instaling python packages into: ${PYTHON_EXTRA_PREFIX}")
   set(ENV{LD_LIBRARY_PATH} $ENV{LD_LIBRARY_PATH})
   set(PYTHONPATH "${PYTHON_SITE_PACKAGES}:$ENV{PYTHONPATH}")
   message("Set PYTHONPATH to $ENV{PYTHONPATH}")
   get_filename_component(PYTHON_EXECUTABLE_PATH ${PYTHON_EXECUTABLE} PATH)
   set(PYTHON_LIBRARY ${PYTHON_LIBRARIES})
   message("set PYTHON_LIBRARY TO" ${PYTHON_LIBRARY})
   set(PYTHON_INCLUDE ${PYTHON_INCLUDE_DIRS})

   if(APPLE)
     set(CDAT_OS_XTRA_PATH  ${CMAKE_INSTALL_PREFIX}/Library/Frameworks/Python.framework/Versions/${PYVER}/bin)
   endif()

else ()
   set(PYTHON_EXECUTABLE ${CMAKE_INSTALL_PREFIX}/bin/python)
   message("Building you a python at ${PYTHON_EXECUTABLE}")
   set(PYTHON_EXTRA_PREFIX "")
   message("Building packages into this python")
   set(PYVER 2.7)
   if (NOT APPLE)
     set(EASY_INSTALL_BINARY ${CMAKE_INSTALL_PREFIX}/bin/easy_install)
     set(PYTHONPATH ${CMAKE_INSTALL_PREFIX}/lib/python${PYVER}/site-packages)
   else ()
     set(EASY_INSTALL_BINARY ${CMAKE_INSTALL_PREFIX}/Library/Frameworks/Python.framework/Versions/${PYVER}/bin/easy_install)
     set(PYTHONPATH ${CMAKE_INSTALL_PREFIX}/Library/Frameworks/Python.framework/Versions/${PYVER}/lib/python${PYVER}/site-packages)
   endif()
endif()
