/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   freenull.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mpalkov <mpalkov@student.42barcelo>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/09 17:33:57 by mpalkov           #+#    #+#             */
/*   Updated: 2023/02/10 14:06:11 by mpalkov          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>

int	ft_ptr_freenull(void *x_ptr)
{
	void	**ptr;

	ptr = (void **)x_ptr;
	if (*ptr)
	{
		free(*ptr);
		*ptr = NULL;
	}
	return (0);
}

// this function serves to free and set any pointer
// (previously created with malloc/calloc...) to a NULL;

//USE:
/* int	main(void)
{
	char	*c;

	c = malloc(8);
	ft_ptr_freenull(&c);
	return (0);
} */
