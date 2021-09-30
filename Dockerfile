##### Stage 1

FROM node:14.17 as builder

WORKDIR /app

# Copy project files to the docker image
COPY . .

# install angular/cli globally (latest version, change this to the version you are using)
RUN yarn global add @angular/cli@latest

# if you prefer npm, replace the above command with
# RUN npm install @angular/cli@latest -g

# install packages
RUN yarn install

# FOR NPM
# npm install

# SET ENVIRONMENT VARIABLES
ENV ENVIRONMENT=production1
ENV SomeAPIKey="This is not an API Key"
ENV SomeOtherAPIKey="This is not another API Key"

#ARG ENVIRONMENT
#ENV ENVIRONMENT=$ENVIRONMENT
#
#ARG SomeAPIKey
#ENV SomeAPIKey=$SomeAPIKey
#
#ARG SomeOtherAPIKey
#ENV SomeOtherAPIKey=$SomeOtherAPIKey

#RUN echo "Environment: ${ENVIRONMENT}  SomeAPIKey: ${SomeAPIKey}  SomeOtherAPIKey: ${SomeOtherAPIKey}"

# Build Angular Application in Production
RUN ng build --prod

#### STAGE 2
#### Deploying the application

FROM nginx

VOLUME  /var/cache/nginx

# Copy the build files from the project
# replace "angular-docker-environment-variables" with your angular project name
COPY --from=builder /app/dist/angular-docker-environment-variables /usr/share/nginx/html

# Copy Nginx Files
COPY --from=builder /app/.docker/.config/nginx.conf /etc/nginx/conf.d/default.conf

# EXPOSE Port 80
EXPOSE 80
