{ config, pkgs, ... }: {
  home.packages = with pkgs; [vdirsyncer];

  # The webdav server is behind an nginx reverse proxy, which serves
  # as authentication. So no need for secret user/password.
  xdg.configFile."vdirsyncer/config".text = ''
    [general]
    status_path = "${config.xdg.dataHome}/vdirsyncer/status"

    [storage my_contacts_local]
    type = "filesystem"
    path = "${config.xdg.dataHome}/contacts/"
    fileext = ".vcf"

    [storage my_contacts_remote]
    type = "carddav"
    url = "https://carddav.pcache.dev"
    username = "pcache"
    password.fetch = ["shell", "pass misc/radicale | head -n1"]

    [pair my_contacts]
    a = "my_contacts_remote"
    b = "my_contacts_local"
    collections = ["from a", "from b"]
    metadata = ["color", "displayname", "description", "order"]
    conflict_resolution = null

    [storage my_calendars_local]
    type = "filesystem"
    path = "${config.xdg.dataHome}/calendars/caldav.pcache/"
    fileext = ".ics"

    [storage my_calendars_remote]
    type = "caldav"
    url = "https://caldav.pcache.dev"
    username = "pcache"
    password.fetch = ["shell", "pass misc/radicale | head -n1"]

    [pair my_calendars]
    a = "my_calendars_remote"
    b = "my_calendars_local"
    collections = ["from a", "from b"]
    metadata = ["color", "displayname", "description", "order"]
    conflict_resolution = null

    [storage put_classes_local]
    type = "filesystem"
    path = "${config.xdg.dataHome}/calendars/put.classes/"
    fileext = ".ics"

    [storage put_classes_remote]
    type = "http"
    read_only = true
    url.fetch = ["shell", "pass school/put-classes-caldav | head -n1"]

    [pair put_classes]
    a = "put_classes_remote"
    b = "put_classes_local"
    collections = null
    metadata = ["color", "displayname", "description", "order"]
    conflict_resolution = null
    partial_sync = "revert"
  '';
}
