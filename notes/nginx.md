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

[Customizing Nginx Web Logs](http://articles.slicehost.com/2010/8/27/customizing-nginx-web-logs);

## Links

- [NetTuts - Nginx Guide: Introduction](http://code.tutsplus.com/articles/nginx-guide-introduction--cms-21877)
- [NetTuts - Nginx Guide: Essentials](http://code.tutsplus.com/articles/nginx-guide-essentials--cms-22880)
- [Tracking Application Response Time with Nginx](https://lincolnloop.com/blog/tracking-application-response-time-nginx/)