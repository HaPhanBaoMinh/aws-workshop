#!/bin/bash

# Thực hiện start Docker container từ Docker image đã được pull và map cổng 80 trên máy host với cổng 300 trên container

# Tên của Docker container muốn khởi chạy
CONTAINER_NAME="ci_cd_workshop"

# Kiểm tra xem container đã tồn tại hay không
if [ "$(docker ps -a -q -f name=$CONTAINER_NAME)" ]; then
    # Nếu container tồn tại, thì stop và xóa container cũ
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Tên của Docker image muốn sử dụng để khởi chạy container
DOCKER_IMAGE="847664374589.dkr.ecr.ap-southeast-2.amazonaws.com/ci_cd_workshop:latest"

# Thực hiện start Docker container và map cổng 80 trên máy host với cổng 300 trên container
docker run -d --name $CONTAINER_NAME -p 80:3000 $DOCKER_IMAGE

# Kiểm tra xem container đã khởi chạy thành công hay không
if [ $? -eq 0 ]; then
  echo "Container đã được khởi chạy thành công với tên: $CONTAINER_NAME và port 80 trên máy host đã được map với port 300 trên container."
else
  echo "Lỗi trong quá trình khởi chạy container."
  exit 1
fi

# Kết thúc script
exit 0
