
/****************************************************************************
 *
 * MODULE:       r.recode
 * AUTHOR(S):    CERL
 *               Bob Covill <bcovill tekmap.ns.ca>, Hamish Bowman <hamish_nospam yahoo.com>,
 *               Jan-Oliver Wagner <jan intevation.de>
 * PURPOSE:      Recode categorical raster maps
 * COPYRIGHT:    (C) 1999-2006 by the GRASS Development Team
 *
 *               This program is free software under the GNU General Public
 *               License (>=v2). Read the file COPYING that comes with GRASS
 *               for details.
 *
 *****************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <grass/gis.h>
#include <grass/Rast.h>
#include <grass/glocale.h>
#include "global.h"

RASTER_MAP_TYPE in_type;
RASTER_MAP_TYPE out_type;
struct FPReclass rcl_struct;
CELL old_min, old_max;
DCELL old_dmin, old_dmax;
int in_fd, out_fd, no_mask, align_wind, make_dcell, nrules, rule_size;
char *name, *result, *title;
char **rules;

int main(int argc, char *argv[])
{
    char *title;
    FILE *srcfp;
    struct GModule *module;
    struct
    {
	struct Option *input, *output, *title, *rules;
	struct Flag *a, *d;
    } parm;

    G_gisinit(argv[0]);

    module = G_define_module();
    module->keywords = _("raster");
    module->description = _("Recodes categorical raster maps.");

    parm.input = G_define_standard_option(G_OPT_R_INPUT);
    parm.input->description = _("Raster map to be recoded");

    parm.output = G_define_standard_option(G_OPT_R_OUTPUT);

    parm.rules = G_define_option();
    parm.rules->key = "rules";
    parm.rules->type = TYPE_STRING;
    parm.rules->description = _("File containing recode rules; \"-\" to read from stdin");
    parm.rules->key_desc = "name";
    parm.rules->gisprompt = "old_file,file,input";
    parm.rules->answer = "-";

    parm.title = G_define_option();
    parm.title->key = "title";
    parm.title->required = NO;
    parm.title->type = TYPE_STRING;
    parm.title->description = _("Title for the resulting raster map");

    parm.a = G_define_flag();
    parm.a->key = 'a';
    parm.a->description = _("Align the current region to the input map");

    parm.d = G_define_flag();
    parm.d->key = 'd';
    parm.d->description = _("Force output to double map type (DCELL)");

    if (G_parser(argc, argv))
	exit(EXIT_FAILURE);

    name = parm.input->answer;
    result = parm.output->answer;
    title = parm.title->answer;
    align_wind = parm.a->answer;
    make_dcell = parm.d->answer;

    srcfp = stdin;
    if (strcmp(parm.rules->answer, "-") != 0) {
	srcfp = fopen(parm.rules->answer, "r");
	if (!srcfp)
	    G_fatal_error(_("Cannot open rules file <%s>"),
			  parm.rules->answer);
    }

    if (!read_rules(srcfp)) {
	if (isatty(fileno(srcfp)))
	    G_fatal_error(_("No rules specified. Raster map <%s> not created."),
			  result);
	else
	    G_fatal_error(_("No rules specified"));
    }

    no_mask = 0;

    do_recode();

    exit(EXIT_SUCCESS);
}
