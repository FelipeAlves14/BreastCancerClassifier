from os import rename, walk
from pandas import DataFrame
from shutil import copy, move


def fill_dirs(csvs: list[DataFrame]) -> None:
    for csv in csvs:
        for _, row in csv.iterrows():
            file_name: str = row["cropped image file path"].split("/")[2]
            destiny_dir: str = (
                "maligno" if row["pathology"] == "MALIGNANT" else "benigno"
            )
            for root, _, files in walk(f"jpeg/{file_name}"):
                for file, index in zip(files, range(len(files))):
                    destiny = f"imagensCancerMama/treino_dataset/{destiny_dir}"
                    copy(
                        f"{root}/{file}",
                        destiny,
                    )
                    rename(
                        f"{destiny}/{file}",
                        f"{destiny}/{file_name}_{index}.jpg",
                    )


def divide_test_to_train(csv: DataFrame) -> None:
    BASE_DIR: str = "imagensCancerMama/"
    for _, row in csv.iterrows():
        file_name: str = row["cropped image file path"].split("/")[2]
        for root, _, files in walk(f"{BASE_DIR}treino_dataset"):
            for file in files:
                if file_name in file:
                    move(
                        f"{root}/{file}",
                        f"{BASE_DIR}teste_dataset",
                    )
                    break


def change_dataframe_train_paths(path: str) -> str:
    file_name: str = path.split("/")[2]
    for root, _, files in walk("imagensCancerMama/treino_dataset"):
        for file in files:
            if file_name in file:
                return f"{root}/{file}"


def change_dataframe_test_paths(path: str) -> str:
    file_name: str = path.split("/")[2]
    for root, _, files in walk("imagensCancerMama/teste_dataset"):
        for file in files:
            if file_name in file:
                return f"{root}/{file}"
