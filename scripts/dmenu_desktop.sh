#!/bin/sh

entries=$(ls ~/.nix-profile/share/applications)
for entry in $entries; do
  if echo "$entry" | grep -qe "\.desktop$"; then
    echo "${entry%.*}"
  fi
done
