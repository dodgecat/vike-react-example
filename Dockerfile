# ビルドステージ: フロントエンド
FROM node:20-slim AS frontend-builder
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

WORKDIR /app/frontend
COPY ./frontend .
RUN pnpm install
RUN pnpm run build

# 最終ステージ
FROM nginx:1.27.0-alpine-slim
WORKDIR /app
RUN rm -rf /usr/share/nginx/html

COPY ./frontend/nginx.conf /etc/nginx/conf.d/configfile.template
COPY --from=frontend-builder /app/frontend/dist /usr/share/nginx/html

# Cloud Runは8080ポートを使用
EXPOSE 8080

COPY ./frontend/cmd.sh /app/
RUN chmod +x /app/cmd.sh

# 実行コマンド
ENTRYPOINT ["/bin/sh", "-c", "/app/cmd.sh"]