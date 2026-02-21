# Devcontainer Setup - Breast Cancer Classifier

## Language and Runtime

- **Python 3.11** with updated pip
- GPU Support (CUDA) for TensorFlow

## VS Code Extensions

### Python & Data Science

- Python (Microsoft)
- Pylance (Language Server)
- Python Debugger
- Jupyter (suite completa)
- Data Wrangler

### Formatting & Linting

- Black Formatter
- Flake8
- isort

### Git & Colaboration

- GitHub Pull Requests
- GitLens

### Utils

- IntelliCode
- Path Intellisense
- Material Icon Theme

### Exposed Ports

- **8888**: Jupyter Notebook/Lab
- **6006**: TensorBoard

## Custom Configs

### GPU Support

If you don´t want to use a GPU or you don´t have, you´ll have to edit `devcontainer.json`:

Edit `devcontainer.json` and erase/comment:

```json
"runArgs": [
    "--gpus=all",  // <-- This line
    "--shm-size=2g"
]
```

## TensorBoard

For training view:

```bash
tensorboard --logdir=./logs --port=6006
```

Navigate on browser: `http://localhost:6006`

## Recources

- [Dev Containers Documentation](https://code.visualstudio.com/docs/devcontainers/containers)
- [Docker Documentation](https://docs.docker.com/)
- [TensorFlow with Docker](https://www.tensorflow.org/install/docker)
