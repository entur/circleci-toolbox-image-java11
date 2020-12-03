#!/bin/bash

# The script extract docker version and tag matching git commit 

set -euo pipefail

          repository="${1}"
          branch="${2}"
          DOCKER_TAG="${3}"
          COMMIT_ID="${4}"

          working_dir="workdir"
          git clone --single-branch --branch "$branch" "https://github.com/$repository" "$working_dir"

          cd ${working_dir} || exit
          git config --global user.email "circleci@entur.no"
          git config --global user.name "circleci"
          
          git pull
          git tag -a $DOCKER_TAG $COMMIT_ID -m "Tag from deployment config repo"
          # Push quietly to prevent showing in log
          echo "push empty commit "
          git push -q --tags origin "$branch" 
           echo "delete working direcotry"
          cd ..
          rm -rf "$working_dir"
           echo "git commit process completed."
