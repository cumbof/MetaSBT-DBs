#!/bin/bash

metasbt index --db-dir ./MetaSBT-Viruses \
              --superkingdom Viruses \
              --estimate-kmer-size \
              --estimate-filter-size \
              --limit-estimation-number 50 \
              --increase-filter-size 100.0 \
              --min-kmer-occurrences 1 \
              --log ./MetaSBT-Viruses/MetaSBT.log \
              --nproc 120 \
              --parallel 50 \
              --jellifish-threads 8 \
              --tmp-dir ./MetaSBT-Viruses/tmp \
              --verbose