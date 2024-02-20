# Sử dụng image cơ sở có chứa Node.js
FROM node:16

# Thiết lập thư mục làm việc trong container
WORKDIR /usr/src/app

# Sao chép package.json và package-lock.json vào thư mục làm việc
COPY package*.json ./

# Cài đặt dependencies
RUN npm install

# Sao chép mã nguồn ứng dụng vào thư mục làm việc
COPY . .

# Mở cổng mặc định mà ứng dụng của bạn lắng nghe
EXPOSE 3000

# Khởi chạy ứng dụng của bạn
CMD ["npm", "start"]
