# Setup for Zepkit Demo Docker Image by Ivan Martinez

## Following the demo

https://zepkit.zeppelinos.org/

### 1. Build the Docker image (This may take a few minutes).

`./build`

### 2. Run the Docker image (This may take a few minutes).

`docker run -d --rm --name=zepkit -it zepkit`

### 3. Once that completes and you see a terminal, exit the process.

`ctrl + c`

### 4. Copy the contracts segment of the docker so you can edit it locally.

`mkdir zeppelin`

`docker cp zepkit:/zeppelin/contracts $PWD/zeppelin`

### 5. Kill the terminal after copying from it

`docker kill zepkit`

### 6. Restart it again but this time mount it locally

`./run`

### 7. Start ganache to use it as a test network

`docker exec -i zepkit ganache-cli --secure -u 0 -u 1 -u 2 --deterministic -h 0.0.0.0`

### Note: You can use the command below to check your currently running Docker images

`docker ps`

### 8. Start the web server in it's own container as well (give it a few seconds to actually start)

`docker exec -d zepkit /bin/sh -c 'cd client/ && npm run start'`

## Following the guide on http://localhost:3000/counter

<!-- ### Open another terminal window and make a second bash terminal to the container

`./openTerm` -->

### 1. Go to http://localhost:3000/counter and follow those instructions. (skip the ganache-cli step) _but for all zos commands, use ./dzos instead._

For example:
`zos init zepkit`

Becomes:
`./dzos init zepkit`

This _forwards_ your command to the docker container using `docker exec`

### 2. For the session command follow these instructions.

You can view the ganache container logs with `docker logs zepkit_ganache`

And then set the `from` address as the top address from the ganache logs

`./dzos session --network development --from ADDRESS_FROM_GANACHE --expires 3600`

### 3. For the segment of editing your contract edit your local files you cloned earlier

<!-- # Making changes to your ZepKit docker container

### Copy the files of the docker container into your workspace

`./getFiles`

### After changing what you need, copy the files back to your container
`./pushFiles`-->

# Using the Dockerfile for your own personal Zepkit project

### 1. If you haven't, build the Docker image (This may take a few minutes).

`./build`

### 2. Run the Docker image (This may take a few minutes).

`docker run -d --rm --name=zepkit -it zepkit`

### 3. Once that completes and you see a terminal, exit the process.

`ctrl + c`

### 4. Copy the entire project from the docker so you can edit it locally.

`mkdir zeppelin`

`docker cp zepkit:/zeppelin/ $PWD/`

### 5. Kill the terminal after copying from it

`docker kill zepkit`

### 6. Restart it again but this time mount everything locally

`docker run -p 8545:8545 -p 3000:3000 -d -v $PWD/zeppelin/:/zeppelin/ --name=zepkit -it zepkit`

### 7. Clean the project so you can start fresh

`docker exec zepkit npm run start-blank`

### 8. Start the web server in it's own container as well (give it a few seconds to actually start)

`docker exec -d zepkit /bin/sh -c 'cd client/ && npm run start'`

### 9. Start ganache to to use as a test network

`docker exec -i zepkit ganache-cli --secure -u 0 -u 1 -u 2 --deterministic -h 0.0.0.0`

## If anything goes wrong during setup or you want to start clean

### Kills all running docker containers

`./clean`

### If for any reason you need to manually get into the docker terminal

`./openTerm`
