#!/bin/bash

# This script should be run from the user's local machine.
# This script should NOT be run on ARC.

echo "Downloading PipelineReleases from ARC /nobackup"

# -a: archive mode
# -z: compress files during transfer
# -v: verbose
# -R: creates relative paths in destination
# /./ tells where to begin the copying
rsync -azvR -e ssh earmhe@arc4.leeds.ac.uk:"/nobackup/earmhe/Fellowship 1960-2015 PFU database/OutputData/./PipelineReleases/" "/Users/mkh2/Dropbox/Fellowship 1960-2015 PFU database/OutputData/"
