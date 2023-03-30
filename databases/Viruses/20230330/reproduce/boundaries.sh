#!/bin/bash

metasbt boundaries --db-dir ./MetaSBT-Viruses \
                   --superkingdom Viruses \
                   --max-genomes 100 \
                   --nproc 120 \
                   --output ./MetaSBT-Viruses/boundaries.tsv \
                   --tmp-dir ./MetaSBT-Viruses/tmp \
                   --verbose