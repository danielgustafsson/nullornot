#!/bin/bash
printf "\nNo optimization\n\n"
cc -Wall -DELVIS -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -DDEFINE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -DFUNCTION -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -DFUNCTION -DFUNCTION_INLINE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -DFUNCTION -DFUNCTION_ELSE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -DFUNCTION -DFUNCTION_ELSE -DFUNCTION_INLINE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -DIFTHENELSE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
printf "\n-O2 optimized\n\n"
cc -Wall -O2 -DELVIS -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -O2 -DDEFINE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -O2 -DFUNCTION -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -O2 -DFUNCTION -DFUNCTION_INLINE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -O2 -DFUNCTION -DFUNCTION_ELSE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -O2 -DFUNCTION -DFUNCTION_ELSE -DFUNCTION_INLINE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -O2 -DIFTHENELSE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
printf "\n-O3 optimized\n\n"
cc -Wall -O3 -DELVIS -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -O3 -DDEFINE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -O3 -DFUNCTION -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -O3 -DFUNCTION -DFUNCTION_INLINE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -O3 -DFUNCTION -DFUNCTION_ELSE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -O3 -DFUNCTION -DFUNCTION_ELSE -DFUNCTION_INLINE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null
cc -Wall -O3 -DIFTHENELSE -c nullornot.c -o nullornot.o && gcc -o nullornot nullornot.o && ./nullornot > /dev/null

