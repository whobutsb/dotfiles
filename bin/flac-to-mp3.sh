#!/usr/bin/env bash

# Converts the INPUT_DIR .flac files into MP3

INPUT_DIR="/media/wav/"
OUTPUT_DIR="/media/lossy/mp3/audio/"

# Loop through the flac files 
for file in "$INPUT_DIR"*.flac; do 

  FILENAME=$(basename "${file%%.*}")
  MP3_FILENAME="$FILENAME.mp3"

  # Check to see if the file is already converted to MP3
  [ -r "${OUTPUT_DIR}${MP3_FILENAME}" ] && continue
  
  echo "Encoding to MP3 ${MP3_FILENAME}"
  
  TITLE=$(metaflac --show-tag=TITLE "$file")
  TITLE=${TITLE#"TITLE="}
  
  ARTIST=$(metaflac --show-tag=ARTIST "$file")
  ARTIST=${ARTIST#"ARTIST="}

  ALBUM=$(metaflac --show-tag=ALBUM "$file")
  ALBUM=${ALBUM#"ALBUM="}
  
  LABEL=$(metaflac --show-tag=TPUB "$file")
  LABEL=${LABEL#"TPUB="}

  # Create a MP3 at 128kb
  if ! ffmpeg -ab 128k -map_meta_data 0:0 -i "$file" "${OUTPUT_DIR}${MP3_FILENAME}" -f null - &> /dev/null; then
    echo "[ERROR] ffmpeg -ab 128k -map_meta_data 0:0 -i "$file" "${OUTPUT_DIR}${MP3_FILENAME}" -f null -" 1>&2
  fi

  # Add the metadata to the mp3 file
  eyeD3 --artist="$ARTIST" --title="$TITLE" --album="$ALBUM" --publisher="$LABEL" "${OUTPUT_DIR}${MP3_FILENAME}"
done