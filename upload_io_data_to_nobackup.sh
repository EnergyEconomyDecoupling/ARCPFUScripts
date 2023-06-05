#!/bin/bash

echo "Upload InputData and OutputData to ARC nobackup directory"

# -a: archive mode
# -z: compress files during transfer
# -v: verbose
# -R: creates relative paths in destination
# --delete deletes files on ARC4 if they have been deleted locally
# /./ tells where to begin the copying
rsync -azvR --delete -e ssh "../.././Fellowship 1960-2015 PFU database/InputData/" "../.././Fellowship 1960-2015 PFU database/OutputData/PipelineReleases" earmhe@arc4.leeds.ac.uk:"/nobackup/earmhe/"
