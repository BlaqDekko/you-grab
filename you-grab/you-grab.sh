#!/bin/bash

set -e

echo "Setting attributes..."
#Enter location to save video here
savdir=~/Dropbox/YouTube_Rips/

read -p "Enter Your YouTube URL: "  ytlink
cd $savdir

echo "Attempting to download highest qualiity for $ytlink."
youtube-dl -f bestvideo+bestaudio $ytlink || true

read -p "Did it work? (y/n) " answer
if [[ $answer == "y" || $answer == "yes" ]]; then
  dropbox start
  exit
elif [[ $answer == "n" || $answer == "no" ]]
then
  echo "Trying again..."
else
  echo "You didn't answer with yes or no. Exiting..."
  exit
fi
youtube-dl -f 136+140 $ytlink
read -p "Did it work this time? (y/n) " answer2
if [[ $answer2 == "y" || $answer2 == "yes" ]]; then
  dropbox start
  exit
elif [[ $answer2 == "n" || $answer2 == "no" ]]
then
  echo "Sorry. No DASH version available in 1080p or 720p. Try 'youtube-dl -F'."
else echo "You didn't answer with yes or no. Exiting..."
  exit
fi

echo "Exiting..."
exit
