#!/bin/bash
# Generiert Konkordanz NZ-MMSID / HAN-Systemnummer
# Input: MARCXML-File mit allen HAN-Aufnahmen exportiert aus der Alma NZ
# Output: https://here.slsp.ch/display/PSI/Migration%3A+Bibliographic+records
catmandu convert MARC --type XML to CSV --collect_fields '1' --sep_char '|' --fix make_han_concordance.fix < dsv05_2020120212_19398715640005501_new_1.xml > han_concordance_1.csv
catmandu convert MARC --type XML to CSV --collect_fields '1' --sep_char '|' --fix make_han_concordance.fix < dsv05_2020120212_19398715640005501_new_2.xml > han_concordance_2.csv
catmandu convert MARC --type XML to CSV --collect_fields '1' --sep_char '|' --fix make_han_concordance.fix < dsv05_2020120212_19398715640005501_new_3.xml > han_concordance_3.csv
catmandu convert MARC --type XML to CSV --collect_fields '1' --sep_char '|' --fix make_han_concordance.fix < dsv05_2020120212_19398715640005501_new_4.xml > han_concordance_4.csv
exit 0
