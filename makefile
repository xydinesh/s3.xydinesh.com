xyid := $(shell docker-compose ps -q xydinesh)
all: build
build:
	docker build -t xydinesh/website .	
run:
	docker-compose up -d --force-recreate
deploy:
	docker exec -ti $(xyid) s3_website push
clean:
	$(SAMCLEAN)

