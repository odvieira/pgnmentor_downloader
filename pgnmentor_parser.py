#! /usr/bin/env pyhton3

# %%

import requests
from bs4 import BeautifulSoup

# %%

parsed = BeautifulSoup(
    requests.get("https://www.pgnmentor.com/files.html").content,
    features='lxml'
    )

root_url = "https://www.pgnmentor.com/"

# %%
links = []

for link in parsed.findAll('a', text="Download"):
    if link['href'].endswith('.zip'):
        links.append(root_url + link['href'] + '\n')

# %%

with open('urls.txt', 'w+') as out:
    out.writelines(links)

# %%