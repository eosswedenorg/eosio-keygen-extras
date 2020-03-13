cmake_minimum_required(VERSION 3.4)

# Project name and version
project(eosio-keygen-extras
	VERSION 0.1.0
	DESCRIPTION "extra files for eosio-keygen"
	HOMEPAGE_URL "https://github.com/eosswedenorg/eosio-keygen-extras"
	LANGUAGES NONE
)

set( PROJECT_MAINTAINER "Henrik Hautakoski <henrik@eossweden.org>")

include(GNUInstallDirs)

# --------------------------------
#  Install target
# --------------------------------
install(
	DIRECTORY dict
	DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}
)

# --------------------------------
#  Package
# --------------------------------

if (UNIX)
	set( CPACK_GENERATOR "DEB" )
	set( CPACK_DEBIAN_PACKAGE_DEPENDS "eosio-keygen" )
	set( CPACK_DEBIAN_PACKAGE_ARCHITECTURE "all" )
	set( CPACK_DEBIAN_PACKAGE_RELEASE "1" CACHE STRING "Debian release number" )
	set( CPACK_DEBIAN_PACKAGE_SECTION "extras" )
	set( CPACK_DEBIAN_FILE_NAME "${PROJECT_NAME}_${PROJECT_VERSION}-${CPACK_DEBIAN_PACKAGE_RELEASE}_${CPACK_DEBIAN_PACKAGE_ARCHITECTURE}.deb" )
else()
	set( CPACK_GENERATOR "ZIP" )
endif()

# Info
set( CPACK_PACKAGE_CONTACT ${PROJECT_MAINTAINER} )

include( CPack )
