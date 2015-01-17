#!/usr/bin/awk -F\| -f

BEGIN {
  FS="|";
  print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
  print "<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n"
  printf "<url>\n  <loc>%s/</loc>\n</url>\n", baseurl
}

# only handle items w/ dates -- grep should already handle this, but never
# hurts to check it again.
{ 

  # extract the date components from the path
  split($1, d, "/"); 

  # convert source .md references to .html
  sub("\.md$", ".html", $1)

  # in the event that baseurl arg is empty, set to null
  if (length(baseurl) == 0) baseurl=""

  # entry HTML, simple
  #printf "&#8226; <small>%s-%s-%s</small> <a href=\"%s%s\">%s</a><br />\n", d[3], d[4], d[2], baseurl, $1, $2

  printf "<url>\n  <loc>%s%s</loc>\n</url>\n", baseurl, $1
}

END {
  print "</urlset>"
}
