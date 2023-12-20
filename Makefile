# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jhouyet <jhouyet@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/19 09:14:53 by jhouyet           #+#    #+#              #
#    Updated: 2023/12/20 10:50:14 by jhouyet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Couleurs
RED=\033[0;31m
GREEN=\033[0;32m
YELLOW=\033[1;33m
NC=\033[0m # No Color

# Nom de la bibliothèque
NAME = libft.a

# Dossiers
SRC_DIR = src/
OBJ_DIR = obj/
LIB_DIR = lib/
INC_DIR = include/
LIBNAME = $(LIB_DIR)$(NAME)

# Fichiers source et objets
SRC = $(wildcard $(SRC_DIR)*.c)
OBJ = $(SRC:$(SRC_DIR)%.c=$(OBJ_DIR)%.o)

# Compilateur et flags de compilation
CC = gcc
CFLAGS = -Wall -Wextra -Werror
IFLAGS = -I.

# Règle de compilation
$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	@echo "$(YELLOW)Compiling $<$(NC)"
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@

# Règles principales
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

# Phony pour éviter des conflits de fichiers et de noms de règle
.PHONY: all clean fclean re