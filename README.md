# hy-dev
Docker development image for HyLang

## How to use
Change the USER variable in the Makefile to your docker username.
`make build` will build a docker container for HyLang based upon the official Alpine Python image.
`make run` will put you inside the Alpine Linux shell with your src/ directory volume mounted into the image. Right now it will run a simple 'hello world' script.
