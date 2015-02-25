# GIT

## Discarding changes

Discard all local changes in a file since it was last committed

	$ git checkout -- <filename>

Discard all local changes in your working copy.  Resetting your project completely to the last committed state

	$ git reset --hard HEAD

### Fixing the last commit

	$ git commit -m "Fix bug #300"  // Wrong bug number and forgot to add a change

	$ git add <filename> // add the changes as usual

	$ git commit --ammend -m "Fix bug #299" // commit using the --ammend option with the correct message

`--ammend` lets you fix (only) the very last commit very easily.  Since this rewrites history never ammend commits that have already been pushed to a remote repo.

## Git Hooks

- `prepare-commit-msg` - fires before the commit message prompt. 
- `pre-commit` - fires before the `git commit`
- `post-commit` - fires after the `git commit`
- `pre-checkout` - fires before changing branches
- `post-checkout` - fires after changing branches
- `post-merge` - fires after merging branches
- `pre-push` - fires before code is pushed to a remote

**Extending Hooks**

Hooks can be extended like so: `{pre,post}-$EVENT` within the `.git/hooks` directory.  

**Example usage**

Automatically run composer after checking out

	# .git/hooks/post-checkout
	composer install > /dev/null &

## Git Flow 

[Effective Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)


[ThoughtBot - Use Git Hooks to Automate Necessary but annoying tasks](http://robots.thoughtbot.com/use-git-hooks-to-automate-annoying-tasks)

__Links__

- [A GIT Primer](http://danielmiessler.com/study/git/)
- [A Hackers Guide to Git](https://wildlyinaccurate.com/a-hackers-guide-to-git)
- [Git Workshop](https://github.com/NeuralSandwich/git-workshop/blob/master/readme.md)
- [Pro Git](http://git-scm.com/book/en/v2)
