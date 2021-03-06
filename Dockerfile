#### 使用 Node 的版本(作為編譯)
FROM library/node:11-stretch AS builder
# Node 在容器內的位置
WORKDIR /home/node
# 編譯與安裝環境
COPY . / /home/node/
RUN ls && \
    npm install -D vuepress && \
    npm run build
# 正式伺服器
FROM bitnami/apache
COPY --from=builder /home/node/dist/ /app/
