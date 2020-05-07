## Playing with Docker

I build a custom docker image based off miniconda3 (debian). What you'll find:
- Dockerfile definition
- Use of docker-compose to create the service `dockermvp`
- Use of volume binds
- Customization of zsh with powerlevel10k (for fun)
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
└── init.sh  # The entry point for `docker-compose up` (This is where you would launch a web server...)
```

## Try it out

Clone and cd into this repository. To build the image locally:

`docker-compose build`

To run service in the background:
`docker-compose up -d`

To launch a zsh shell in the newly created service:

`dcomp exec dockermvp zsh`

This is what you should see:

![](README-771af.png)
