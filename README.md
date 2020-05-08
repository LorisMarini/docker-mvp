## Datascience in a container

![](/images/header.png)
(Image: [ClipartEmail](https://www.clipart.email/clipart/data-scientist-clipart-39833.html), [Kdnuggets](https://www.kdnuggets.com/2018/08/data-scientist-guide-getting-started-docker.html))

Example of how to build a custom docker image based off [miniconda3](https://hub.docker.com/r/continuumio/miniconda3) (Debian). What you'll find:

- Dockerfile definition
- Use of docker-compose to create the service `dockermvp`
- Use of volume binds
- Zsh shell with [powerlevel10k](https://github.com/romkatv/powerlevel10k) (for fun)
- Ready to install python dependencies via `pip` (from conda) or `conda install`

## Content

```
.
├── README.md
├── docker
│   ├── conda.yml
│   └── requirements.txt
├── Dockerfile.local
├── docker-compose.yml
└── init.sh
```

**docker-compose.yml**

This is where we define a single service with no dependencies and no external volumes in a simple docker-compose yaml file:

```yaml
version: "3.7"
services:
  dockermvp:
    image: dockermvp:local
    build:
      context: .
      dockerfile: Dockerfile.local
    container_name: docker-mvp
    entrypoint:
    ports:
    volumes:
```
[services](https://docs.docker.com/compose/compose-file/#service-configuration-reference)
[image](https://docs.docker.com/compose/compose-file/#image)
[context](https://docs.docker.com/compose/compose-file/#context)
[dockerfile](https://docs.docker.com/compose/compose-file/#dockerfile)
[entrypoint](https://docs.docker.com/compose/compose-file/#entrypoint)
[ports](https://docs.docker.com/compose/compose-file/#short-syntax-1)
[volumes](https://docs.docker.com/compose/compose-file/#volumes)


**init.sh**
The entry point for `docker-compose up` (This is where you would launch a web server...)

## Try it out

`Clone` and `cd` into this repository, then build the image with:

`docker-compose build`

If you want to run the container in the background and try things out, use this command:

`docker-compose up -d`

then exec into the container and launch a new shell:
`dcomp exec dockermvp zsh`

You should see something similar to this:
![](./images/zsh-screenshot.png)

Note: If you omit the `-d` flag in `docker-compose up` you'll see the stdout of what is executed in init.sh, a useful way to debug issues. From within the container we can launch ipython and try to import our modules:

```Python
from dockermvp.a.a_code import *
HelloWorld()
>> Hello World
Greetings("loris")
>> Hi loris!
```

We can also run our tests from outside the container (ctrl+d to kill it):

`./test.sh`

![](/images/test-example.png)

And open the coverage report in the browser

`open ./tests/pytest-coverage/index.html`

![](/images/coverage-report.png)

## More Reads
- [Mark Takacs Docker Compose Tutorial](https://takacsmark.com/docker-compose-tutorial-beginners-by-example-basics/)
- [Login order in zsh and bash](https://medium.com/@rajsek/zsh-bash-startup-files-loading-order-bashrc-zshrc-etc-e30045652f2e)
- [Docker-compose up vs run vs exec](https://medium.com/@zhao.li/how-to-understand-the-difference-between-docker-composes-up-vs-run-vs-exec-commands-a506151967df)
