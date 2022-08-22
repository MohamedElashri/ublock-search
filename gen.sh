#!/bin/bash

IFS=$'\n'

## Google Search block rules
FILTER_TEMPLATE[1]='google.*##.rc:has(a[href*="@@@/"])'
FILTER_TEMPLATE[2]='google.*##.nrgt:has(a[href*="@@@/"])'
FILTER_TEMPLATE[3]='google.*##.xpd.uUPGi:has(a[href*="@@@/"])'
FILTER_TEMPLATE[4]='google.*##.g:has(a[href*="@@@/"])'

#DuckDuckGo Search block rules
FILTER_TEMPLATE[5]='duckduckgo.com##.result[data-domain$="@@@"]'
FILTER_TEMPLATE[6]='duckduckgo.com##.web-result:has(a[href*="@@@/"])'


DIR="lists"
HEADER="head.txt"
DOMAINS_LIST="domains/domain_list.txt"
LIST="list.txt"
sort -o $DOMAINS_LIST $DOMAINS_LIST

# If file $DIR/$LIST  exist, remove it
if [ -f $DIR/$LIST ]; then
    rm $DIR/$LIST
fi


for line in $(cat $DOMAINS_LIST|tr -d '\r')
do
	if [ ! `echo $line|cut -c1` = "!" ]; then
		for filter in "${FILTER_TEMPLATE[@]}"
		do
			echo $filter|sed "s|@@@|$line|g" >> $DIR/$LIST
		done
	fi
done
