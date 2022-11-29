#!/usr/bin/python3
"""This module makes a request to the reddit api"""
import requests


def number_of_subscribers(subreddit):
    """gets number of subscribers of a subreddit"""
    headers = {
            'User-Agent': 'My User Agent 1.0',
    }
    try:
        res = requests.get('https://www.reddit.com/r/'+subreddit
                           + '/about.json', headers=headers)
    except Exception:
        return (0)
    subreddit_data = res.json()
    return(subreddit_data['data']['subscribers'])
