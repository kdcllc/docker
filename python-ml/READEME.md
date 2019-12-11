# Machine Learning with Python


## Build Images

```bash

    docker-compose -f "docker-compose.yml" up -d --build python.builder.base
    docker-compose -f "docker-compose.yml" up -d --build python.builder.vscode

    docker build --rm -f "python-ml\ubuntu\Dockerfile.CondaBase" -t kdcllc/python:conda-base python-ml
```

Running Docker Image

```bash
    docker run --rm -it -p 8888:8888  kdcllc/python-conda:latest
```

Running Jupypter notebook

```bash
    jupyter notebook --ip 0.0.0 --allow-root --no-browser
```

## References

- https://github.com/horizoncrafts/dwchallenge-docker/blob/9cbae49c271cf344f54ec4440308064594d1337f/Dockerfile
- https://devblogs.microsoft.com/python/remote-python-development-in-visual-studio-code/
- https://github.com/siaarzh/python-vscode-starter/blob/master/.devcontainer/Dockerfile
