# Use Node.js version 16 as the base image
FROM node:16

# Set the working directory inside the container
# All commands will run inside /usr/src/app
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first
# This allows Docker to cache installed dependencies unless these files change
COPY package*.json ./

# Install dependencies 
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port 3000 so it can be accessed from outside the container
EXPOSE 3000

# Define the command to start the application
CMD ["npm", "start"]
