#!/bin/sh

# Tags
riverctl rule-add -app-id 'firefox' tags $((1 << 9))
riverctl rule-add -app-id 'thunderbird' tags $((1 << 10))
riverctl rule-add -app-id 'discord' tags $((1 << 11))
riverctl rule-add -app-id 'vesktop' tags $((1 << 11))

# Floats
riverctl rule-add -app-id 'floatme' float
riverctl rule-add -title 'Load SFZ file' float  # sfizz dialog

# Ardour floating dialogs
riverctl rule-add -title 'Rename Track' float
riverctl rule-add -title 'Color Selection:*' float
riverctl rule-add -title '* - Meterbridge - Ardour' float
riverctl rule-add -title 'Customize port name' float
riverctl rule-add -title 'New Playlist for ALL Tracks' float
riverctl rule-add -title 'New Playlist for *' float
riverctl rule-add -title 'Copy Playlist for *' float
riverctl rule-add -title 'Rename Playlist' float
riverctl rule-add -title 'Rename Session' float
riverctl rule-add -title 'Ardour: Locked' float
riverctl rule-add -title 'Choose session to import metadata from' float
riverctl rule-add -title 'Ardour: Log' float
riverctl rule-add -title 'Rename Mark' float

# Hydrogen
riverctl rule-add -title 'Audio File Browser' float
riverctl rule-add -title 'Mixer' float

# Server-side decorations
riverctl rule-add -app-id 'firefox' ssd
riverctl rule-add -app-id 'zathura*' ssd
