#!/bin/sh
. zbrewsetenv 

zbrewdeploy "$1" eqae20.bom
exit $? 
