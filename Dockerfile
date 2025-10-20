# Use official Node LTS (lightweight)
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy package files first for caching
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy app sources
COPY . .

# Expose port (for documentation; runtime uses env or default)
EXPOSE 3000

# Start command
CMD ["npm", "start"]
