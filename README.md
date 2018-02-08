# Nginx Reverse Proxy Rockons

Rockons are container definitions that run on the Rockstor network attached storage (NAS) appliance. These Rockons improve on the official set of Rockons by utilizing Docker DNS. The hostnames of other containers will resolve from containers attached to the custom network with Docker DNS. Application configurations become more user friendly and resilient than when using IPs in their configurations. The hostname will still resolve to the correct IP and communication with services will continue even if the IP of the container changes for the service, e.g. connections to a database. Thus, the automatic IP assignment of running containers will not break existing configurations for applications utilizing a standardized hostname to communicate with service containers in the environment if later renewed and a new IP assigned.

The suite includes Rockons to setup the jwilder Nginx reverse proxy containers. A virtual host configuration is added or updated in the running configurations of the jwilder Nginx reverse proxy based on environmental variables the user is prompted to complete when initializing the other Rockons for each Web application. Web requests received by the proxy are then passed to an IP as resolved by Docker DNS and port for the application as defined by the user defined environment.

A gateway supporting NAT and directing Web traffic to the IP of the Rockstor NAS appliance and the proxy port exposed is necessary to access the Web applications managed by the proxy. The use of a proxy avoid opening multiple ports to each of the applications. A single port is opened on the Rockstor appliance for each Web protocol, i.e. HTTP and HTTPS. The gateway only needs a single NAT configuration for each of these protocols instead of a NAT configurations for each Web application. Hostnames in the requests are used by the proxy to direct the request to the corresponding application. 

# Steps to Hosting Web Applications from Rockstor with the Nginx Reverse Proxy Rockons Suite

First you'll need to download the corresponding JSONs from this repository to the /opt/rockstor/rockons-metastore/ directory of the Rockstor appliance. These Rockons will also not be shown listed in the Rockstor Web GUI until you click the update button from the Rockons page. 

A custom Docker network on the Rockstor appliance will need to be created before you can start any of these Rockons. This network can be created with the create_rockon_br0.sh command via the Linux terminal. These Rockons all attach to a specific custom Docker network name defined in the JSON definitions. The proxy may not be able resolve the hostnames via Docker DNS or communicate with the containers if they are not on the same custom Docker network.

Install the letsencrypt-nginx-proxy, nginx-reverse-proxy, and nginx-reverse-proxy-default-site Rockons to start the jwilder Nginx reverse proxy containers. The proxy containers need to be running before starting any other Rockons in the suite.

A DNS entry that resolves to the IP of the gateway should ease user access to these Web applications. A dynamic DNS service should reduce downtime if the IP of the gateway changes. Dynamic DNS services work by detecting the IP change and updating the corresponding DNS records. There is an included ddclient Rockon to configure dynamic DNS for managing these domain records. Local DNS or host files can also be setup for a local network or lab environment. 

Click the name of the Rockon in the Rockstor GUI to follow the link to the application Web page to get more details about what the Rockon installs.

Visit the official http://rockstor.com/ website for more information about its features and documentation.

So, start installing some Rockons, host applications on your own network, own your data, and free yourself from the private cloud.