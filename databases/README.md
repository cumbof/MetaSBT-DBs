# MetaSBT databases

Here is the list of all the public MetaSBT databases:

|    | Database | Version  | References | MAGs   | Species | Unknowns |
| -: | :------- | :------- | :--------- | :----- | :------ | :------- |
|  1 | Viruses  | 20250115 | 26285      | 0      | 8169    | 0        |
|  2 | Viruses  | 20250118 | 26285      | 1111   | 9105    | 936      |
|  3 | Viruses  | 20250320 | 26285      | 190756 | 40729   | 32560    |

## Reproducibility

The MetaSBT databases listed above can be reproduced by running the following pipeline.

> [!NOTE]
> In order to rebuild the MetaSBT databases from scratch, you are supposed to have the MetaSBT framework and its dependencies installed in your machine. Please visit the official MetaSBT Wiki at [https://github.com/cumbof/MetaSBT/wiki](https://github.com/cumbof/MetaSBT/wiki) for a step-by-step guide on how to install MetaSBT.

### Baseline

The first step consists in retrieving a set of reference genomes for building a first baseline. We retrieved the viral reference genomes from NCBI GenBank by running the [`get_ncbi_genomes.py`](https://github.com/cumbof/MetaSBT/blob/main/scripts/get_ncbi_genomes.py) utility of MetaSBT as follow:

```text
$ mkdir -p ~/genomes
$ get_ncbi_genomes.py --superkingdom Viruses \  # The Viruses superkingdom
                      --type reference \        # Type of genomes
                      --download \              # Download the genome files
                      --nproc 8 \               # Download in parallel
                      --out-dir ./genomes       # Output folder
```

This command downloads all the reference genomes in NCBI GenBank that belongs to the Viruses superkingdom. It also reports a table called `references.tsv` with the list of all the downloaded genomes and their taxonomic labels as reported in NCBI GenBank.

We built the first MetaSBT Viruses database with viral reference genomes by running the `index` subroutine as follow:

```text
$ mkdir -p ~/MetaSBT-DBs
$ metasbt index --workdir ~/MetaSBT-DBs \                # The working directory with MetaSBT databases
                --database Viruses \                     # The database name
                --references ~/genomes/references.tsv \  # The list of reference genomes
                --increase-filter-size 100.0 \           # Increment the estimated filter size
                --min-kmer-occurrences 1 \               # Consider kmers with a minimum of one occurrence
                --nproc 32                               # Make it parallel
```

The resulting `clusters.tsv` under `~/MetaSBT-DBs/Viruses` contain an overview of the MetaSBT clusters at all the seven taxonomic levels with the list of known and unknown clusters, together with their composition in terms of numbere of reference genomes and metagenome-assembled genomes.

### Updates

Given a new set of metagenome-assembled genomes, we update a MetaSBT database with the `update` subroutine as follow:

```text
$ metasbt update --workdir ~/MetaSBT-DBs \       # The working directory with MetaSBT databases
                 --database Viruses \            # The database name
                 --genomes ~/genomes/mags.txt \  # The list of metagenome-assembled genomes
                 --nproc 32                      # Make it parallel
```