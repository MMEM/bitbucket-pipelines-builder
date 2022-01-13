## bitbucket-pipelines-builder

Creating a new build with tag '1' without multi-arch support:

    $ docker build -t bitbucket-pipelines-builder:1 -f ./Dockerfile .
    $ docker tag bitbucket-pipelines-builder:1 metalmanufactures/bitbucket-pipelines-builder:1
    $ docker login 
    $ docker push metalmanufactures/bitbucket-pipelines-builder:1

Creating a new build with tag '1' **with** multi-arch support:

    $ docker buildx build --platform linux/arm64,linux/amd64 --push -t metalmanufactures/bitbucket-pipelines-builder:1 -f ./Dockerfile .

Note: at present serverless wont run in arm, so just run it like so:

    $ docker buildx build --platform linux/amd64 --push -t metalmanufactures/bitbucket-pipelines-builder:1 -f ./Dockerfile .

If you see the error "multiple platforms feature is currently not supported for docker drive" above, run the following `$ docker buildx create --use` and then run `docker buildx ls` to make sure `linux/arm64,linux/amd64` is listed.
