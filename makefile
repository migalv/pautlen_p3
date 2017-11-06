CC = gcc -ansi -pedantic -g
CFLAGS = -Wall

all: pruebaMorfo

pruebaMorfo: lex.yy.o main.o tokens.h
	$(CC) $(CFLAGS) -o $@ main.o lex.yy.o

lex.yy.c: alfa.l
	flex alfa.l

lex.yy.o : lex.yy.c tokens.h
	$(CC) -c lex.yy.c

main.o: main.c tokens.h
	$(CC) -c main.c

clean:
	rm *.o lex.yy.c pruebaMorfo