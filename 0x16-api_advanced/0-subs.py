#!/usr/bin/python3
"""This module makes a request to the reddit api"""
import requests


def number_of_subscribers(subreddit):
    """gets number of subscribers of a subreddit"""
    headers = {
            'User-Agent': 'My User Agent 1.0',
    }
    res = requests.get('https://www.reddit.com/r/'+subreddit
                       + '/about.json', headers=headers, allow_redirects=False)
    subreddit_data = res.json()
    if 'error' in subreddit_data.keys():
        return (0)
    return(subreddit_data['data']['subscribers'])
