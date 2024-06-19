# Alternative GNU Make workspace makefile autogenerated by Premake

ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifeq ($(config),debug)
  GLFW_config = debug
  Glad_config = debug
  ImGui_config = debug
  Psyche_config = debug
  Sandbox_config = debug

else ifeq ($(config),release)
  GLFW_config = release
  Glad_config = release
  ImGui_config = release
  Psyche_config = release
  Sandbox_config = release

else ifeq ($(config),dist)
  GLFW_config = dist
  Glad_config = dist
  ImGui_config = dist
  Psyche_config = dist
  Sandbox_config = dist

else
  $(error "invalid configuration $(config)")
endif

PROJECTS := GLFW Glad ImGui Psyche Sandbox

.PHONY: all clean help $(PROJECTS) 

all: $(PROJECTS)

GLFW:
ifneq (,$(GLFW_config))
	@echo "==== Building GLFW ($(GLFW_config)) ===="
	@${MAKE} --no-print-directory -C Psyche/vendor/GLFW -f Makefile config=$(GLFW_config)
endif

Glad:
ifneq (,$(Glad_config))
	@echo "==== Building Glad ($(Glad_config)) ===="
	@${MAKE} --no-print-directory -C Psyche/vendor/Glad -f Makefile config=$(Glad_config)
endif

ImGui:
ifneq (,$(ImGui_config))
	@echo "==== Building ImGui ($(ImGui_config)) ===="
	@${MAKE} --no-print-directory -C Psyche/vendor/imgui -f Makefile config=$(ImGui_config)
endif

Psyche: GLFW Glad ImGui
ifneq (,$(Psyche_config))
	@echo "==== Building Psyche ($(Psyche_config)) ===="
	@${MAKE} --no-print-directory -C Psyche -f Makefile config=$(Psyche_config)
endif

Sandbox: Psyche GLFW Glad
ifneq (,$(Sandbox_config))
	@echo "==== Building Sandbox ($(Sandbox_config)) ===="
	@${MAKE} --no-print-directory -C Sandbox -f Makefile config=$(Sandbox_config)
endif

clean:
	@${MAKE} --no-print-directory -C Psyche/vendor/GLFW -f Makefile clean
	@${MAKE} --no-print-directory -C Psyche/vendor/Glad -f Makefile clean
	@${MAKE} --no-print-directory -C Psyche/vendor/imgui -f Makefile clean
	@${MAKE} --no-print-directory -C Psyche -f Makefile clean
	@${MAKE} --no-print-directory -C Sandbox -f Makefile clean

help:
	@echo "Usage: make [config=name] [target]"
	@echo ""
	@echo "CONFIGURATIONS:"
	@echo "  debug"
	@echo "  release"
	@echo "  dist"
	@echo ""
	@echo "TARGETS:"
	@echo "   all (default)"
	@echo "   clean"
	@echo "   GLFW"
	@echo "   Glad"
	@echo "   ImGui"
	@echo "   Psyche"
	@echo "   Sandbox"
	@echo ""
	@echo "For more information, see https://github.com/premake/premake-core/wiki"