#store details of sacroml installation
python -m pip show sacroml &>outputs/sacro_install_log.txt
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
mkdir -p outputs/output_rf_breast_cancer/shadow_models
mv -f outputs/shadow_models outputs/output_rf_breast_cancer/
mv -f outputs/report.* outputs/output_rf_breast_cancer/

