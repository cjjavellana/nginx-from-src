# nginx
Nginx (pronounced "engine-x") is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and IMAP protocols, as well as a load balancer, HTTP cache, and a web server (origin server). The nginx project started with a strong focus on high concurrency, high performance and low memory usage. It is licensed under the 2-clause BSD-like license and it runs on Linux, BSD variants, Mac OS X, Solaris, AIX, HP-UX, as well as on other *nix flavors. It also has a proof of concept port for Microsoft Windows.

## Purpose
There are deployment environments where images from the public docker repository are not allowed. With that, compilation from source is the only option. This project provides just that - A template for compiling nginx from source

## Building
```bash
$ docker build -t nginx:latest .
```


