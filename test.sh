#!/bin/bash
printf "\n-O2 optimized\n\n"
cc -Wall -O2 -DELVIS -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -O2 -DDEFINE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -O2 -DFUNCTION -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -O2 -DFUNCTION -DINLINE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -O2 -DIFTHENELSE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null

printf "\nNo optimization\n\n"
cc -Wall -DELVIS -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -DDEFINE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -DFUNCTION -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -DFUNCTION -DINLINE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -DIFTHENELSE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
