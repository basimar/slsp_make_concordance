#!/bin/bash
# Generiert Konkordanz IZ-MMSID / HAN-Systemnummer
# Input: MARCXML-File mit allen HAN-Aufnahmen exportiert aus den 4 Alma IZ mit HAN-Daten
# Output: https://here.slsp.ch/display/PSI/Migration%3A+Bibliographic+records
catmandu convert MARC --type XML to CSV --collect_fields '1' --sep_char '|' --fix make_han_concordance.fix < dsv05_ubs.xml > han_concordance_ubs.csv
catmandu convert MARC --type XML to CSV --collect_fields '1' --sep_char '|' --fix make_han_concordance.fix < dsv05_zbs.xml > han_concordance_zbs.csv
catmandu convert MARC --type XML to CSV --collect_fields '1' --sep_char '|' --fix make_han_concordance.fix < dsv05_ube.xml > han_concordance_ube.csv
catmandu convert MARC --type XML to CSV --collect_fields '1' --sep_char '|' --fix make_han_concordance.fix < dsv05_rzs.xml > han_concordance_rzs.csv
exit 0
