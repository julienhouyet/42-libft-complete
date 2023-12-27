# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jhouyet <jhouyet@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/19 09:14:53 by jhouyet           #+#    #+#              #
#    Updated: 2023/12/27 14:24:35 by jhouyet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RED=\033[0;31m
GREEN=\033[0;32m
YELLOW=\033[1;33m
BLUE=\033[0;34m
ORANGE=\033[38;2;255;165;0m
NC=\033[0m

NAME = libft.a

SRC_DIR = src/
OBJ_DIR = obj/
LIB_DIR = lib/
INC_DIR = include/
LIBNAME = $(LIB_DIR)$(NAME)

SRC = 	$(SRC_DIR)ft_atoi.c \
		$(SRC_DIR)ft_bzero.c \
		$(SRC_DIR)ft_calloc.c \
		$(SRC_DIR)ft_isalnum.c \
		$(SRC_DIR)ft_isalpha.c \
		$(SRC_DIR)ft_isascii.c \
		$(SRC_DIR)ft_isdigit.c \
		$(SRC_DIR)ft_isprint.c \
		$(SRC_DIR)ft_itoa.c \
		$(SRC_DIR)ft_lstadd_back.c \
		$(SRC_DIR)ft_lstadd_front.c \
		$(SRC_DIR)ft_lstclear.c \
		$(SRC_DIR)ft_lstdelone.c \
		$(SRC_DIR)ft_lstiter.c \
		$(SRC_DIR)ft_lstlast.c \
		$(SRC_DIR)ft_lstmap.c \
		$(SRC_DIR)ft_lstnew.c \
		$(SRC_DIR)ft_lstsize.c \
		$(SRC_DIR)ft_memchr.c \
		$(SRC_DIR)ft_memcmp.c \
		$(SRC_DIR)ft_memcpy.c \
		$(SRC_DIR)ft_memmove.c \
		$(SRC_DIR)ft_memset.c \
		$(SRC_DIR)ft_printf_char.c \
		$(SRC_DIR)ft_printf_count.c \
		$(SRC_DIR)ft_printf_hexa.c \
		$(SRC_DIR)ft_printf_number.c \
		$(SRC_DIR)ft_printf_pointer.c \
		$(SRC_DIR)ft_printf_str.c \
		$(SRC_DIR)ft_printf_unsigned_number.c \
		$(SRC_DIR)ft_printf.c \
		$(SRC_DIR)ft_putchar_fd.c \
		$(SRC_DIR)ft_putendl_fd.c \
		$(SRC_DIR)ft_puthexa_fd.c \
		$(SRC_DIR)ft_putnbr_fd.c \
		$(SRC_DIR)ft_putstr_fd.c \
		$(SRC_DIR)ft_split.c \
		$(SRC_DIR)ft_strchr.c \
		$(SRC_DIR)ft_strdup.c \
		$(SRC_DIR)ft_striteri.c \
		$(SRC_DIR)ft_strjoin.c \
		$(SRC_DIR)ft_strlcat.c \
		$(SRC_DIR)ft_strlcpy.c \
		$(SRC_DIR)ft_strlen.c \
		$(SRC_DIR)ft_strmapi.c \
		$(SRC_DIR)ft_strncmp.c \
		$(SRC_DIR)ft_strnstr.c \
		$(SRC_DIR)ft_strrchr.c \
		$(SRC_DIR)ft_strtrim.c \
		$(SRC_DIR)ft_substr.c \
		$(SRC_DIR)ft_tolower.c \
		$(SRC_DIR)ft_toupper.c \
		$(SRC_DIR)get_next_line.c
		
OBJ = $(SRC:$(SRC_DIR)%.c=$(OBJ_DIR)%.o)

CC = gcc
CFLAGS = -Wall -Wextra -Werror
IFLAGS = -I.

TOTAL_FILES 	:= $(words $(SRC))
CURRENT_FILE 	:= 0

define progress_bar_libft
    @$(eval CURRENT_FILE=$(shell echo $$(($(CURRENT_FILE) + 1))))
    @printf "\r$(YELLOW)Compiling... [%-$(TOTAL_FILES)s] %d/%d $(NC)" $$(for i in $$(seq 1 $(CURRENT_FILE)); do printf "#"; done) $(CURRENT_FILE) $(TOTAL_FILES)
	@if [ $(CURRENT_FILE) -eq $(TOTAL_FILES) ]; then echo ""; fi
endef

$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@
	$(call progress_bar_libft)

all: $(LIBNAME)

$(LIBNAME): $(OBJ)
	@echo "$(GREEN)Creating Libft library $(LIBNAME)...$(NC)"
	@mkdir -p $(LIB_DIR)
	@ar rc $(LIBNAME) $(OBJ)
	@echo "$(BLUE)Library Libft created!$(NC)"

clean:
	@echo "$(ORANGE)Cleaning objects Libft...$(NC)"
	@$(RM) $(OBJ)
	@rm -rf $(OBJ_DIR)
	@echo "$(GREEN)Cleaned objects Libft!$(NC)"

fclean: clean
	@echo "$(ORANGE)Fully cleaning Libft...$(NC)"
	@$(RM) $(LIBNAME)
	@rm -rf $(LIB_DIR)
	@echo "$(BLUE)Fully cleaned Libft!$(NC)"

re: fclean all

.PHONY: all clean fclean re