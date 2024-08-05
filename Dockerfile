# Node Base Image
FROM node:12.2.0-alpine

#Working Directry
WORKDIR /node

#Copy the Code
COPY . .

#Install the dependecies
RUN npm install
RUN npm run test

#Expose the port 8000
EXPOSE 8000

#Run the code
CMD ["node","app.js"]
