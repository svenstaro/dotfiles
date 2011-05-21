CDLOADER_WINE="wine"

# Steam directory
STEAMDIR="$HOME/.wine/drive_c/Program Files/Steam"

cd "$STEAMDIR"

$CDLOADER_WINE "steam.exe" -- "$@" 

