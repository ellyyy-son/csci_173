#include "mpi.h"
#include <math.h>
#include <stdio.h>

int main(argc,argv)
int argc;
char *argv[];
{
    int rank, sum, numprocs;

    MPI_Init(&argc,&argv);
	
    MPI_Comm_size(MPI_COMM_WORLD,&numprocs);
    MPI_Comm_rank(MPI_COMM_WORLD,&rank);
    
	MPI_Reduce(&rank, &sum, 1, MPI_DOUBLE, MPI_SUM, 0,
		   MPI_COMM_WORLD);
    
	if (myid == 0){
		printf("The sum of all the ranks is %i\n",
		sum);
    }

    MPI_Finalize();
    return 0;
}
