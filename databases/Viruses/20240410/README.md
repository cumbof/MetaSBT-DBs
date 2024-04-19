# MetaSBT database

First public MetaSBT database for the `Viruses` superkingdom that comprises taxonomically organised viral reference genomes from the NCBI GenBank database.

The database shows the following characteristics:

| Attribute | Value |
| :-------- | :---- |
| Superkingdom | Viruses |
| Version | 20240410 |
| Reference Genomes | 26285 |
| Metagenome-Assembled Genomes | 0 |
| Species | 7772 |
| Genera | 969 |
| Families | 157 |
| Orders | 61 |
| Classes | 38 |
| Phyla | 17 |
| Kingdoms | 1 |
| Unknowns | 0 |
| Bloom Filter Size | 186368 |
| Kmer Length | 9 |
| Tarball File | [Download](https://zenodo.org/api/records/10999058/files/MetaSBT-Viruses-20240410.tar/content) |
| Tarball Size | 551MB |
| Tarball SHA256 | 8ea286319bb0a7c39d336302cc5d643a2887a62bc93c912f4b7451c653c5bbfc |

## Available data

| Data | Link |
| :--- | :--- |
| Boundaries | [boundaries.tsv](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20240410/assets/boundaries.tsv) |
| Report | [report.tsv](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20240410/assets/report.tsv) |

## How to reproduce the database

We always provide the full command line we used to produce the database tarball and every file listed above.

| Module | Link |
| :----- | :--- |
| `index` | [index.sh](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20240410/reproduce/index.sh) |
| `boundaries` | [boundaries.sh](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20240410/reproduce/boundaries.sh) |
| `report` | [report.sh](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20240410/reproduce/report.sh) |
