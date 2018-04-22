FROM centos:7

USER root

ADD openssl-1.1.0h.tar.gz /tmp
ADD nginx-1.14.0.tar.gz /tmp
ADD pcre-8.41.tar.gz /tmp
ADD zlib-1.2.11.tar.gz /tmp
ADD epel-release-latest-7.noarch.rpm /app/usr/epel-release/epel-release-latest-7.noarch.rpm

# Compile Openssl & Nginx Separately to speed up
# build process when needing to change nginx

RUN yum group install -y "Development Tools" && \
	yum install -y perl 

RUN mkdir -p /app/usr/nginx-1.14.0 && \
	# Compile PCRE
	cd /tmp/pcre-8.41 && sh configure && make && make install && \
	# Compile Zlib
	cd /tmp/zlib-1.2.11 && sh configure && make && make install && \
	# Compile Nginx
	cd /tmp/nginx-1.14.0 && \
	sh configure --prefix=/app/usr/nginx-1.14.0 \
		--with-ld-opt="-Wl,-z,relro -Wl,--as-needed" \
		--sbin-path=/usr/sbin/nginx \
		--conf-path=/etc/nginx/nginx.conf \
		--error-log-path=/var/log/nginx/error.log \
		--http-log-path=/var/log/nginx/access.log \
		--pid-path=/var/run/nginx.pid \
		--lock-path=/var/run/nginx.lock \
		--http-client-body-temp-path=/var/cache/nginx/client_temp \
		--http-proxy-temp-path=/var/cache/nginx/proxy_temp \
		--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
		--http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
		--http-scgi-temp-path=/var/cache/nginx/scgi_temp \
		--user=www-data \
		--group=www-data \
		--with-pcre=../pcre-8.41 \
		--with-zlib=../zlib-1.2.11 \
		--with-http_ssl_module \
		--with-http_realip_module \
		--with-http_addition_module \
		--with-http_sub_module \
		--with-http_dav_module \
		--with-http_flv_module \
		--with-http_mp4_module \
		--with-http_gunzip_module \
		--with-http_gzip_static_module \
		--with-http_random_index_module \
		--with-http_secure_link_module \
		--with-http_stub_status_module \
		--with-mail \
		--with-mail_ssl_module \
		--with-file-aio \
		--with-http_v2_module \
		--with-cc-opt='-g -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2' \
		--with-debug \
		--with-openssl=../openssl-1.1.0h && \
	make && make install

#CMD ["nginx", "-g", "daemon off;"]

