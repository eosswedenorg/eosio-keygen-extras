cmake_minimum_required(VERSION 3.5)

# Project name and version
project(eosio-keygen-extras
	VERSION 0.1.1
	DESCRIPTION "extra files for eosio-keygen"
	HOMEPAGE_URL "https://github.com/eosswedenorg/eosio-keygen-extras"
	LANGUAGES NONE
)

set( PROJECT_MAINTAINER "Henrik Hautakoski <henrik@eossweden.org>")

include(GNUInstallDirs)

set( CMAKE_INSTALL_DATADIR ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME} )

if (WIN32)
	# "Flat" install on windows.
	set( CMAKE_INSTALL_DATADIR "." )
endif (WIN32)


list(APPEND dictionaries
	english
	danish
	french
	swedish
)

# --------------------------------
#  Install targets
# --------------------------------
foreach(dict ${dictionaries})
	install(FILES dict/${dict}
		DESTINATION ${CMAKE_INSTALL_DATADIR}/dict
		COMPONENT ${dict})
endforeach(dict ${dictionaries})

# --------------------------------
#  Package
# --------------------------------
set( CPACK_PACKAGE_FILE_NAME "${PROJECT_NAME}-${PROJECT_VERSION}")
set( CPACK_PACKAGE_CONTACT ${PROJECT_MAINTAINER} )
set( CPACK_PACKAGE_VENDOR "Sw/eden" )
set( CPACK_PACKAGE_INSTALL_DIRECTORY "${PROJECT_NAME}")

# Archive specific
set( CPACK_ARCHIVE_COMPONENT_INSTALL TRUE )

# Debian specific
set( CPACK_DEB_COMPONENT_INSTALL TRUE )
set( CPACK_DEBIAN_PACKAGE_DEPENDS "eosio-keygen" )
set( CPACK_DEBIAN_PACKAGE_ARCHITECTURE "all" )
set( CPACK_DEBIAN_PACKAGE_RELEASE "1" CACHE STRING "Debian release number" )
set( CPACK_DEBIAN_PACKAGE_SECTION "extras" )

foreach(dict ${dictionaries})
	string( TOUPPER ${dict} COMPONENT )
	set( CPACK_DEBIAN_${COMPONENT}_PACKAGE_NAME "eosio-keygen-dict-${dict}" )
	set( CPACK_DEBIAN_${COMPONENT}_FILE_NAME "${CPACK_DEBIAN_${COMPONENT}_PACKAGE_NAME}_${PROJECT_VERSION}-${CPACK_DEBIAN_PACKAGE_RELEASE}_${CPACK_DEBIAN_PACKAGE_ARCHITECTURE}.deb")
	set( CPACK_DEBIAN_${COMPONENT}_DESCRIPTION "${dict} language dictionary for eosio-keygen")
endforeach(dict ${dictionaries})

if (NOT CPACK_GENERATOR)
	if (UNIX)
		set( CPACK_GENERATOR "TGZ" )
	else()
		set( CPACK_GENERATOR "ZIP" )
	endif()
endif()

include( CPack )
