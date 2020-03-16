# Idena Manager

If this idena-manager is helping you, please donate to ***0x5debe0ac6cb3f40b08133b1e2d7cb11c83b06005***

## Description
This script is made to manage your node instances on VPS servers. Currently only Debian distributions are
  supported. Script is tested on Ubuntu 16.04 and 18.04 only

## Features
 - Easily install and add your node instances
 - Automatic update of all node instances on the server (only if validation is not in progress)
 - In case of node error, automatically starts node instances
 - Ability to migrate existing instances to new servers
 - Disable or enable your node instances
 - Set or disable email notifications when something goes wrong with one or more instances
 - Support for multiple instances per server
 - Easily transfer your current instances onto the server
 - View all the instances you have installed and their run time and status

# Instructions

We recommend to run whole script as root user, but it's not a requirement. Script will ask you for your root password
 only to install necessary dependencies.

## Install script (run this only once)
 - Go to directory you'd like to keep idena manager (you can skip this)
 - `wget -O idena-manager "https://gitlab.com/crackowich/idena-manager/-/raw/master/idena-manager"`
 - `chmod +x idena-manager`
 - `./idena-manager set-path`
 - `export PATH=$PATH:$(pwd)`

## Commands
 - To add new idena node, run: `idena-manager add` (see advanced options [here](#the-add-command))
 - To view status of your nodes, run: `idena-manager status` (see detailed [here](#the-status-command))
 - To turn **off** your all nodes, run: `idena-manager disable` (see detailed [here](#the-disable-command))
 - To turn **on** your all nodes, run: `idena-manager enable` (see detailed [here](#the-enable-command))
 - Turn *on* email notifications: `idena-manager set-notifications "j.snow@castle.black` (see detailed [here](#setting-or-disabling-email-notifications))
 - Turn *off* email notifications: `idena-manager disable-notifications` (see detailed [here](#setting-or-disabling-email-notifications))
 - Accessing help, run: `idena-manager`

# Advanced usage
Here you'll be able to find a little bit more details about each command idena-manager supports

## The *add* command
### Most used combinations
 - Fresh installation where you want everything to be decided by the script
   - Run `idena-manager add -l nodes -k "" -w ""` and the script won't ask you any questions except
  for your root
  password to install some dependencies, and only in case you already don't have another node installation on this
   server.
 - Fresh installation with email notifications
   - Run `idena-manager add -l nodes -k "" -w "" -e "j.snow@castle.black` - replace **j.snow@castle.black** with your
    email
 - Fresh installation with email notifications and defined API key
   - Run `idena-manager add -l nodes -k "my_api_key" -w "" -e "j.snow@castle.black"` - replace **my_api_key** with your
  key and **j.snow@castle.black** with your email
 - Fresh installation with email notifications and defined API key
   - Run `idena-manager add -l nodes -k "my_api_key" -w "yourexistingnodekey" -e "j.snow@castle.black"` - replace
    **my_api_key** with your key, **j.snow@castle.black** with your email, and **yourexistingnodekey** with your existing
     wallet (node) key, if you already have one. You can find it in your current installation under **datadir/keystore/nodekey**
     
### Parameters you can use (but you don't have to)
idena-manager supports multiple parameters so it could automatically do everything for you, all at once

 - `idena-manager add -l location` - replace **location** with path where you'd like to install your node instance. If
  you'd like to install to the current directory where you're at, just run `idena-manager add -l ""`. If you'd like
   to install it to sub-folder called "nodes" for example, just run `idena-manager add -l nodes`. You can enter either
    relative or absolute path.
 - `idena-manager add -e email` - Set email address where you'd like to receive error emails for any of your node
  instances. For example: `idena-manager add -e "j.snow@castle.black"`
 - `idena-manager add -k api_key` - Replace **api_key** with API key you want to use. For example: `idena-manager add
  -k "myapikey1"`. If you want the script to generate API key for you, just send empty string there: `idena-manager
   add -k ""`. If you don't specify this parameter, script will ask you to enter your desired API key.
 - `idena-manager add -w wallet_key` - Replace **wallet_key** with your wallet key (node key) if you're transferring
  your existing node to this script/server. Example: `idena-manager add -w "thisismyrandomstring"`. We do not
   recommend usage of this parameter, however script does offer it. If you don't specify this parameter, script will
    ask you for your key, if you have it. If you enter `idena-manager add -w ""`, it will assume that you're doing a
     new installation and will let node to choose a key for you.
 - `idena-manager add -p port_num` - Replace **port_num** with the port you want to use. Default one is 40404. You need
  to allow this port for inbound connections on your firewall (if you're using one, and we do recommend for you to
   use it)
 - `idena-manager add -r port_num` - Replace **port_num** with your RPC port. This port is used for you to connect to
  your node from idena client

## The *status* command
 - Run: `idena-manager status` - output looks like:
![Idena Manager Status Screenshot](https://lh3.googleusercontent.com/Tn7VrkKnNwaryplCrGKgsYnf2tooN4hj0p_N7Y0cyf-FHOAvgLgWVn9AEgIxGWEzhYQg4S9AgVfrTruhtmtVwFUKvGfOL6AKyHzH6kx0O2D1Z3DU0nd8AZRDYe-Bq9yPKC26po3AyqXGx0gKnwT08RpOxL9_h3EFVBydlt3k3_O2DJKb7aM0RodsIFi9w9xI-H3XfkrwLT1wynqprnMhzMVv33wFhPRaYJVVMHKOk9soWelh4wROCdcQJxYhCV7SvwZQEOFz8XTnKcHtpecdfXuoVx9iM6FvhMXInEufC6M7YARqc12UKfiwCL9y751x7DzYtXBeLpkuJXWFGmFtIjFouucTsAg2vKci7UKwHVI92_OwGB9fmxdMupbF-JLGOJrSSp-VR6fOZprrQl-Kn3K4MXCRxoeID9FSqCB4fkTXO3NeHOngKTkauArMCw9QvU49iTgIpvBWop70oY4Qfj1LegEV07rUOjUfIaGckYKs3mW0Hiu18nfVX7QmrRy51ChLw0ebAeD_dI-6_job-C7m26av_0or5yToRki5zBXE2PelTxOnhGzj8alNkldnQrYqsgRSR7MlTxI_cd6tMS8ZYRY-RYvshHvLpWXdUk_avAoX490YBiqjBpR6ozkR4f4VBEco9YBUR0bscpBDkHa_3NlLz4KbbPkbO-itWlB3qC9gWkAcMzaQNy2By03eONt84Q=w2880-h896-ft)

## Disabling and enabling your node instances
You can temporary, or forever, disable your node instances, but you can enable them afterwards.

### The *enable* command
 - Run: `idena-manager enable num` - Replace **num** with your node instance number. First node you added is numbered
  as `1`, the second is `2`, and so on. For example, to enable your first node instance, type: `idena-manager enable 1`.
 - If you want to enable all your node instances, type: `idena-manager enable`

### The *disable* command
 - Run: `idena-manager disable num` - Replace **num** with your node instance number. First node you added is numbered
  as `1`, the second is `2`, and so on. For example, to disable your first node instance type: `idena-manager disable
   1`.
 - Please be careful because **num** parameter is not required parameter. If you run only `idena-manager disable
 `, script is going to disable all your node instances you have on that server.

## Setting or disabling email notifications
You can set or disable email notifications before or after your node setup.

### Turning on email notifications
 - Turning **on** notifications: `idena-manager set-notifications email` - replace *email* with your email where you'd
  like to send emails to. For example: `idena-manager set-notifications "j.snow@castle.black"`
 - After you turn on your notifications, you'll get status where you'll be told from which email notifications are
  going to be sent, so you should consider creating some kind of automatic filter for those emails so they don't end
   up in your spam folder

### Turning off email notifications
 - Turning **off** notifications: `idena-manager disable-notifications`

## Installing dependencies
 - If you only want to install dependencies, before you start adding your nodes, you can run `idena-manager install`

# Future development
 - [ ] Ability to control multiple VPSs from one instance
 - [ ] Building and integrating Idena Client so it could be run directly from web browser