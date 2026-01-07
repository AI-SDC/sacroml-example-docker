This folder scripts  and details for running initial evaluation of sacro-ml on a benchmark open-source dataset

## Scripts

docker is built using 
```
docker build -t jimsmithuwe/sacroml-example:v1 .
```

and for testing the outputs are created correctly, I mapped them to a local directory
```

docker run -v <absolute path to where you want to mount the outputs folder>:/mydata/outputs -it  jimsmithuwe/sacroml-example:v1 

```

## Contents

**Examples folder**
* Example using acro to do some standard analytics and request some outputs
    - `acro_containerised_demo.py` - produces some tables from the nursery dataset.

* Examples of training  target machine learning models and creating `target' models to be risk assessed:
    - `train_rf_breast_cancer.py` - Trains a Random Forest on breast cancer dataset.
      This illustrates how to work efficiently with relatively small tabular datasets,
       that can be  stored alongside model inside the `target` created.
      
    - `train_rf_nursery.py` - Trains a Random Forest  on nursery dataset with one-hot encoding.
      This illustrates how to work with bigger datasets (or directories or records)
       that are stored by reference rather than directly within the target.
 
       
* Examples of programmatically running attacks:
   - `attack_rf_nursery.py`
  This script demonstrates how to run simulations of various atacks:
    - Likelihood Ratio (LiRA) and Worst-case membership inference attacks,
    - Structural attacks (measuring aspects like `k-anonymity')
    -  and an Attribute Attack.
    The script can be repurposed simply by changing the target name and commenting out undesired attacks. 

**Data folder**
- Versions of the nursery admissions dataset. Rajkovic et al 1997 [openml version](https://www.openml.org/search?type=data&sort=runs&id=26&status=active)

## Programmatic Execution

To run a programmatic example:
1. Run the relevant training script.
2. Run the desired attack script.

For example: creating and risk assessing a traditional table:
```
$ python -m examples.acro_containerised_demo
```
will create a folder `run_DATE` inside the folder `Example_ACRO_Outputs`. 
That folder can be ingested by the SACRO viewer for outpurt checkers.

These examples train a Random Forest classifier on the nursery datasets then run the suite of risk assessment attacks
```
$ python -m examples.train_rf_nursery
$ python -m examples.attack_rf_nursery
```
The scripts will create a report in a folder called ``output_rf_nursery``

### Command Line Interface (CLI) Execution: SACROML

1. Run the relevant training script.
2. Generate an `attack.yaml` config.
3. Run the attack CLI tool.

For example:
```
$ python -m examples.train_rf_breast_cancer
$ sacroml gen-attack
$ sacroml run target_rf_breast_cancer attack.yaml
```

If you are unable to use the Python `Target` class to generate the `target_dir/` containing the `target.yaml` you can generate one using the CLI tool:

```
$ sacroml gen-target
```