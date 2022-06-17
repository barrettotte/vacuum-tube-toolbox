# only used to build example files

OPENSCAD := openscad
SRC_DIR := examples
OUT_DIR := $(SRC_DIR)

SOURCES := $(wildcard $(SRC_DIR)/*.scad)
OBJECTS := $(patsubst $(SRC_DIR)/%.scad, $(OUT_DIR)/%.stl, $(SOURCES))

.PHONY:	.FORCE
.FORCE:

all:	clean build

clean:
	@rm -rf $(OUT_DIR)/*.stl

build:	$(OBJECTS)

%.stl: %.scad
	$(OPENSCAD) -o $@ $<
