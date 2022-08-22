/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putnbr_fd.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mpalkov <mpalkov@student.42barcelo>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/07/15 12:21:21 by mpalkov           #+#    #+#             */
/*   Updated: 2022/08/08 12:26:32 by mpalkov          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <unistd.h>
#include <stdio.h>

void	ft_putnbr_fd(int n, int fd)
{
	int		pos;
	long	nbr;
	char	dec[10];

	pos = 0;
	nbr = n;
	if (nbr < 0)
	{
		nbr *= -1;
		write (fd, "-", 1);
	}
	while (nbr >= 10)
	{
		dec[pos] = nbr % 10 + '0';
		nbr /= 10;
		pos++;
	}
	dec[pos] = nbr % 10 + '0';
	while (pos >= 0)
		write(fd, &(dec[pos--]), 1);
	return ;
}

// This function Outputs the integer ’n’ to the given file descriptor.
//
// passing int n to long nbr and working with this, No lines for special
// case of max negative int are needed, as when multiplying by -1 it does
// not exceeds the max value of int.
