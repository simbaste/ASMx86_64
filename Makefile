##
## Makefile for  in /home/simomb_s/semestre4/rendu_4/asm_minilibc
##
## Made by stephanedarcy simomba
## Login   <simomb_s@epitech.net>
##
## Started on  Thu Mar 24 05:16:03 2016 stephanedarcy simomba
## Last update Fri Apr  8 13:52:25 2016 stephanedarcy simomba
##

CC	= gcc

NAME	= libasm.so

SRCS	= strlen.s \
	strchr.s \
	# memset.s \
	# memcpy.s \
	# strcmp.s \
	# memmove.s \
	# strcasecmp.s \
	# rindex.s \
	# strstr.s \
	strncmp.s

OBJS	= $(SRCS:.s=.o)

LDFLAGS	+= -shared -fPIC

CFLAGS	= -fno-builtin-function -fno-builtin-memcpy -fno-builtin-memset -fno-biltin-strchr -fno-builtin-strcmp -fno-builtin-strlen -fno-builtin-rindex

RM	= rm -f

.s.o	:
	nasm -f elf64 -F dwarf $< -o $@

$(NAME) : $(OBJS)
	$(CC) $(OBJS) -o $(NAME) $(LDFLAGS)

all	: $(NAME)

clean	:
	$(RM) $(OBJS)

fclean	: clean
	$(RM) $(NAME)

re	: fclean all

.PHONY	: all clean fclean re
