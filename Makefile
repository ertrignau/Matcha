CLIENT_DIR = client
SERVER_DIR = server

.PHONY: install dev client server clean re

install:
	npm --prefix $(CLIENT_DIR) install
	npm --prefix $(SERVER_DIR) install

dev:
	@trap 'kill 0' INT TERM EXIT; \
	npm --prefix $(SERVER_DIR) run dev & \
	npm --prefix $(CLIENT_DIR) run dev & \
	wait

client:
	npm --prefix $(CLIENT_DIR) run dev

server:
	npm --prefix $(SERVER_DIR) run dev

clean:
	rm -rf $(CLIENT_DIR)/node_modules
	rm -rf $(SERVER_DIR)/node_modules
	rm -rf $(CLIENT_DIR)/dist

re: clean install