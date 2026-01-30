# Use official Node 20 Alpine image
FROM node:20-alpine

# Install build tools required by sqlite3
RUN apk add --no-cache python3 make g++ bash

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install dependencies and build native modules
RUN npm install --build-from-source

# Copy the rest of the app
COPY . .

# Expose the port your server listens on
EXPOSE 3001

# Start the server
CMD ["node", "server/server.js"]
