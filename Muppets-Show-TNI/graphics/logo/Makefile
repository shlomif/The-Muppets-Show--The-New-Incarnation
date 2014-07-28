BUFFY_SVG = Muppet-Show-TNI-Logo--take1.svg
BUFFY_PNG = $(BUFFY_SVG).png

all: $(BUFFY_PNG)

$(BUFFY_PNG): $(BUFFY_SVG)
	inkscape --export-png=$@ --export-width=300 $<
	optipng -o7 $@

upload: all
	sky up $(BUFFY_PNG)
