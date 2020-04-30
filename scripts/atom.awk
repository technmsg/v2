#!/usr/bin/awk -F\| -f

BEGIN {
  FS="|";
  print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
  print "<feed xmlns=\"http://www.w3.org/2005/Atom\">\n"
  printf "<title>%s</title>\n", blog_title 
  printf "<link href=\"%s%s\" />\n", baseurl, "/"
  printf "<link href=\"%s%s\" rel=\"self\"/>\n", baseurl, "/index.atom.xml"
  printf "<updated>%s</updated>\n", now
  printf "<id>%s%s</id>\n\n", baseurl, "/"

}

# only handle items w/ dates -- grep should already handle this, but never
# hurts to check it again.
$1 ~ /[0-9]+/ { 

  # extract the date components from the path
  split($1, d, "/"); 

  # convert source .md references to .html
  orig = $1
  sub("\.md$", ".html", $1)

  # in the event that baseurl arg is empty, set to null
  if (length(baseurl) == 0) baseurl=""

  # content/2014/05/03/an-html-entry.html|An HTML Entry|An example of an HTML source entry.|2014-05-02T12:00:00-05:00
  # 1                                     2             3                                   4

  printf "<entry>\n"
  printf "  <author><name>%s</name></author>\n", blog_author
  printf "  <title>%s</title>\n", $2
  printf "  <link href=\"%s%s\"/>\n", baseurl, $1
  printf "  <id>%s%s</id>\n", baseurl, $1
  printf "  <updated>%s</updated>\n", $4
  printf "  <content type=\"html\">\n"

  # summary only
  #printf "    %s\n", $3

  # full text -- also converting relative Markdown links to absolute
  printf "    <![CDATA["
#  system("./tools/Markdown_1.0.1/Markdown.pl content" orig " | sed -e 's#href=\"/#href=\"" fqbase "/#g'") |& getline
  system("./tools/Markdown_1.0.1/Markdown.pl content" orig " | sed -e 's#href=\"/#href=\"" fqbase "/#g'") 
  printf "    ]]>\n"

  printf "  </content>\n"
  printf "</entry>\n\n"

}

END {
  print "</feed>"
}
