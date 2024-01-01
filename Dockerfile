# filename: dockerfile

# Get the latest version of Playwright
FROM mcr.microsoft.com/playwright:v1.40.1-jammy

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

RUN npx playwright install-deps

# Copy the rest of the application files
COPY . .

# Set the entry point for the container
CMD ["npx", "playwright", "test"]


# # Stage 1: Build stage with Node.js to copy the executable
# FROM node:20 AS builder

# # Set the working directory
# WORKDIR /app

# # Copy the Playwright tests and dependencies
# COPY . .

# # Install dependencies
# RUN npm install
# RUN npx playwright install-deps

# # Stage 2: Final stage with Playwright image
# FROM mcr.microsoft.com/playwright:v1.40.1-jammy

# # Set the working directory
# WORKDIR /app

# # Copy only the necessary files from the builder stage
# COPY --from=builder /app /app

# # Set the entry point for the container
# CMD ["npx", "playwright", "test"]

