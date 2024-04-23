# MetaSBT Public Databases

A collection of public MetaSBT databases with taxonomically organised Sequence Bloom Trees (SBTs) built over curated sets of microbial genomes.

## About databases

Databases are produced with the open-source MetaSBT framework available at [https://github.com/cumbof/MetaSBT](https://github.com/cumbof/MetaSBT).

MetaSBT databases are nothing else than big `tar` archives containing bloom filter representations of microbial genomes taxonomically organised in SBTs. You can extract the archive by yourself but most of the files in there contain absolute paths that are not compatible with their actual location on your file system.

In order to make it easier to deploy and distribute a database, we provide an automated procedure implemented into the `install` module of the MetaSBT framework.

Have a look at the official documentation for additional information about how to retrieve the most updated list of public database and how to install them at [https://github.com/cumbof/MetaSBT/wiki/Installing-public-pre-built-databases](https://github.com/cumbof/MetaSBT/wiki/Installing-MetaSBT-databases).

> __Note:__
> Are you interested in using our software and databases, or you want to build your own private database, but you do not have enough computational resources? Get in touch with us, we are always happy to collaborate!

## Contributing

Long-term discussion and bug reports are maintained via GitHub [Discussions](https://github.com/cumbof/MetaSBT/discussions) and [Issues](https://github.com/cumbof/MetaSBT/issues) under the [MetaSBT framework repository](https://github.com/cumbof/MetaSBT).

Please, (i) be sure that there are no existing issues/discussions concerning the same topic before opening a new issue/discussion; (ii) write a clear and concise description of what the issue/discussion is about; (iii) specifying the list of steps to reproduce the behavior in addition to versions and other technical details is highly recommended.

## Support

Discussions, issues, and PRs are not allowed in this repository.

If you need support, please open an [Issue](https://github.com/cumbof/MetaSBT/issues) or a new [Discussion](https://github.com/cumbof/MetaSBT/discussions) under the [MetaSBT framework repository](https://github.com/cumbof/MetaSBT). We will be happy to answer your questions and help you troubleshoot any kind of issue concerning our framework and databases.

Copyright © 2022 [Fabio Cumbo](https://github.com/cumbof), [Daniel Blankenberg](https://github.com/blankenberg). See [LICENSE](https://github.com/cumbof/MetaSBT-DBs/blob/main/LICENSE) for additional details.
