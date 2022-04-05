# Life_history

current: target
-include target.mk

##################################################################

aggression.Rout: aggression.R
	$(pipeR)

aggressionPlots.Rout: aggressionPlots.R aggression.rds
	$(pipeR)

##################################################################

## Older Content

Sources += $(wildcard *.R)

frontier.Rout: frontier.R
	$(run-R)
meancomp.Rout: meancomp.R
	$(run-R)

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk

-include makestuff/pipeR.mk
-include makestuff/pdfpages.mk

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
