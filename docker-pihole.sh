#!/bin/bash
# Note: ServerIP should be replaced with your external ip.
# Note: port:port is your private open port for virtual assistant integration

docker run -d \
    --name pihole \
    -p 53:53/tcp -p 53:53/udp \  #DNS Port
    -p 80:80 \  #Pi-hole web interface
    -p 443:443 \  #pi-hole web interface
    -p port:port \  #Port for calling web request. see "deepspacelab" folder for documentation
    -e TZ="Country/City" \ #Time zone of IP server address
    -v "$(pwd)/etc-pihole/:/etc/pihole/" \
    -v "$(pwd)/etc-dnsmasq.d/:/etc/dnsmasq.d/" \
    --dns=127.0.0.1 --dns=1.1.1.1 \ #local server resolver
    --restart=unless-stopped \
    --hostname pi.hole \ #can be changed to any name
    -e VIRTUAL_HOST="pi.hole" \
    -e PROXY_LOCATION="pi.hole" \
    -e ServerIP="ip_address" \ #Server IP
    pihole/pihole:latest #Docker Image of pi-hole

printf 'Starting up pihole container '
for i in $(seq 1 20); do
    if [ "$(docker inspect -f "{{.State.Health.Status}}" pihole)" == "healthy" ] ; then
        printf ' OK'
        echo -e "\n$(docker logs pihole 2> /dev/null | grep 'password:') for your pi-hole: https://${IP}/admin/"
        exit 0
    else
        sleep 3
        printf '.'
    fi

    if [ $i -eq 20 ] ; then
        echo -e "\nTimed out waiting for Pi-hole start, consult check your container logs for more info (\`docker logs pihole\`)"
        exit 1
    fi
done;