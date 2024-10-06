# ~~ Function to normalise the process of making an icon
# ~ At the moment, there is no way to export to a given path or directory
# ~ Each line is also run in its own shell, so no variables here!
# ~ DEBUG: remove  '> /dev/null 2>&1' from the end of the folderify call
define makeIcon
	@ mkdir -p "./icons/macOS/$(1) - $(2)/$(3)"

	@ folderify ./mask.png --macOS $(1) --color-scheme $(3) > /dev/null 2>&1

	@ mv "./mask.iconset" "./icons/macOS/$(1) - $(2)/$(3)/icon.iconset"
	@ mv "./mask.icns" "./icons/macOS/$(1) - $(2)/$(3)/icon.icns"
endef

define makeIcons
	@ echo "~ Generating icons for: $(1) ~ $(2)..."

	$(call makeIcon,$(1),$(2),light)
	$(call makeIcon,$(1),$(2),dark)

	@ echo "~ Icons generated."
	@ echo ""
endef

# ~~ Convert an ICNS file to PNG, mainly for the preview in the README
# ~ sips should be a native macOS binary
# ~ DEBUG: remove  '> /dev/null 2>&1' from the end of the sips call
define icnsToPng
	@ sips -s format png $(1) --out $(2) > /dev/null 2>&1
endef

# ~~ Install the required dependencies
.PHONY: install
install:
	@ echo "~ Installing required dependencies..."

	@ brew install folderify

	@ echo "~ Required dependencies installed!"
	@ echo ""

# ~~ Clean the generated macOS icon files
.PHONY: clean
clean:
	@ echo "~ Cleaning existing icons..."

	@ if [ -d ./icons/macOS ]; then rm -r ./icons/macOS; fi

	@ echo "~ Icons cleaned!"
	@ echo ""

# ~~ Generate the macOS icons
.PHONY: generate
generate:
	@ echo "~ Creating new icons..."
	@ echo ""

	$(call makeIcons,11.0,Big Sur)
	$(call makeIcons,12.0,Monterey)
	$(call makeIcons,13.0,Ventura)
	$(call makeIcons,14.0,Sonoma)
	$(call makeIcons,15.0,Sequoia)

	@ echo "~ New icons created!"
	@ echo ""

# Manually grabs the latest icon and uses it as the preview image
.PHONY: preview
preview:
	@ echo "~ Creating preview image..."

	$(call icnsToPng,"./icons/OSX/10.5 - Leopard/light/icon.icns","./art/preview_old.png")
	$(call icnsToPng,"./icons/macOS/15.0 - Sequoia/light/icon.icns","./art/preview_new.png")

	@ echo "~ Preview image created!"
	@ echo ""

# ~~ Build the icons
.PHONY: icons
icons: clean generate preview
