# --------------------------------------
# Step 1 - Build the project

# Use the official lightweight Node.js image.
# https://hub.docker.com/_/node
FROM node:16-slim as build

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

# Install build dependencies.
RUN npm install && npm install tslint typescript -g

# Copy local code to the container image.
COPY . .

# Build
RUN npm run-script build

# --------------------------------------
# Step 2 - Create production image
FROM node:16-slim as production

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy the output of previous stage
COPY --from=build /usr/src/app/dist ./dist

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

# Install production dependencies.
RUN npm install --only=production

# Run the web service on container startup.
CMD [ "node", "./dist/index.js" ]