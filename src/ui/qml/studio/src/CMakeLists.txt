SET(LINK_DEPS
	${CAF_LIBRARY_core}
	Qt6::Core
	Qt6::OpenGLWidgets
	xstudio::ui::qml::helper
	xstudio::utility
	xstudio::session
	xstudio::ui::qt::viewport_widget
)

SET(EXTRAMOC
)

create_qml_component(studio 0.1.0 "${LINK_DEPS}" "${EXTRAMOC}")
