#!/usr/bin/ruby

require 'net/http'

payload = %Q{ {
    "pusher": {
        "name": "gabriel-dehan",
        "email": "dehan.gabriel@gmail.com"
    },
    "repository": {
        "name": "testHook",
        "size": 116,
        "created_at": "2012-10-12T14:34:04-07:00",
        "has_wiki": true,
        "watchers": 0,
        "private": false,
        "url": "https://github.com/gabriel-dehan/testHook",
        "fork": false,
        "id": 6196668,
        "pushed_at": "2012-10-14T10:16:01-07:00",
        "has_downloads": true,
        "open_issues": 0,
        "has_issues": true,
        "stargazers": 0,
        "forks": 0,
        "description": "",
        "owner": {
            "name": "gabriel-dehan",
            "email": "dehan.gabriel@gmail.com"
        }
    },
    "forced": false,
    "head_commit": {
        "modified": [],
        "added": [
            "test.rb"
        ],
        "timestamp": "2012-10-14T10:15:35-07:00",
        "author": {
            "name": "gabriel-dehan",
            "username": "gabriel-dehan",
            "email": "dehan.gabriel@gmail.com"
        },
        "removed": [],
        "url": "https://github.com/gabriel-dehan/testHook/commit/fd34319c22578ff7e8a77323fe4273aff97254dd",
        "id": "fd34319c22578ff7e8a77323fe4273aff97254dd",
        "distinct": true,
        "message": "Test",
        "committer": {
            "name": "gabriel-dehan",
            "username": "gabriel-dehan",
            "email": "dehan.gabriel@gmail.com"
        }
    },
    "after": "fd34319c22578ff7e8a77323fe4273aff97254dd",
    "deleted": false,
    "ref": "refs/heads/master",
    "commits": [
        {
            "modified": [],
            "added": [
                "test.rb"
            ],
            "timestamp": "2012-10-14T10:15:35-07:00",
            "author": {
                "name": "gabriel-dehan",
                "username": "gabriel-dehan",
                "email": "dehan.gabriel@gmail.com"
            },
            "removed": [],
            "url": "https://github.com/gabriel-dehan/testHook/commit/fd34319c22578ff7e8a77323fe4273aff97254dd",
            "id": "fd34319c22578ff7e8a77323fe4273aff97254dd",
            "distinct": true,
            "message": "Test",
            "committer": {
                "name": "gabriel-dehan",
                "username": "gabriel-dehan",
                "email": "dehan.gabriel@gmail.com"
            }
        }
    ],
    "before": "fa2c2131e8730ff3e424bc4f46b19d0e9cf76491",
    "compare": "https://github.com/gabriel-dehan/testHook/compare/fa2c2131e873...fd34319c2257",
    "created": false
} }

url     = URI.parse('http://localhost:9292/')

request = Net::HTTP::Post.new(url.path)
request.set_form_data({ 'payload' => payload })

response = Net::HTTP.new(url.host, url.port).start {|http| http.request(request) }

puts response
