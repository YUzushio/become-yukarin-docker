IMAGE=become-yukarin
CONTAINER=be-yukarin
MEMORY=28g
HOSTDIR=${PWD}/files/
GUESTDIR=/workspace/
PORT=80
ADDR=0.0.0.0

build:
	docker build -t $(IMAGE) .
run:
	docker run \
	-it \
	--runtime=nvidia \
	--name $(CONTAINER) \
	-m $(MEMORY) \
	-v $(HOSTDIR):$(GUESTDIR) \
	-p $(PORT):$(PORT) \
	$(IMAGE) \
	/bin/bash

stop:
	docker stop $(CONTAINER)

delete:
	docker rm $(CONTAINER)

halt: stop delete

rs: stop delete run

ps:
	docker ps -a

clean:
	docker rm $(docker ps -aq)

touch:
	docker exec -it $(CONTAINER) /bin/bash
