# Nginx 

*Test Nginx Configuration*

```
[sudo] nginx -t
```

Logging Formats

```
log_format timed_combined '$remote_addr - $remote_user [$time_local] '
  '"$request" $status $body_bytes_sent '
  '"$http_referer" "$http_user_agent" '
  '$request_time $upstream_response_time $pipe';

access_log /var/log/nginx/access_log.log timed_combined;
```

- `nginx.conf` - the primary configuration
- `conf.d` - used for things like modules loading and for things that are not sp
ecific to a single virtual host
- `sites-available` - storing _all_ virtual host configurations, even if they're 
currently not enabled
- `sites-enabled` - all the sites that are enabled (symlinks to files in the sites
available folder).
- `mime.types` - maps filename extension to MIMIE types of responses

### Reloading Nginx

The process ID of the master Nginx process is written to a file defined by the 
pid directive, eg `pid /var/run/nginx.pid;` The master process supports the following
signals

TERM, INT | Quick Shutdown 
---  | ---
QUIT | Graceful Shutdown 
HUP | Reload config + Workers graceful shutdown + restart
USR1 | Re-open log files
USR2 | Upgrade executable on fly
WINCH | Graceful shutdown of worker processes

In order to reload Nginx, you can run `kill -HUP <PID nginx master proc>`.

### Auto-Indexing Directory

```
location / {
  root /var/www/localdropbox;
  autoindex on;
  # Enables or disables the directory listing output.

  autoindex_exact_size off;
  # Exact file size vs rounding them to nearest KB, MB, GB.

  autoindex_format html;
  # format of a directory listing. XML, JSON, JSONP possible.

  autoindex_localtime on;
  # local TZ vs UTC.
}

```


[Customizing Nginx Web Logs](http://articles.slicehost.com/2010/8/27/customizing-nginx-web-logs);

## Links

- [NetTuts - Nginx Guide: Introduction](http://code.tutsplus.com/articles/nginx-guide-introduction--cms-21877)
- [NetTuts - Nginx Guide: Essentials](http://code.tutsplus.com/articles/nginx-guide-essentials--cms-22880)
- [Tracking Application Response Time with Nginx](https://lincolnloop.com/blog/tracking-application-response-time-nginx/)
- [Working with Nginx](http://code.tutsplus.com/tutorials/working-with-nginx--cms-23764)
