IMAGE_NAME="ricardomiguel/ws-db"
CONTAINER_NAME="database"

b:
	@echo "Building ${CONTAINER_NAME}..."
	@echo ""
	docker build -t ${IMAGE_NAME} --build-arg POSTGRES_PASS="workshop#123" .
	@echo ""

r:
	@echo "Running ${CONTAINER_NAME}..."
	@echo ""
	docker run --name ${CONTAINER_NAME} -p 5432:5432 -d --network ws ${IMAGE_NAME}
	@echo ""

f: b r

s:
	@echo "Stopping ${CONTAINER_NAME}..."
	@echo ""
	docker stop ${CONTAINER_NAME}
	@echo ""

rm:
	@echo "Removing ${CONTAINER_NAME}..."
	@echo ""
	docker rm ${CONTAINER_NAME}
	@echo ""

c: s rm