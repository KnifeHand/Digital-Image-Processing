# Copyright 2014-2017 The MathWorks, Inc.
COMPONENT := equationrenderer
include $(MAKE_INCLUDE_DIR)/build_component.mk

UI_NAME := $(COMPONENT)
PROFILE_FILE := $(UI_NAME).profile.js

GENERATED_CSS = $(SANDBOX_ROOT)/ui/equationrenderer/css-equationrenderer/generatedCss.css

GENERATE_JS_SUPPORTING_FILES = 1
include $(JAVASCRIPT_BUILD_HARNESS)/makefiles/build_javascript.mk

define POST_DOJO_BUILD
	$(call UPDATE_IF_DIFF,$(DERIVED_DIR)/$(UI_NAME)/MathRenderer.js,$(RELEASE_DIR))
	$(call UPDATE_IF_DIFF,$(DERIVED_DIR)/css-$(UI_NAME)/main.css,$(RELEASE_DIR)/css)
endef
