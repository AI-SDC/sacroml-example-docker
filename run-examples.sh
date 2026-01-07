touch outputs/imhere.txt
python -m pip show sacroml &>outputs/docker-runlog.txt
#show acro example runs
python -m examples.acro_containerised_demo &>outputs/acrorunlog.txt

#show first ml example runs where target and atacks are done programmatically
python -m examples.train_rf_nursery
python -m examples.attack_rf_nursery


#show second sacroml example works where attacks are done from command line
python -m examples.train_rf_breast_cancer
sacroml gen-attack
sacroml run target_rf_breast_cancer attack.yaml
#tidy outputs into a subfolder
mkdir outputs/output_rf_breast_cancer
mv outputs/shadow_models outputs/output_rf_breast_cancer/
mv report.* outputs/output_rf_breast_cancer

