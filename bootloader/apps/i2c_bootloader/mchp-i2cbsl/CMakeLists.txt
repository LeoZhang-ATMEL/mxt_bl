cmake_minimum_required (VERSION 2.8.1)

######## Project settings ########
PROJECT(mchp-i2cbsl)
SET(LICENSE "TBD")

######## Build and include settings ########
include_directories(
	inc
	src
)

link_directories(
	${LINK_DIRECTORIES}
)


file(GLOB SOURCES
	"src/*.c"
)

add_executable(
	mchp-i2cbsl

	${SOURCES}
)

TARGET_LINK_LIBRARIES(
	mchp-i2cbsl
)

######## Install targets ########
INSTALL(TARGETS mchp-i2cbsl
	RUNTIME DESTINATION usr/bin
)
