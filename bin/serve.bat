docker run --rm --name mhdb-docs -p 4567:4567 ^
    -v %~dp0\..\source:/srv/slate/source ^
    -v %~dp0\..\lib:/srv/slate/lib ^
    --mount type=bind,src=%~dp0\..\config.rb,dst=/srv/slate/config.rb ^
    slatedocs/slate serve