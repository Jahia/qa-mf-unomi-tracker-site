# unomiTrackerSite

This repository contains a Website that can be used to test the Apache Unomi web tracker.

## Start the website

You can use the following docker-compose file to start an environment containing both Apache Unomi, Elasticsearch and the Unomi Trakcer site.

```yaml
version: '2.4'

networks:
    unomi-net:
        name: unomi-net
        ipam:
            config:
                - subnet: 172.24.24.0/24

services:
    elasticsearch:
        image: docker.elastic.co/elasticsearch/elasticsearch:7.17.5
        networks:
            - unomi-net
        environment:
            - discovery.type=single-node
            - ELASTIC_PASSWORD=password1234
        ports:
            - 9200:9200
        mem_limit: 8gb
        cpus: 4
        ulimits:
            memlock:
                soft: -1
                hard: -1

    unomi:
        image: apache/unomi:1.6.0
        mem_limit: 2gb
        networks:
          unomi-net:
            ipv4_address: 172.24.24.100
        environment:
            UNOMI_ELASTICSEARCH_ADDRESSES: elasticsearch:9200            
            UNOMI_CLUSTER_INTERNAL_ADDRESS: https://jcustomer.jahia.net:9443
            JAVA_MAX_MEM: 2G
            UNOMI_ROOT_PASSWORD: karaf
            UNOMI_THIRDPARTY_PROVIDER1_KEY: 670c26d1cc413346c3b2fd9ce65dab41
            UNOMI_THIRDPARTY_PROVIDER1_IPADDRESSES: 172.24.24.0/24,::1,127.0.0.1
            KARAF_OPTS: "-Dunomi.autoStart=true"
            UNOMI_HTTP_PORT: 8181
            UNOMI_CLUSTER_PUBLIC_ADDRESS: http://jcustomer.jahia.net:8181
            UNOMI_PROFILE_COOKIE_DOMAIN: jahia.net
            UNOMI_HAZELCAST_TCPIP_MEMBERS: 172.24.24.100,172.24.24.101,172.24.24.102
            UNOMI_HAZELCAST_NETWORK_PORT: 5701
            UNOMI_ELASTICSEARCH_PASSWORD: password1234
        ports:
            - 8181:8181
            - 9443:9443
            - 5005:5005
            - 8102:8102

    trackersite:
        image:  jahia/qa-mf-unomi-tracker-site:latest
        mem_limit: 2gb
        environment:
            UNOMI_URL: http://localhost:8181
        networks:
            - unomi-net
        ports:
            - 8000:80
```

Save this file as `docker-compose.yml` and from that same folder, execute the following command:

```bash
docker-compose up

```

Wait for a few seconds for Apache Unomi to start, you can then open up your browser at `http://localhost:8000`

## Testing procedure

Once the environment is started, the tracker can be verified following this procedure:
 - To be updated
