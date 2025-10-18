# --- Stage 1: Build the TypeScript app ---
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json pnpm-lock.yaml* ./
RUN npm install -g pnpm && pnpm install

COPY . .
RUN pnpm run build


# --- Stage 2: Run the compiled app ---
FROM node:20-alpine

WORKDIR /app

COPY package*.json pnpm-lock.yaml* ./
COPY --from=builder /app/dist ./dist

RUN npm install -g pnpm && pnpm install --prod

EXPOSE 3000
CMD ["node", "dist/index.js"]
