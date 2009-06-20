#include <grass/gis.h>
#include <grass/Rast.h>
#include <grass/glocale.h>
#include <grass/imagery.h>
#include <grass/cluster.h>


int print_distribution(FILE * fd, struct Cluster *C)
{
    int cat;

    fprintf(fd, _("class distribution"));
    for (cat = 0; cat < C->nclasses; cat++) {
	fprintf(fd, "%s %10ld", cat % 5 ? "" : "\n", (long)C->count[cat]);
    }
    fprintf(fd, "\n");

    return 0;
}
