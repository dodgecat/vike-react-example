# ビルドステージ: フロントエンド
FROM node:20-slim AS frontend-builder
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

WORKDIR /app/frontend
COPY ./frontend .
RUN pnpm install
RUN pnpm run build
ENV NODE_ENV="production"
ENV APP_PORT="8080"
RUN pnpm i -g ts-node

CMD ["pnpx", "tsx", "server/server.ts"]