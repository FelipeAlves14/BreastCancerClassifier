# Breast Cancer Classifier

final project for the undergraduate degree in systems analysis and development at IFRN

The project consists of a binary classifier for mammography images using Convolutional Neural Networks, employing Python libraries for model building, image processing, and dataset management.

## How to run the project

### [Dev Container](./DEVCONTAINER_README.md)

To run in DevContainer, you must have [Docker Desktop](https://www.docker.com/products/docker-desktop), [VS Code](https://code.visualstudio.com/) and [VS Code Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

#### Quick Start

1. Clone the repository
2. Open the folder in VS Code
3. Press `F1` and select **"Dev Containers: Reopen in Container"**
4. Wait for the container to build (5-10 minutes on first run)
5. Start working! 🚀

Or use the automated script:

##### Windows

```powershell
.\start.ps1
```

##### Linux

```bash
chmod +x start.sh
./start.sh
```

### Cloning the repository

#### HTTPS

```bash
git clone https://github.com/FelipeAlves14/BreastCancerClassifier.git
```

#### SSH (create a SSH Key with [Github Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key) and run the command below)

```bash
git clone git@github.com:FelipeAlves14/BreastCancerClassifier.git
```

#### Github CLI

```bash
gh repo clone FelipeAlves14/BreastCancerClassifier
```

#### Installing dependencies

```bash
python -m venv .venv \
. .venv/bin/activate \
pip install -r requirements.txt
```

## How to obtain the dataset

The dataset is downloaded from the [Kaggle](https://www.kaggle.com/) website via [this repository](https://www.kaggle.com/datasets/awsaf49/cbis-ddsm-breast-cancer-image-dataset). to assemble the structure of the proposed dataset, it´ll be necessary to build the structure below:

```txt
/imagensCancerMama
├── /teste_dataset      # Test images
├── /treino_dataset     # Train images
│   ├── /benigno            # BENIGN\BENIGN_WITHOUT_CALLBACK train images
│   └── /maligno            # MALIGNANT train images
```

Then, with the `divisor_de_arquivos` module, with the functions `fill_dirs` and `divide_test_to_train`, This will distribute the images across directories according to the CSV files used from the downloaded dataset, in this way:

```python
    from divisor_de_arquivos import divide_test_to_train, fill_dirs
    from pandas import read_csv

    # Create train and test Dataframes
    train_df = read_csv(join(CSV_PATH, "mass_case_description_train_set.csv"))
    test_df = read_csv(join(CSV_PATH, "mass_case_description_test_set.csv"))

    # Unify BENIGN with BENIGN_WITHOUT_CALLBACK
    train_df["pathology"] = train_df["pathology"].replace(
        "BENIGN_WITHOUT_CALLBACK", "BENIGN"
    )


    # EXECUTE THE LINES BELOW ONLY ONCE, IF THE DIVISION FAILS, EXECUTE AGAIN

    # fill train "benigno" and "maligno" directories by the Dataframes' pathology key
    fill_dirs([train_df, test_df])

    # divide test images of train directories by the filename in test images CSV
    divide_test_to_train(test_df)
```

After the distribution, some files will have to be erased, because this dataset was built for detection and classification, and this project is focused on classification. Therefore, it will be necessary to remove the non mammography images, as their purpose was to be used for detection.
