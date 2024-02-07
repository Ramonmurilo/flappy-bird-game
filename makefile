dir     = $(shell pwd)
raiz    = $(shell dirname $(dir))
projeto = $(shell basename $(dir))
dockerfile = dockerfile


docker/clean-all:
	@echo "INFO: all contair will be deleted."
	@docker system prune -a


docker/run:
	@echo "INFO: Building and running dockerfile '$(dir)/$(dockerfile)' as $(projeto)"
	@docker build -t $(projeto) -f $(dir)/$(dockerfile) $(dir)
	@echo "ATENTION: the container have volume named '/src'"
	@docker run -p 5173:5173 -p 8080:80 -it --rm -v $(dir)/src:/src $(projeto)
