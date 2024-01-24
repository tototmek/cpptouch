INSTALL_DIR = /usr/local/bin
SCRIPT_NAME = cpptouch

install:
	@echo "Installing $(SCRIPT_NAME) to $(INSTALL_DIR)"
	@cp $(SCRIPT_NAME) $(INSTALL_DIR)
	@chmod +x $(INSTALL_DIR)/$(SCRIPT_NAME)
	@echo "Installation complete"

clean:
	@echo "Removing $(SCRIPT_NAME) from $(INSTALL_DIR)"
	@rm -f $(INSTALL_DIR)/$(SCRIPT_NAME)
	@echo "Cleanup complete"