#! /bin/bash

echo "Done - Congratulations!"

pip install -r /code/dependencies/requirements.txt

# Keep the container running
tail -f /dev/null
