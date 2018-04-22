# nginx
Nginx (pronounced "engine-x") is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and IMAP protocols, as well as a load balancer, HTTP cache, and a web server (origin server). The nginx project started with a strong focus on high concurrency, high performance and low memory usage. It is licensed under the 2-clause BSD-like license and it runs on Linux, BSD variants, Mac OS X, Solaris, AIX, HP-UX, as well as on other *nix flavors. It also has a proof of concept port for Microsoft Windows.

## Purpose
There are deployment environments where images from the public docker repository are not allowed. With that, compilation from source is the only option. This project provides just that - A template for compiling nginx from source

## Building
```bash
$ docker build -t nginx:latest .
```

## Testing
```bash
$ docker run -d -i -p 80:80 -t nginx:latest
$ curl -v http://localhost

* About to connect() to localhost port 80 (#0)
*   Trying 127.0.0.1...
* Connected to localhost (127.0.0.1) port 80 (#0)
> GET / HTTP/1.1
> User-Agent: curl/7.29.0
> Host: localhost
> Accept: */*
>
< HTTP/1.1 200 OK
< Server: nginx/1.10.2
< Date: Sun, 22 Apr 2018 09:24:56 GMT
< Content-Type: text/html
< Content-Length: 612
< Last-Modified: Wed, 11 Jan 2017 15:26:10 GMT
< Connection: keep-alive
< ETag: "58764e92-264"
< Accept-Ranges: bytes
<
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
* Connection #0 to host localhost left intact
```



