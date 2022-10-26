# Article Lister

## Overview

The Article Lister app fetches data from a JSON file and displays
it for the user.

It's a Rails 7 app, using a Postgres database.

## Running the app

Prerequisites: docker

Use the following to run the application locally:

    docker build --tag article-lister .
    docker run -p 3000:3000 article-lister

To mount the application files into the container dynamically, so you can
make changes and see them reflected without restarting, use the following:

    docker run -v $(pwd):/article-lister -p 3000:3000 article-lister

However, if you make changes to the Dockerfile or the Gemfile, you will
need to rebuild the image in order for them to take effect:

    docker build --tag article-lister .

To run commands from a temporary container, add them to the end of the
`docker run` command; for example:

    docker run --rm -v $(pwd):/article-lister article-lister rake test

Or to enter a temporary interactive container to run commands:

    docker run -it --rm -v $(pwd):/article-lister article-lister bash
    root@4887bc460446:/article-lister# rake test
