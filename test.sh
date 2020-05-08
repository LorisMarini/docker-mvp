#! /bin/bash

SERVICE_NAME="dockermvp"

docker-compose exec $SERVICE_NAME zsh -c \
  "/opt/conda/bin/python -m pytest \
  -v \
  --disable-pytest-warnings \
  --basetemp=/code/tests/pytest-basetemp \
  --cov=/code \
  --cov-config=/code/.coveragerc \
  --cov-report html:/code/tests/pytest-coverage \
  /code"
