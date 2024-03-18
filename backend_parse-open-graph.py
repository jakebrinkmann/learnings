#!/usr/bin/env python3
import urllib.request
from urllib.parse import urlparse
from html.parser import HTMLParser

url = "https://blog.bitsrc.io/building-microfrontends-using-single-spa-framework-94019ca2fb4d"
headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64)'}
request = urllib.request.Request(url, None, headers)

with urllib.request.urlopen(request) as response:
    html = response.read().decode()

META_TAGS = [
    # "og:type",
    "og:title",
    "og:description",
    # "og:url",
    # "article:published_time",
]

# Usually, would use bs4/BeautifulSoup to make this easy
# but, I want to explore the python stdlib right now
#     < 10 minutes later >
# wow, this isn't very helpful
class LinksParser(HTMLParser):
  def __init__(self):
    super().__init__()
    self.data = dict()

  def handle_starttag(self, tag, attrs):
    if tag != 'meta':
      return

    attrs = dict(attrs)
    if 'property' in attrs and attrs['property'] in META_TAGS:
        self.data[attrs['property']] = attrs['content']

parser = LinksParser()
parser.feed(html)

print(parser.data)
