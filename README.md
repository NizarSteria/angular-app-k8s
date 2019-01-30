# AngularAppK8s

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 7.2.3.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).
# angular-app-k8s
== Build the image

```console
docker build -t harounaouissaoui/angular-app:v1 .
```

== RUN the image
```console
docker run -d -p 8080:80 harounaouissaoui/angular-app:v1
```

== Tag and push the image
```console
docker login
docker tag harounaouissaoui/angular-app:v1 angular-app
docker push YOUR_DOCKERHUB_NAME/angular-app
```

== Start the pod

Start the pod as:

```console
kubectl create -f deployment.local.yaml
```
== Result building the image
Harouns-MacBook-Pro:angular-app-k8s harounconsulting$ docker build -t harounaouissaoui/angular-app:v1 .
Sending build context to Docker daemon    316MB
Step 1/10 : FROM node:latest as node
 ---> 8c67bfd7b95b
Step 2/10 : WORKDIR /app
 ---> Using cache
 ---> 1c04da3021bc
Step 3/10 : COPY . .
 ---> 1910770919d3
Step 4/10 : RUN npm install
 ---> Running in a3affabc9e7e
audited 40185 packages in 11.656s
found 0 vulnerabilities

Removing intermediate container a3affabc9e7e
 ---> c300573c737b
Step 5/10 : RUN node --version
 ---> Running in 599b2bbed1cf
v11.8.0
Removing intermediate container 599b2bbed1cf
 ---> d6ff5a9d3128
Step 6/10 : RUN npm --version
 ---> Running in 7f5650506c41
6.5.0
Removing intermediate container 7f5650506c41
 ---> d2989283c78e
Step 7/10 : RUN npm rebuild node-sass
 ---> Running in 9e24c80db390

> node-sass@4.10.0 install /app/node_modules/node-sass
> node scripts/install.js

Downloading binary from https://github.com/sass/node-sass/releases/download/v4.10.0/linux-x64-67_binding.node
Download complete
Binary saved to /app/node_modules/node-sass/vendor/linux-x64-67/binding.node
Caching binary to /root/.npm/node-sass/4.10.0/linux-x64-67_binding.node

> node-sass@4.10.0 postinstall /app/node_modules/node-sass
> node scripts/build.js

Binary found at /app/node_modules/node-sass/vendor/linux-x64-67/binding.node
Testing binary
Binary is fine
node-sass@4.10.0 /app/node_modules/node-sass
Removing intermediate container 9e24c80db390
 ---> 9f41d429ba98
Step 8/10 : RUN npm run build --prod
 ---> Running in 8d63e15f05b4

> angular-app-k8s@0.0.1 build /app
> ng build


Date: 2019-01-30T11:47:06.811Z
Hash: 3c729cf64444d171cfa2
Time: 7105ms
chunk {main} main.js, main.js.map (main) 10.3 kB [initial] [rendered]
chunk {polyfills} polyfills.js, polyfills.js.map (polyfills) 236 kB [initial] [rendered]
chunk {runtime} runtime.js, runtime.js.map (runtime) 6.08 kB [entry] [rendered]
chunk {styles} styles.js, styles.js.map (styles) 16.3 kB [initial] [rendered]
chunk {vendor} vendor.js, vendor.js.map (vendor) 3.43 MB [initial] [rendered]
Removing intermediate container 8d63e15f05b4
 ---> f5f27796a3c1

== Result k8s

```console 
kubectl create -f deployment.local.yaml
```

deployment.apps "angular-deployment" created
service "angular-service" created
```console 
kubectl get pods
kubectl get deployments
minikube service angular-service

```
NAME                                  READY     STATUS              RESTARTS   AGE
angular-deployment-865f65d6cf-b7cc7   0/1       ContainerCreating   0          17h
angular-deployment-865f65d6cf-hktrg   0/1       ContainerCreating   0          17h
angular-deployment-865f65d6cf-w4n9m   0/1       ContainerCreating   0          17h
angular-deployment-865f65d6cf-xwvhb   0/1       ContainerCreating   0          17h
angular-deployment-865f65d6cf-zc7wz   0/1       ContainerCreating   0          17h


== Reference : Minikube 
http://www.openkb.info/2018/10/minikube-cheat-sheet.html
