## Using OS Environment Variables in Angular (with Docker)

This is demo, to show you how you can pass configuration through OS Environment Variables to your angular application during build.

To run this demo,

1. First, clone this repo:
   `git clone https://github.com/coding-latte/using-angular-docker-environment-variables.git`

2. And then, build the docker image:
   `docker build --rm -f "Dockerfile" -t angular-docker-environment-variables:latest .`

3. And finally run the image you just built:
   `docker run -d --name angular-docker -p 8085:80 -e SomeAPIKey="ble" angular-docker-environment-variables:latest`

You can learn more about this [here](https://codinglatte.com/posts/angular/using-os-environment-variables-in-angular-with-docker/)
