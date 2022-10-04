# How commit to get tags automatically!

we are following semantic release rules for our tags and it's easy to follow just write your commit exactly like example below

## Fix Release (Patch)

fix(pencil): stop graphite breaking when too much pressure applied
fix: if you fixed a bug so just make your comment as a fix `fix: I fixed a token key`

## Feature Release (Minor)

use feat and write about the it.
feat(terraform): add 'a new resource' option

perf(pencil): remove graphiteWidth option

## Breaking Release (Major)
you have two option here!
BREAKING CHANGE: The graphiteWidth option has been removed.
The default graphite width of 10mm is always used for performance reasons.

perf(pencil): remove graphiteWidth option

## Note
please use git pull before commit anything because this github action bot is creating a file named, CHANGELOG.md and write everything on it so you are always behind of the repository! 