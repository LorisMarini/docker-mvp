#! /bin/bash

echo "Done - Congratulations!"

# Add additonal pip installs here to avoid rebuilding the image for quick tests
pip install -r /code/dependencies/requirements.txt

# Symbolically install your python app to make iterations easier
cd /code && /opt/conda/bin/pip install -e .

# Keep the container running
tail -f /dev/null
