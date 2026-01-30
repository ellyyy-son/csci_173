#include <mpi.h>
#include <math.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
    int myid, numprocs, i;
    long n = 100000000;
    double PI25DT = 3.141592653589793238462643;
    double mypi, pi, x;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &myid);

    MPI_Bcast(&n, 1, MPI_LONG, 0, MPI_COMM_WORLD);

    x = 0.0;
    for (i = myid; i < n; i += numprocs) {
        double sign = (i % 2 == 0) ? 1.0 : -1.0;
        x += sign / (2.0 * i + 1.0);
    }

    mypi = x;

    MPI_Reduce(&mypi, &pi, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);

    if (myid == 0) {
        pi = pi * 4.0;
        printf("pi is approximately %.16f, Error is %.16f\n",
               pi, fabs(pi - PI25DT));
    }

    MPI_Finalize();
    return 0;
}
