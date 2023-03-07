# MetaSBT Public Databases

A collection of public MetaSBT databases with taxonomically organised Sequence Bloom Trees (SBTs) built over curated sets of microbial genomes.

## About databases

MetaSBT databases are nothing else than big `tar` archives containing bloom filter representations of microbial genomes taxonomically organised in SBTs.
You can extract the archive by yourself but most of the files in there contain absolute paths that are not compatible with their actual location on your file system.

In order to make it easier to deploy and distribute a database, we provide an automated procedure implemented into the `install` module of the MetaSBT Python framework.

Please, have a look at the official documentation for additional information about how to retrieve the most updated list of public database and how to install them at [https://github.com/cumbof/MetaSBT](https://github.com/cumbof/MetaSBT)
