# Step 1: Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /src

# Copy the csproj file and restore any dependencies (via dotnet restore)
COPY *.csproj .
RUN dotnet restore

# Copy the rest of the application files
COPY . .

# Publish the application to the /app/publish directory
RUN dotnet publish -c Release -o /app/publish

# Step 2: Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base

WORKDIR /app

# Copy the published application from the build stage
COPY --from=build /app/publish .

# Set the entry point for the container (the application DLL to run)
ENTRYPOINT ["dotnet", "DotNetApp.dll"]

