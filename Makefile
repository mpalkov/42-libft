# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mpalkov <mpalkov@student.42barcelo>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/12 15:39:56 by mpalkov           #+#    #+#              #
#    Updated: 2023/02/17 14:06:26 by mpalkov          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#Makefile v02 - incudes ft_printf and ft_get_next_line

MODE		=	.normal

NAME		=	libft.a

ifeq ($(MODE),.debug)
	CFLAGS	+=	-g3
endif

# ---- FT_PRINTF DIRECTORIES ---------------------------------------------------

PRINTF_DIR	=	ft_printf/

PFOBJ_DIR	=	obj/

PFINCL_DIR	=	includes/

PFSRC_DIR	=	src/

PFUTLS_DIR	=	utils/

# ---- GET_NEXT_LINE DIRECTORIES -----------------------------------------------

GNL_DIR		=	ft_getnextline/

GNLOBJ_DIR	=	obj/

# ---- DIRECTORIES -------------------------------------------------------------

OBJ_DIR		=	obj/

SRCS		+=	ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c \
				ft_strlen.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c \
				ft_strlcpy.c ft_strlcat.c ft_toupper.c ft_tolower.c ft_strncmp.c \
				ft_memcmp.c ft_strchr.c ft_strrchr.c ft_strnstr.c ft_atoi.c \
				ft_calloc.c ft_strdup.c \
				ft_substr.c ft_strjoin.c ft_strtrim.c ft_putchar_fd.c \
				ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_itoa.c \
				ft_split.c ft_strmapi.c ft_striteri.c ft_memchr.c ft_putchar.c \
				ft_ptr_freenull.c \
				ft_lstnew_bonus.c ft_lstadd_front_bonus.c \
				ft_lstsize_bonus.c ft_lstlast_bonus.c ft_lstadd_back_bonus.c \
				ft_lstdelone_bonus.c ft_lstclear_bonus.c ft_lstiter_bonus.c \
				ft_lstmap_bonus.c

# ---------------- FT_PRINTF ---------------------------------------------------

SRCS_PRINTF	=	ft_printf.c

UTLS_PRINTF	=	ft_printf_char_functions.c \
				ft_printf_num_functions.c \
				ft_printf_hex_ptr_functions.c

PRINTF_FLS	+=	$(addprefix $(PRINTF_DIR), $(addprefix $(PFSRC_DIR), $(SRCS_PRINTF)))

PRINTF_FLS	+=	$(addprefix $(PRINTF_DIR), \
				$(addprefix $(PFUTLS_DIR), $(UTLS_PRINTF)))


# ---------------- FT_GET_NEXT_LINE ---------------------------------------------------

SRCS_GNL	=	get_next_line.c get_next_line_utils.c

GNL_FLS		+=	$(addprefix $(GNL_DIR), $(SRCS_GNL))

# ---- COMMANDS  ---------------------------------------------------------------

CC			=	cc

CFLAGS		+=	-Wall -Wextra -Werror -MMD -MP -MT $@

RM			=	rm -f

CP			=	cp -pf


# ---- RULES -------------------------------------------------------------------

OBJS		+=	$(addprefix $(OBJ_DIR), $(SRCS:.c=.o))
OBJS		+=  $(addprefix $(OBJ_DIR), $(PRINTF_FLS:.c=.o))
OBJS		+=  $(addprefix $(OBJ_DIR), $(GNL_FLS:.c=.o))

DEPS		=	$(addsuffix .d, $(basename $(OBJS)))

INCLUDE		=	-I./ -I./includes/

.normal:
	touch .normal

.debug:
	touch .debug

all: $(NAME) $(MODE)

-include $(DEPS)
$(NAME): $(OBJS)
	ar -crs $(NAME) $(OBJS)

$(OBJ_DIR)%.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

clean:
	$(RM) -r $(OBJ_DIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY:	fclean, all, clean, re


