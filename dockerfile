# Use official Node LTS
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json first to cache installs
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy everything else
COPY . .

# Expose the port
EXPOSE 3001

# Start the app
CMD ["node", "server/server.js"]
