SET(LINK_DEPS
	Qt6::Core
	Qt6::Quick
)

SET(EXTRAMOC
	"${ROOT_DIR}/src/ui/qml/quickfuture/src/quickfuture.h"
)

create_qml_component(quickfuture 0.1.0 "${LINK_DEPS}" "${EXTRAMOC}")
