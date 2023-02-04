
# Chd

## Create from iso

chdman createcd -i Crash\ Bandicoot.iso -o Crash\ Bandicoot.chd

## Make bin from chd

chdman extractcd -i King\'s\ Field\ \(USA\).chd -o toto.cue

# Bin

## Make iso from bin

bchunk toto.bin toto.cue toto.iso
