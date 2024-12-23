#!/bin/sh

# Tags
riverctl rule-add -app-id 'firefox' tags $((1 << 9))
riverctl rule-add -app-id 'thunderbird' tags $((1 << 10))
riverctl rule-add -app-id 'discord' tags $((1 << 11))
riverctl rule-add -app-id 'vesktop' tags $((1 << 11))

# Floats
riverctl rule-add -app-id 'floatme' float
riverctl rule-add -title 'Load SFZ file' float  # sfizz dialog
riverctl rule-add -title 'Rename Track' float  # Ardour dialog
riverctl rule-add -title 'Color Selection:*' float  # Ardour dialog
riverctl rule-add -title '* - Meterbridge - Ardour' float  # Ardour dialog

# Server-side decorations
riverctl rule-add -app-id 'firefox' ssd
riverctl rule-add -app-id 'zathura*' ssd
