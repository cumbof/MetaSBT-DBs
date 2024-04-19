#!/bin/bash

metasbt index --cluster-prefix MSBT \
              --db-dir ./MetaSBT-Viruses \
              --extension fna \
              --input-list references.tsv \
              --log ./MetaSBT-Viruses/index.log \
              --nproc 50 \
              --parallel 2 \
              --tmp-dir ./MetaSBT-Viruses/tmp \
              --estimate-kmer-size \
              --jellyfish-threads 2 \
              --limit-kmer-size 21 \
              --estimate-filter-size \
              --increase-filter-size 100.0 \
              --min-kmer-occurrences 1 \
              --verbose
