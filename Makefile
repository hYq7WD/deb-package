SHORT_NAME = stack-info-1.0
SRC_DIR = stack-info-1.0-1
TOP_DIR = ~/build
BUILD_DIR = $(TOP_DIR)/$(SRC_DIR)
DEBIAN_DIR = $(BUILD_DIR)/debian

build:
	mkdir -p $(BUILD_DIR)
	cp -r $(SRC_DIR)/* $(BUILD_DIR)
	cd $(BUILD_DIR) && \
	dh_make -y --indep --createorig && \
	cp $(BUILD_DIR)/install $(BUILD_DIR)/postinst $(BUILD_DIR)/postrm $(DEBIAN_DIR) && \
	dpkg-buildpackage -us -uc

install:
	sudo dpkg -i $(TOP_DIR)/$(SHORT_NAME)_1-1_all.deb

uninstall:
	sudo dpkg -r $(SHORT_NAME)

clean:
	rm -rf $(DEBIAN_DIR)
	rm -r $(TOP_DIR)/$(SHORT_NAME)*