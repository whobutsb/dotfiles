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



__Links__

- [A GIT Primer](http://danielmiessler.com/study/git/)
- [A Hackers Guide to Git](https://wildlyinaccurate.com/a-hackers-guide-to-git)
-
