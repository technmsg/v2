v2
==

A small content publishing engine for generating static HTML pages, suitable for my limited needs.

## Features

* source content in [Markdown](http://daringfireball.net/projects/markdown/) or HTML
* page generation only for changed content

## Requirements

* bash 3.2+
* perl 5+ (for Markdown, supplied)
* python (optional, for local webserver testing)
* rsync

## Usage

Place Markdown or HTML content material within the `content` directory.

Run the build scripts. Content will be inserted between the header and footer `templates`; a limited number of variable substitutions will be performed.

Output files will be created within the `build` directory, suitable for staging/rsync to webserver.

Note: Files within `static` will by copied to `build` directory after page generation, overwriting any pre-existing files.

## Example

A few example pages and posts are provided within the `examples` directory.

	$ mv examples content
	$ ./build_pages
	
## Colophon

Source [code is available](https://github.com/technmsg/v2) under MIT license.

