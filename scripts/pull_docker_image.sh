#!/bin/bash

# Thực hiện login vào Docker registry


# Thực hiện pull Docker image từ một registry cụ thể
aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 847664374589.dkr.ecr.ap-southeast-2.amazonaws.com/ci_cd_workshop

# Đường dẫn của Docker image cần pull
DOCKER_IMAGE="847664374589.dkr.ecr.ap-southeast-2.amazonaws.com/ci_cd_workshop:latest"

# Thực hiện pull Docker image
docker pull $DOCKER_IMAGE

# Kiểm tra xem quá trình pull có thành công không
if [ $? -eq 0 ]; then
  echo "Pull Docker image thành công: $DOCKER_IMAGE"
else
  echo "Lỗi trong quá trình pull Docker image: $DOCKER_IMAGE"
  exit 1
fi

# Kết thúc script
exit 0
