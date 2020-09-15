.PHONY: upstream-pull
upstream-pull: 
	@git pull --rebase upstream master
.PHONY: upstream-pull-continue
	@git rebase continue