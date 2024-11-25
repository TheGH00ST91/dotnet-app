#!/bin/bash

echo "Starting CI/CD pipeline..."

# Step 1: Clean previous builds
echo "Cleaning previous builds..."
rm -rf ./bin ./obj ./publish

# Step 2: Build Docker image
echo "Building Docker image..."
docker build -t my-dotnet-app .

# Step 3: (Optional) Run tests in Docker (uncomment if you have tests)
# echo "Running tests..."
# docker run --rm my-dotnet-app dotnet test

# Step 4: Publish the application (already done in the Dockerfile build stage)
# This step can be omitted because the `dotnet publish` is part of your Dockerfile.

# Step 5: Deploy the application using docker-compose
echo "Deploying application..."
docker-compose up --build -d  # This will build the image and run the container

echo "CI/CD pipeline completed!"
