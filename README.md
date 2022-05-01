# hello-world-api
A simple node-express api server for testing.

## what is it? 
This is a very basic JavaScript-Node-Express server that acts as the "hello world" of API-Server. 
* The server listens to port 3000 
* The server has just one endpoint "GET localhost:3000/"
* The server returns a simple JSON with payload 

~~~
{
        msg: "Hellow World!"
}
~~~

Nice and simple. 

The server also includes a Dockerfile and is packaged as a container.

# run in micro8ks
~~~
microk8s kubectl run helo-world-api --image=ghcr.io/simplycoders/helo-world-api                 # run a pod with image
microk8s kubectl get pods                                                                       # list of all pods
~~~