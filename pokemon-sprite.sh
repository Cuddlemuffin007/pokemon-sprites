#!/bin sh

# pokemon-names.csv should only contain the name identifier in English of Pokemon through Generation 5 (1-649, i.e., Bulbasaur -> Genesect)
# because only these (so far) have animated sprites and can be found with the image url pattern below.
INPUT="$HOME/pokemon-names.csv"
# declare array of path elements to pokemon normal and shiny sprites
declare -a sprites=("normal" "shiny")
# generate array of names for download
names=()
while IFS='\n' read -r name; do
    names+=("$name")
done < $INPUT

for name in "${names[@]}"
do
    for sprite in "${sprites[@]}"
    do
        downloaded_image_filepath="$HOME/Downloads/${name}-${sprite}.gif"
        image_url="https://img.pokemondb.net/sprites/black-white/anim/${sprite}/${name}.gif"
        echo "Downloading ${name}'s ${sprite} sprite to ${downloaded_image_filepath} from ${image_url}"
        # wget -nv $base_url -O $downloaded_image_filepath
    done
done
