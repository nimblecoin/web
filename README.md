<<<<<<< HEAD
=======
Description [ ![Codeship Status for TheSerapher/php-mpos](https://www.codeship.io/projects/40fa7600-61a6-0131-3fd3-367b94dc0d60/status?branch=next)](https://www.codeship.io/projects/12276)
===========

MPOS is a web based Mining Portal for various crypto currencies. It was created by [TheSerapher](https://github.com/TheSerapher) and has hence grown quite large. Recently it was migrated into a Github Organization to make development easier. It's a community driven open source project. Support can be requested on IRC at https://webchat.freenode.net/?channels=#mpos


**NOTE**: This project is still under development and commits are happening on a daily basis.
I do not recommend using this for a live setup as of yet. Wait for the later Release Candidate
if you wish to run your pool with it. Testing pools are much appreciated though!

Donations
=========

Donations to this project are going directly to [TheSerapher](https://github.com/TheSerapher), the original author of this project:

* LTC address: `Lge95QR2frp9y1wJufjUPCycVsg5gLJPW8`
* BTC address: `1HuYK6WPU8o3yWCrAaADDZPRpL5QiXitfv`
* DOGE Address: `D6YtvxFGBmaD8Yq3i8LZsBQVPvCbZwCDzF`
* Cryptsy Trade Key: `6ff7292142463b7b80cbbbdfc52334ba89727b11`

Website Footer
==============

When you decide to use `MPOS` please be so kind and leave the footer intact. You are not the author of the software and should honor those that have worked on it. I don't mind changing the LTC donation address at the bottom, but keep in mind who really wrote this software and would deserve those ;-).

Donors
======

These people have supported this project with a donation:

* [obigal](https://github.com/obigal)
* [vias](https://github.com/vias79)
* [WKNiGHT](https://github.com/WKNiGHT-)
* [ZC](https://github.com/zccopwrx)
* Nutnut
* Caberhagen (http://litecoin-pool.ch)
* Mining4All (https://www.mining4all.eu/)
* [xisi](https://github.com/xisi)
* [PCFiL](https://github.com/PCFiL)
* [rog1121](https://github.com/rog1121)(https://rapidhash.net)
* [Wow, Much Pool](http://www.wowmuchpool.com/)
* webxassDE (https://www.suchcoins.com/)

Pools running MPOS
==================

You can find a list of active pools [here](https://github.com/TheSerapher/php-mpos/wiki/Pools).

>>>>>>> 82a648f1c47254363154f5a079a3f854f03e6b07
Requirements
============

This setup has been tested on Ubuntu 12.04, Ubuntu 13.04 and CentOS.
It should also work on any related distribution (RHEL, Debian).

* 64-bit system
 * Otherwise some coins will display wrong network hashrates
* Apache2
 * libapache2-mod-php5
* PHP 5.4+
 * php5-json
 * php5-mysqlnd
 * php5-memcached
 * php5-curl
* MySQL Server
 * mysql-server
* memcached
* stratum-mining
* dogecoind


Setup
============

* Fork the repo.
* Copy `public/include/config/global.inc.dist.php` to a new `global.inc.php`.
* Edit the config with your own set up or use the Dev Config details below.


Dev Config
=============

Dev Webserver (Contact veroz if you would like to test your branch here)

[http://bidoof.nimblecoin.us](http://bidoof.nimblecoin.us)

Dev Database

    $config['db']['host'] = 'db.nimblecoin.us';
    $config['db']['user'] = 'nimblecoin_dev';
    $config['db']['pass'] = 'q7fzhYzyGYWJKXGj';
    $config['db']['port'] = 3306;
    $config['db']['name'] = 'nimblecoin_dev';

Dev Dogecoind (Testnet)

    $config['wallet']['type'] = 'http';
    $config['wallet']['host'] = 'bidoof.nimblecoin.us:44555';
    $config['wallet']['username'] = 'dogecoinrpc';
    $config['wallet']['password'] = '34gC49MCmp5WN17WC5y5sy32jdc8jiGiYq8WZSud5zfTT';

Dev Stratum (Testnet)

    stratum-tcp://bidoof.nimblecoin.us:3333


Contributing
============

You can contribute to this project in different ways:

* Ideas, bugs, and enhancements should be logged in the [public facing issue tracker](https://github.com/nimblecoin/server/issues?state=open).
* Internal discussions should use the [private issue tracker](https://github.com/nimblecoin/web/issues).
* Fork the project, create a branch, and file a pull request.


License and Author
==================

Copyright 2014, Andy Mai

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
