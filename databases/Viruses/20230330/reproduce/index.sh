#!/bin/bash

metasbt index --db-dir ./MetaSBT-Viruses \
              --superkingdom Viruses \
              --kmer-len 9 \
              --estimate-filter-size \
              --limit-estimation-number 20 \
              --increase-filter-size 100.0 \
              --log ./MetaSBT-Viruses/MetaSBT.log \
              --nproc 120 \
              --parallel 50 \
              --tmp-dir ./MetaSBT-Viruses/tmp \
              --verbose