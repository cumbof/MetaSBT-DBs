# MetaSBT databases

Here is the list of all the public MetaSBT databases:

|    | Database | Version  | References | MAGs | Species | Unknowns |
| -: | :------- | :------- | :--------- | :--- | :------ | :------- |
| 1  | Viruses  | [20240410](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20240410) | 26285 | 0 | 7772 | 0 |
| 2  | Viruses  | [20240415](https://github.com/cumbof/MetaSBT-DBs/blob/main/databases/Viruses/20240415) | 26285 | 523 | 8131 | 359 |

## Reproducibility

The MetaSBT databases listed above can be reproduced by running the following pipeline.

> __Note:__
> In order to rebuild the MetaSBT databases from scratch, you are supposed to have the MetaSBT framework and its dependencies installed on your machine. Please visit the official MetaSBT Wiki at [https://github.com/cumbof/MetaSBT/wiki](https://github.com/cumbof/MetaSBT/wiki) for a step-by-step guide on how to install MetaSBT.

### Baseline

The first step consists in retrieving a set of reference genomes for building a first baseline. We retrieved the viral reference genomes from NCBI GenBank by running the [`get_ncbi_genomes.py`](https://github.com/cumbof/MetaSBT/blob/main/scripts/get_ncbi_genomes.py) utility of MetaSBT as follow:

```bash
get_ncbi_genomes.py --superkingdom Viruses \  # The Viruses superkingdom
                    --type reference \        # Type of genomes
                    --download \              # Download the genome files
                    --nproc 8 \               # Download in parallel
                    --out-dir ./sequences     # Output folder
```

This command downloads all the reference genomes in NCBI GenBank that belongs to the Viruses superkingdom. It also reports a table called `references.tsv` with the list of all the downloaded genomes and their taxonomic labels as reported in NCBI GenBank.

These genomes are then all preprocessed together by performing an average-linkage hierarchical clustering to build species clusters at 5% genetic distance computed with [MASH](https://github.com/marbl/Mash). This procedure is provided within the [`cluster.py`](https://github.com/cumbof/MetaSBT/blob/main/scripts/cluster.py) utility of MetaSBT and can be reproduced by running the following command:

```bash
cluster.py --filepath references.tsv \  # The output table of `get_ncbi_genomes.py`
           --kmer-size 9 \              # Kmer size estimated with `kitsune`
           --threshold 0.05 \           # Threshold for the definition of species
           --tmp-dir ./tmp \            # Temporary folder
           --out-file clusters.tsv      # The output table with new clusters
```

Please not that the input `references.tsv` file under the `--filepath` argument must contain two columns with the list of paths to the input files and their taxonomic labels as reported by the [`get_ncbi_genomes.py`](https://github.com/cumbof/MetaSBT/blob/main/scripts/get_ncbi_genomes.py) utility in the previous step.

Also note that, in order to establish a proper kmer size (i.e., 9) for our set of genomes, we used [kitsune](https://github.com/natapol/kitsune).

The result of the [`cluster.py`](https://github.com/cumbof/MetaSBT/blob/main/scripts/cluster.py) utility is a new tabular file with two column containing a mapping between the path to the input genome files and their new taxonomic labels. These have been assigned by applying a majority voting mechanism on the set of taxonomic labels of all the genomes under the same clusters.

Genomes are then processed to extract their minimizers with the [`minimizers.sh`](https://github.com/cumbof/MetaSBT/blob/main/scripts/minimizers.sh) utility as follow:

```bash
minimizers.sh ./sequences \   # Input folder with genomes
              ./minimizers \  # Output folder with minimizers
              fna \           # Input file extension
              8 \             # Process input files in parallel
              9 \             # Kmer size as originally estimated by `kitsune`
              20 \            # Window size
              1               # Process input records in parallel
```

The list of paths in the output table of [`cluster.py`](https://github.com/cumbof/MetaSBT/blob/main/scripts/cluster.py) are then updated to point to the files with minimizers as computed by the [`minimizers.sh`](https://github.com/cumbof/MetaSBT/blob/main/scripts/minimizers.sh) utility.

Finally, we built the first MetaSBT Viruses database with viral reference genomes by running the `index` module of MetaSBT as follow:

```bash
metasbt index --cluster-prefix MSBT \              # Each cluster is identified by an incremental number with a custom prefix
              --db-dir ./MetaSBT-Viruses \         # Path to the database folder
              --extension fna \                    # The extension of the input files
              --input-list clusters.tsv \          # Table with the list of input file paths with minimizers and their taxonomic labels
              --log ./MetaSBT-Viruses/index.log \  # Path to the log file
              --nproc 8 \                          # Make the pipeline parallel when possible
              --parallel 2 \                       # Used in conjunction with --nproc
              --tmp-dir ./MetaSBT-Viruses/tmp \    # Temporary folder
              --kmer-len 9 \                       # Kmer size as originally estimated by `kitsune`
              --estimate-filter-size \             # Estimate a proper Bloom Filter size automatically
              --increase-filter-size 100.0 \       # Increment the estimated Bloom Filter size for eventual updates
              --min-kmer-occurrences 1 \           # Minimum number of kmer occurrences for considering kmers while estimating the Bloom Filter size
              --verbose                            # Print progresses on the stdout
```

### Report

A database report with the list of known and unknown clusters, together with their composition in terms of numbere of reference genomes and MAGs, is produced with the `report` module of MetaSBT:

```bash
metasbt report --db-dir ./MetaSBT-Viruses \                # Path to the database folder
               --output-file ./MetaSBT-Viruses/report.tsv  # Path to the output report table
```

### Boundaries

The clusters boundaries, defined as the minimum and maximum amount of kmers in common between all the reference genomes under the same cluster, are computed by running the `boundaries` module of MetaSBT as follow:

```bash
metasbt boundaries --db-dir ./MetaSBT-Viruses \                 # Path to the database folder
                   --superkingdom Viruses \                     # Process clusters under the Viruses superkingdom only
                   --nproc 8 \                                  # Process clusters in parallel
                   --output ./MetaSBT-Viruses/boundaries.tsv \  # The output table with clusters boundaries
                   --log ./MetaSBT-Viruses/boundaries.log \     # Path to the log file
                   --tmp-dir ./MetaSBT-Viruses/tmp \            # Temporary folder
                   --verbose                                    # Print progresses on the stdout
```

### Updates

Genomes and sequences that have been included in any of the MetaSBT updates have been preprocessed in the same way of the reference genomes in the first baseline of the Viruses database.

The kmer size must be maintained to 9 as originally estimated by [kitsune](https://github.com/natapol/kitsune). In case of MAGs or viral sequences, there is no need to run the [`cluster.py`](https://github.com/cumbof/MetaSBT/blob/main/scripts/cluster.py) utility since they are not originally assigned with a taxonomic label

In case of viral sequences, these are usually available in a single fasta file. Thus, it is first required to expand it into multiple fasta files, one for each entry by running the [`expand_fasta.py`](https://github.com/cumbof/MetaSBT/blob/main/scripts/expand_fasta.py) utility:

```bash
expand_fasta.py --filepath sequences.fasta \  # Path to the input fasta file with sequences
                --out-dir ./sequences \       # Path to the output folder
                --out-file-prefix Seq         # Each file is identified by an incremental number with a custom prefix
```

The extraction of minimizers is still required for each of the database updates with the same kmer and window sizes used for extracting minimizers from the reference genomes.

A MetaSBT database can be finally updated with the `update` module of MetaSBT:

```bash
metasbt update --boundaries boundaries.tsv \         # Path to the clusters boundaries table
               --boundary-uncertainty 2.0 \          # Uncertainty used to eventually enlarge clusters based on their boundaries
               --cluster-prefix MSBT \               # Each cluster is identified by an incremental number with a custom prefix
               --db-dir ./MetaSBT-Viruses \          # Path to the database folder
               --extension fna \                     # The extension of the input files
               --input-list sequences.txt \          # Table with the list of input file paths with minimizers and, optionally, their taxonomic labels
               --log ./MetaSBT-Viruses/update.log \  # Path to the log file
               --nproc 8 \                           # Make the pipeline parallel when possible
               --parallel 2 \                        # Used in conjunction with --nproc
               --tmp-dir ./MetaSBT-Viruses/tmp \     # Temporary folder
               --verbose                             # Print progresses on the stdout
```