# docker-subsonic
Docker container for the subsonic music streamer with mysql backend.<br>
I have split this into two docker-compose files since I am using the mysql stack for other containers also. They could also be started from the same file, but without the external network then.<br>
Note that the mysql docker stack name and mysql password needs to be replaced in the text below.<br>
mysql docker-compose.yml:
<pre>
version: '3.1'

services:

  db:
    image: mysql:5.6
    container_name: db
    volumes:
      - db-mysql:/var/lib/mysql
    networks:
      - db-net
    environment:
      MYSQL_ROOT_PASSWORD: "my secret mysql password"
    restart: always

  dbadmin:
    image: phpmyadmin/phpmyadmin
    container_name: dbadmin
    links:
      - db:db
    restart: always
    ports:
     - 8000:80
    volumes:
     - dbadmin-sessions:/sessions
    networks:
      - db-net

volumes:
  db-mysql:
  dbadmin-sessions:

networks:
  db-net:
</pre>


subsonic docker-compose.yml:
<pre>
version: '3.1'

services:

  subsonic:
    image: lovgren/subsonic:latest
    container_name: subsonic
    ports:
      - "4040:4040"
      - "4043:4043"
    volumes:
      - /path/to/music:/var/music:ro
      - subsonic-db:/subsonic
      - subsonic-playlists:/playlists
      - subsonic-podcasts:/podcasts
      - subsonic-var:/var/subsonic
    external_links:
      - db:db
    networks:
      - mysql_db-net
    environment:
      SUBSONIC_JDBC: "jdbc:"mysql stack name"://db:3306/subsonic?user=root&password="my secret mysql password"&characterEncoding=UTF-8"
    restart: always

volumes:
  subsonic-db: 
  subsonic-playlists: 
  subsonic-podcasts: 
  subsonic-var: 

networks:
  "mysql stack name"_db-net:
    external: true
</pre>
