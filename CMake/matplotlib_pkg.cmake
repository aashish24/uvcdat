set( MATPLOTLIB_MAJOR_MIN 1  )
set( MATPLOTLIB_MINOR_MIN 1  )
set( MATPLOTLIB_PATCH_MIN 0  )
set( MATPLOTLIB_MAJOR 1  )
set( MATPLOTLIB_MINOR 1  )
set( MATPLOTLIB_PATCH 1  )
set( MATPLOTLIB_VERSION ${MATPLOTLIB_MAJOR}.${MATPLOTLIB_MINOR}.${MATPLOTLIB_PATCH} )
set( MATPLOTLIB_URL ${LLNL_URL} )
set( MATPLOTLIB_GZ matplotlib-${MATPLOTLIB_VERSION}.tar.gz )
set( MATPLOTLIB_MD5 8cbeaae8ba9da703d926e74c3e7c8a57 )

add_cdat_package(Matplotlib "" "" "" "")
