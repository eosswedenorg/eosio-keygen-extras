# eosio-keygen-extras

extra files for eosio-keygen.

Right now this repository provides custom dictionary files that can be used to find vanity keys.

## Creating/Updating dictionaries.

This repo contains some useful scripts to automatically generate and update dictionaries:

* `generate-dict.sh`: convert a list of words to a list suitable for eosio-keygen.

  input is read from stdin and should have words separated by newline. output is written to stdout.

* `update-dict.sh`: Reads `config.json` and combines input files. then calls `generate-dict.sh` that generates the output file in `dict/` directory.

## Acquire input dictionaries.

on debian based distros. there are some packages with different lists [here](https://packages.debian.org/search?suite=default&section=all&arch=any&searchon=all&keywords=dictionary+words+for+%2Fusr%2Fshare%2Fdict)

## Author

Henrik Hautakoski - [henrik@eossweden.org](mailto:henrik@eossweden.org)
