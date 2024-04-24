# Building energy probabilistic modelling

This repository is an introduction to probabilistic modelling applied to building energy performance assessment. The tutorials use the [PyMC](https://www.pymc.io/welcome.html) package.

[Direct link to the Github repository](https://github.com/srouchier/simurex2024)

## 1\. Cloning the repository

The most convenient way to download the content of the course is to download its Github repository:

* Navigate to the folder where you would like to copy the content of the course
* Open a terminal and clone the repository as follows:

```bash
git clone https://github.com/srouchier/simurex2024.git
```

## 2\. Install PyMC

Option 1: follow the [installation instructions](https://www.pymc.io/projects/docs/en/stable/installation.html) on PyMC's website. Check that your setup works by running some of their examples.

Option 2: if you installed Python through Anaconda and use the conda package manager, you can use the environment files provided in the repository. I have generated two yml files, for use whether you're on Windows or Linux:

```bash
conda env create -f environment_win.yml
```

or

```bash
conda env create -f environment_linux.yml
```

Both options install PyMC and its dependencies in a dedicated environment called pymc_env. You may install PyMC in your base environment or any other if you prefer.

## 3\. Running the notebooks

I recommend using JupyterLab to run the notebooks, as the data visualisation libraries integrate well with it. 

Open a terminal in the folder where you downloaded the repository. If you're using conda, you can activate the environment in which you installed PyMC, and launch JupyterLab as follows:

```bash
conda activate pymc_env
jupyter-lab
```