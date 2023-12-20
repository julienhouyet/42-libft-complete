# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jhouyet <jhouyet@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/19 09:14:53 by jhouyet           #+#    #+#              #
#    Updated: 2023/12/20 11:22:11 by jhouyet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RED=\033[0;31m
GREEN=\033[0;32m
YELLOW=\033[1;33m
NC=\033[0m

NAME = libft.a

SRC_DIR = src/
OBJ_DIR = obj/
LIB_DIR = lib/
INC_DIR = include/
LIBNAME = $(LIB_DIR)$(NAME)

SRC = $(wildcard $(SRC_DIR)*.c)
OBJ = $(SRC:$(SRC_DIR)%.c=$(OBJ_DIR)%.o)

CC = gcc
CFLAGS = -Wall -Wextra -Werror
IFLAGS = -I.

$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	@echo "$(YELLOW)Compiling $<$(NC)"
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@

all: $(LIBNAME)

$(LIBNAME): $(OBJ)
	@echo "$(GREEN)Creating library $(LIBNAME)...$(NC)"
	@mkdir -p $(LIB_DIR)
	@ar rc $(LIBNAME) $(OBJ)
	@echo "$(GREEN)Library created!$(NC)"

clean:
	@echo "$(RED)Cleaning objects...$(NC)"
	@$(RM) $(OBJ)
	@rm -rf $(OBJ_DIR)
	@echo "$(GREEN)Cleaned!$(NC)"

fclean: clean
	@echo "$(RED)Fully cleaning library...$(NC)"
	@$(RM) $(LIBNAME)
	@rm -rf $(LIB_DIR)
	@echo "$(GREEN)Fully cleaned!$(NC)"

re: fclean all

.PHONY: all clean fclean re