#include "mpi.h"
#include <math.h>
#include <stdio.h>

int main(argc,argv)
int argc;
char *argv[];

{
    int done = 0, myid, numprocs, i;
    long n;
    double PI25DT = 3.141592653589793238462643;
    double mypi, pi, x;

    n=100000000;

    MPI_Init(&argc,&argv);
    MPI_Comm_size(MPI_COMM_WORLD,&numprocs);
    MPI_Comm_rank(MPI_COMM_WORLD,&myid);

    while (!done)
    {
        MPI_Bcast(&n, 1, MPI_LONG, 0, MPI_COMM_WORLD);
        if (n == 0) break;

        x = 0.0;
        for (i = myid; i < n; i += numprocs) {
            x += (pow(-1, i) / (2*i + 1));
        }
        mypi = x;

        MPI_Reduce(&mypi, &pi, 1, MPI_DOUBLE, MPI_SUM, 0,
                   MPI_COMM_WORLD);

        pi = pi * 4;

        if (myid == 0){
            printf("pi is approximately %.16f, Error is %.16f\n",
                   pi, fabs(pi - PI25DT));
		}
		done = 1;
    }
    MPI_Finalize();
    return 0;
}