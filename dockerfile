# Use official Node LTS
FROM node:20-alpine

# Install build tools for sqlite3
RUN apk add --no-cache python3 make g++ 

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install dependencies (sqlite3 will build for Alpine Linux here)
RUN npm install --build-from-source

# Copy everything else
COPY . .

# Expose the port
EXPOSE 3001

# Start the server
CMD ["node", "server/server.js"]
