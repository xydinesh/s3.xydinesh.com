---
layout: post
title: "Nibiru command line client - Bluejay"
date: 2016-07-22 00:04:40 -0600
categories: nibiru client
---

‘bluejay’ is a command line client to work with production nibiru interface.

## Installation
Install the latest bluejay from pypi using following command

	pip install bluejay2


Then create `nibiru.ini` file in current directory or `~/.bluejay` directory as follows.

	[default]
	token=‘xxxx-xxxx-xxx-xx’
	team='https://nibiru-prod.prsn.us/api/teams/48'

	[48]
	token=‘xxx-xxx-xxx’
	team='https://nibiru-prod.prsn.us/api/teams/48'

	[zz]
	token=‘xxxx-xxx-xxx-xx’
	team='https://nibiru-prod.prsn.us/api/teams/zz'
	
## Commands

#### Get instances, deployed from nibiru

	bluejay get 

Get instances belong to different team

	bluejay --profile=48 get

#### Get more information about an insane

	bluejay get -i <insance id>
	bluejay get -i <insance id> --detailed
	bluejay get -n <ip address>

#### Delete instance
	bluejay delete -i <insance id>

#### Update an instance
	bluejay update -i <insance id> -s <new size>
	bluejay update -i <insance id> -t ‘create-for:testing’

#### Create an instance
	bluejay create -e ‘dev’ --app-name ‘bluejayapp’ --tags 'created_for:testing'

#### Get help on any command
	bluejay <command> --help

Example:

	bluejay create --help
	Usage: bluejay create [OPTIONS]

	Options:
	  -e, --env TEXT                Select envrionment for deployment
	  -l, --location TEXT           Region to deploy
	  -c, --instance-count INTEGER  Number of instances to deploy
	  -s, --instance-size TEXT      Size of the instance
	  --app-name TEXT               Name of the application  [required]
	  --app-version TEXT            Version of the application
	  --public                      Deploy to public network
	  --aws                         Specify provider for deployment
	  --tags TEXT                   Tags for application  [required]
	  --help                        Show this message and exit.
