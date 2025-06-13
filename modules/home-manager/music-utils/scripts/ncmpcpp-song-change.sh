#!/bin/sh -e

# This script is run every time ncmpcpp registers a song change.

# Dump now playing to a text file for other programs to read
printf "%s" "$(mpc current --format '%artist% - %title%    ·')    " \
    >"${XDG_CACHE_HOME:-~/.cache}/ncmpcpp-now-playing.txt"
printf "%s" "$(mpc current --format '%title%    ·')    " \
    >"${XDG_CACHE_HOME:-~/.cache}/ncmpcpp-now-playing-title.txt"
printf "%s" "$(mpc current --format '%artist%    ·')    " \
    >"${XDG_CACHE_HOME:-~/.cache}/ncmpcpp-now-playing-artist.txt"
printf "%s" "$(mpc current --format '%album%    ·')    " \
    >"${XDG_CACHE_HOME:-~/.cache}/ncmpcpp-now-playing-album.txt"

# SET ALBUM COVER AS WALLPAPER
if [ -n "$NCMPCPP_SWITCH_WALLPAPER" ]; then
    cachefile="${XDG_CACHE_HOME:-~/.cache}/ncmpcpp-albumart.jpg"
    mpdfpath="$(mpc current --format %file%)"
    mpc readpicture "$mpdfpath" >"$cachefile"

    if [ -n "$NCMPCPP_FANCY_TRANSITIONS" ]; then
        # Fancy transition effect (eats some CPU)
        t_fps=$(($(wlr-randr --json | jq '.[0].modes.[] | select(.current==true).refresh | round')))
        t_effect="$(printf '%s\n' simple wipe any | shuf | head -n1)"
        t_angle=$(($(seq 360 | shuf | head -n1)))
    else
        t_fps=1
        t_effect=none
        t_angle=0
    fi

    if file -- "$cachefile" | grep -qi 'image'; then
        tmp="$(mktemp)"
        h=$(magick "$cachefile" -format '%h' info:)
        newh="$(echo "scale=0; $h * 1.1 / 1" | bc)"
        magick "$cachefile" +write mpr:ORIG \
            \( \
                mpr:ORIG -resize 320x180^ -filter Gaussian -blur 0x4 \
                -gravity Center -crop 320x180+0+0 \
                -resize 1920x"$newh" +write mpr:BLUR \
            \) \
            \( \
                mpr:BLUR mpr:ORIG -gravity center -composite \
                +write "$tmp" \
            \) null:

        set +e
        swww img -t "$t_effect" --transition-fps $t_fps --transition-angle $t_angle "$tmp"
        set -e
        rm -f -- "$tmp"
    else
        rm -f -- "$cachefile"
        set +e
        swww img -t "$t_effect" --transition-fps $t_fps --transition-angle $t_angle "$tmp"
        swww img "${XDG_CONFIG_HOME:-~/.config}/wallpaper"
        set -e
    fi
fi


# KEEP TRACK OF PER-SONG PLAY COUNT AND HISTORY
# A track is only considered if it plays for at least 50% of its duration.
if [ -n "$NCMPCPP_KEEP_PLAYCOUNT" ] || [ -n "$NCMPCPP_KEEP_HISTORY" ]; then
    data="$(mpc current --format %file%%time%)"
    file="${data%*}"
    time="${data#*}"

    # Convert time to seconds
    seconds=0
    multi=1
    while [ -n "$time" ]; do
        num="$(echo "$time" | sed 's/.*:0*//')"
        seconds=$(( seconds + (multi * num) ))
        _time="${time%:*}"
        [ "$time" != "$_time" ] && time="$_time" || time=
        multi=$(( multi * 60 ))
    done

    # If the song changes in less than 50% of the duration, do nothing
    (
        # Kill the last subshell
        pidfile="${TMPDIR:-/tmp}/ncmpcpp-playcount.$(whoami).pid"
        [ -s "$pidfile" ] && { kill "$(cat -- "$pidfile")" || true; }
        sh -c "echo \$PPID >'$pidfile'"

        sleep $(( seconds / 2 ))
        [ "$(mpc current --format %file%)" != "$file" ] && exit

        [ -n "$NCMPCPP_KEEP_PLAYCOUNT" ] && plrare bump "$HOME/Music/$file"
        [ -n "$NCMPCPP_KEEP_HISTORY" ] && {
            mkdir -p -- ~/Music/Playlists
            host="$(cat /etc/hostname)"
            sed -i "1i$file" "$HOME/Music/Playlists/hist.$host.m3u"
        }
    ) &
fi
