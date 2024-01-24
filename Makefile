INSTALL_DIR = /usr/local/bin
SCRIPT_NAME = cpptouch.py
PROGRAM_NAME = cpptouch

install:
	@echo "Installing $(PROGRAM_NAME) to $(INSTALL_DIR)"
	@cp $(SCRIPT_NAME) $(INSTALL_DIR)/$(PROGRAM_NAME)
	@chmod +x $(INSTALL_DIR)/$(PROGRAM_NAME)
	@echo "Installation complete"

clean:
	@echo "Removing $(PROGRAM_NAME) from $(INSTALL_DIR)"
	@rm -f $(INSTALL_DIR)/$(PROGRAM_NAME)
	@echo "Cleanup complete"