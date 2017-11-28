#!/bin/sh
touch log_out.txt
sudo gcc -o trab_final -lnfc -I../../libnfc trab_final.c ../../libnfc/utils/nfc-utils.o
ls -la
