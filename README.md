# Enforcing Fairness in AI with HAMLET: A Human-Centered Approach via AutoML and Argumentation

This is the repository for reproducing the experiments performed in **Enforcing Fairness in AI with HAMLET: A Human-Centered Approach via AutoML and Argumentation**.

If you are interest in discovering HAMLET as an end-to-end AutoML framework, please refer to the [GitHub repository](https://github.com/aaai-25/HAMLET) 

# Requirements

In order to reproduce the experiments in any operating systems, Docker is required: [https://www.docker.com/](https://www.docker.com/).
Install it, and be sure that it is running when trying to reproduce the experiments.

To test if Docker is installed correctly:

- open the terminal;
- run ```docker run hello-world```.

***Expected output:***

```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
2db29710123e: Pull complete 
Digest: sha256:7d246653d0511db2a6b2e0436cfd0e52ac8c066000264b3ce63331ac66dca625
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

# Reproducing the experiments

The instructions are valid for Unix-like systems (e.g., Linux Ubuntu, MacOS).

## Create a persistent volume with Docker

Open the terminal and create a volume:

```
docker volume create my-HAMLET-volume
```
## Run the published image

Run the docker image to perform HAMLET on Adult and COMPAS:

```
docker run -it --volume /var/run/docker.sock:/var/run/docker.sock --volume my-HAMLET-volume:/test ghcr.io/aaai-25/HAMLET-fairness:1.0.0 [metric] [sensitive_attribute] my-HAMLET-volume
```
Specifically, you can choose the fair metric to optimize and the sensitive attribute to consider:
- **[metric]**: you can choose among *demographic_parity_ratio* and *equalized_odds_ratio*;
- **[sensitive_attribute]**: you can type either *0* (selecting the *gender* attribute) or *1* (selecting the *race* attribute)


## Check the results

Finally, after the execution, you can find your results in the created volume.



