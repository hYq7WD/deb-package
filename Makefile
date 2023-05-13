SRC_DIR = stack-info-1.0-1
BUILD_DIR = ~/build/$(SRC_DIR)
DEBIAN_DIR = $(BUILD_DIR)/debian

build:
	mkdir -p $(BUILD_DIR)
	cp -r $(SRC_DIR)/* $(BUILD_DIR)
	cd $(BUILD_DIR) && \
	dh_make -y --indep --createorig && \
	cp $(BUILD_DIR)/install $(BUILD_DIR)/postinst $(BUILD_DIR)/postrm $(DEBIAN_DIR) && \
	dpkg-buildpackage -us -uc

install:
	sudo dpkg -i $(DEBIAN_DIR)/../$(SRC_DIR)_1.0-1_all.deb

clean:
	rm -rf $(DEBIAN_DIR)
	rm -r $(BUILD_DIR)/../stack-info-1.0*