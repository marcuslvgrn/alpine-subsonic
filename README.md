# docker-subsonic
Docker container for subsonic with mysql backend

mysql:<br>
<code>

</code>

subsonic:<br>
<code>
version: '3.1'<br>
<br>
services:<br>
<br>
  subsonic:<br>
    image: lovgren/subsonic:latest<br>
    container_name: subsonic<br>
    ports:<br>
      - "4040:4040"<br>
      - "4043:4043"<br>
    volumes:<br>
      - /path/to/music:/var/music:ro<br>
      - subsonic-db:/subsonic<br>
      - subsonic-playlists:/playlists<br>
      - subsonic-podcasts:/podcasts<br>
      - subsonic-var:/var/subsonic<br>
    external_links:<br>
      - db:db<br>
    networks:<br>
      - mysql_db-net<br>
    environment:<br>
      SUBSONIC_JDBC: "jdbc:mysql://db:3306/subsonic?user=root&password="my secret password"&characterEncoding=UTF-8"<br>
    restart: always<br>
<br>
volumes:<br>
  subsonic-db:<br> 
  subsonic-playlists:<br> 
  subsonic-podcasts: <br>
  subsonic-var:<br>
<br>
networks:<br>
  "mhysql stack name"_db-net:<br>
    external: true<br>
</code>
