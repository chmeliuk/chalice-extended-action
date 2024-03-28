#!/bin/sh -l

if [ ! -z "$WORKING_DIRECTORY" ]
then
      cd "$WORKING_DIRECTORY"
fi

if [ ! -z "$REQUIREMENTS_FILE" ]
then
      vendor_part=""
      if [! -z "$INSTALL_VENDOR" ]
      then
          vendor_part=" -t ./vendor"
      fi
      pip install -r "$REQUIREMENTS_FILE" $vendor_part
fi

if ! [ -z "$PROJECT_DIR" ]
then
      projectDirSubCommand="--project-dir $PROJECT_DIR"
fi

if ! [ -z "$STAGE" ]
then
      stageSubCommand="--stage $STAGE"
fi

command="chalice $projectDirSubCommand $OPERATION $stageSubCommand"

eval $command
