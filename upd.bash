#!/bin/bash

git submodule foreach '
  git checkout main;
  git pull origin main;
'
