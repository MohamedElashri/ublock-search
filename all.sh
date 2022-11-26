#!/usr/bin/env bash

# create filter metadata
echo '! Title: Search filter' > 'search-filter.txt'
echo '! Description: ublock origin filter to remove low quality website from search engines' >> 'search-filter.txt'
echo 'Expires: 7 days' >> 'search-filter.txt'


# Create the filter for all websites in domain_list.txt file
grep -Ev '^(!|\s)|^$' domains/domain_list.txt | tr -d '\r' | while read -r line; do
  echo "google.*##.g:has(a[href*=\"$line\"])" >>'search-filter.txt'    # Google
  echo "bing.*##.b_algo:has(a[href*=\"$line\"])" >>'search-filter.txt' # Bing
  echo "yahoo.*##li:has(a[href*=\"$line\"])" >>'search-filter.txt'     # Yahoo
  echo "duckduckgo.*##[data-domain*=\"$line\"]" >>'search-filter.txt'  # DuckDuckGo
  echo "searx.melashri.me##:xpath(//div[contains(@class, 'result')]/div[contains(@class, 'external-link')][contains(., '\"$line\"')]/..)]" >>'search-filter.txt'  # Searx 
  echo "searx.elashri.xyz##:xpath(//div[contains(@class, 'result')]/div[contains(@class, 'external-link')][contains(., '\"$line\"')]/..)]" >>'search-filter.txt'  # Searx
  # collect each search engine lines together
  echo "google.*##.g:has(a[href*=\"$line\"])" >>'google-filter.txt'
  echo "bing.*##.b_algo:has(a[href*=\"$line\"])" >>'bing-filter.txt'
  echo "yahoo.*##li:has(a[href*=\"$line\"])" >>'yahoo-filter.txt'
  echo "duckduckgo.*##[data-domain*=\"$line\"]" >>'duckduckgo-filter.txt'
  echo "searx.melashri.me##:xpath(//div[contains(@class, 'result')]/div[contains(@class, 'external-link')][contains(., '\"$line\"')]/..)]" >>'searx-filter.txt'
  echo "searx.elashri.xyz##:xpath(//div[contains(@class, 'result')]/div[contains(@class, 'external-link')][contains(., '\"$line\"')]/..)]" >>'searx-filter.txt'
done


  

