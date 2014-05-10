# TODO

## Exerpts

indexing: first X characters/words, with HTML stripped

first 100 characters:

	head -c 100 

remote all HTML tags:

	sed 's/<[^>]*>//g' 

alternative: place exerpt in meta, replace as template

alternative: grep -Po to extract content within an `<exerpt></excerpt>` tags

## Sitemap

modify all-entries index to generate sitemap

## RSS

check [bashblog](https://github.com/cfenollosa/bashblog)'s `make_rss` function
