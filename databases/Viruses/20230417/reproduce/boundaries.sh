#!/bin/bash

metasbt boundaries --db-dir ./MetaSBT-Viruses \
                   --superkingdom Viruses \
                   --nproc 120 \
                   --output ./MetaSBT-Viruses/boundaries.tsv \
                   --log ./MetaSBT-Viruses/boundaries.log \
                   --tmp-dir ./MetaSBT-Viruses/tmp \
                   --verbose