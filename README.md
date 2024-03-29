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
