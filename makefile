# ~~ Function to normalise the process of making an icon
# ~ At the moment, there is no way to export to a given path or directory
# ~ Each line is also run in its own shell, so no variables here!
# ~ DEBUG: remove  '> /dev/null 2>&1' from the end of the folderify call
define makeIcon
	@ echo "~ Generating icons for: $(1) ~ $(2) ($(if $(3),$(3),light))..."

	@ mkdir -p "./icons/$(1) - $(2)/$(if $(3),$(3),light)"

	@ folderify ./mask.png --macOS $(1) --color-scheme $(if $(3),$(3),light) > /dev/null 2>&1

	@ mv "./mask.iconset" "./icons/$(1) - $(2)/$(if $(3),$(3),light)/icon.iconset"
	@ mv "./mask.icns" "./icons/$(1) - $(2)/$(if $(3),$(3),light)/icon.icns"

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

# ~~ Clean the generated icon files
.PHONY: clean
clean:
	@ echo "~ Cleaning existing icons..."

	@ if [ -d ./icons ]; then rm -r ./icons; fi

	@ echo "~ Icons cleaned!"
	@ echo ""

# ~~ Generate the icons
.PHONY: generate
generate:
	@ echo "~ Creating new icons..."
	@ echo ""

	@ # Mac OS X 10.5 - Leopard
	$(call makeIcon,10.5,Leopard)

	@ # Mac OS X 10.6 - Snow Leopard
	$(call makeIcon,10.6,Snow Leopard)

	@ # Mac OS X 10.7 - Lion
	$(call makeIcon,10.7,Lion)

	@ # OS X 10.8 - Mountain Lion
	$(call makeIcon,10.8,Mountain Lion)

	@ # OS X 10.9 - Mavericks
	$(call makeIcon,10.9,Mavericks)

	@ # OS X 10.10 - Yosemite
	$(call makeIcon,10.10,Yosemite)

	@ # OS X 10.11 - El Capitan
	$(call makeIcon,10.11,El Capitan)

	@ # macOS 10.12 - Sierra
	$(call makeIcon,10.12,Sierra)

	@ # macOS 10.13 - High Sierra
	$(call makeIcon,10.13,High Sierra)

	@ # macOS 10.14 - Mojave
	$(call makeIcon,10.14,Mojave)

	@ # macOS 10.15 - Catalina
	$(call makeIcon,10.15,Catalina)

	@ # macOS 11 - Big Sur
	$(call makeIcon,11.0,Big Sur)
	$(call makeIcon,11.0,Big Sur,dark)

	@ # macOS 12 - Monterey
	$(call makeIcon,12.0,Monterey)
	$(call makeIcon,12.0,Monterey,dark)

	@ # macOS 13 - Ventura
	$(call makeIcon,13.0,Ventura)
	$(call makeIcon,13.0,Ventura,dark)

	@ echo "~ New icons created!"
	@ echo ""

# Manually grabs the latest icon and uses it as the preview image
.PHONY: preview
preview:
	@ echo "~ Creating preview image..."

	$(call icnsToPng,"./icons/10.5 - Leopard/light/icon.icns","./art/preview_old.png")
	$(call icnsToPng,"./icons/13.0 - Ventura/light/icon.icns","./art/preview_new.png")

	@ echo "~ Preview image created!"
	@ echo ""

# ~~ Build the icons
.PHONY: icons
icons: clean generate preview
