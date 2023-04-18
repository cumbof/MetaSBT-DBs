# MetaSBT database

First public MetaSBT database for the `Viruses` superkingdom that comprises taxonomically organised viral reference genomes from the NCBI GenBank database.

The database shows the following characteristics:

| Attribute | Value |
| :-------- | :---- |
| Superkingdom | Viruses |
| Version | 20230417 |
| Reference Genomes | 13570 |
| Metagenome-Assembled Genomes | 0 |
| Species | 2819 |
| Genera | 460 |
| Families | 118 |
| Orders | 53 |
| Classes | 33 |
| Phyla | 17 |
| Unknowns | 0 |
| Bloom Filter Size | 279552 |
| Kmer Length | 9 |
| Tarball File | [Download](https://zenodo.org/api/files/0e2ae987-ef23-4682-93f7-3881741efe82/MetaSBT-Viruses-20230417.tar) |
| Tarball Size | 487MB |
| Tarball SHA256 | aa739e45532ef8fa8c3e0e19a6b350b29313273163e7e2f6ce83070a6b1fc5df |

## Available data

| Data | Link |
| :--- | :--- |
| Boundaries | [boundaries.tsv](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20230417/data/boundaries.tsv) |
| Report | [report.tsv](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20230417/data/report.tsv) |

## How to reproduce the database

We always provide the full command line we used to produce the database tarball and every file listed above.

| Module | Link |
| :----- | :--- |
| `index` | [index.sh](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20230417/reproduce/index.sh) |
| `boundaries` | [boundaries.sh](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20230417/reproduce/boundaries.sh) |
| `report` | [report.sh](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20230417/reproduce/report.sh) |
