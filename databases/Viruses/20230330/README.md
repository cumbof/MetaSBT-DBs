# MetaSBT database

First public MetaSBT database for the `Viruses` superkingdom that comprises taxonomically organised viral reference genomes from the NCBI GenBank database.

The database shows the following characteristics:

| Attribute | Value |
| :-------- | :---- |
| Superkingdom | Viruses |
| Version | 20230330 |
| Reference Genomes | 13480 |
| Metagenome-Assembled Genomes | 0 |
| Species | 2819 |
| Genera | 460 |
| Families | 118 |
| Orders | 53 |
| Classes | 33 |
| Phyla | 17 |
| Unknowns | 0 |
| Bloom Filter Size | 279936 |
| Kmer Length | 9 |
| Tarball File | [Download](https://zenodo.org/api/files/31ddc363-e207-4c88-b1ce-5353b53ac615/MetaSBT-Viruses-20230330.tar) |
| Tarball Size | 459MB |
| Tarball SHA256 | de4862bbe876ebca3b64e062f531bfc9b2c04fed499bc4b4dfb8bd94d64321cf |

## Available data

| Data | Link |
| :--- | :--- |
| Boundaries | [boundaries.tsv](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20230330/data/boundaries.tsv) |
| Report | [report.tsv](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20230330/data/report.tsv) |

## How to reproduce the database

We always provide the full command line we used to produce the database tarball and every file listed above.

| Module | Link |
| :----- | :--- |
| `index` | [index.sh](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20230330/reproduce/index.sh) |
| `boundaries` | [boundaries.sh](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20230330/reproduce/boundaries.sh) |
| `report` | [report.sh](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20230330/reproduce/report.sh) |
