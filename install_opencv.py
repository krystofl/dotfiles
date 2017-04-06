#!/usr/bin/python3

'''
Install OpenCV

Based on http://arijitgeek.me/index.php/2016/06/24/install-opencv-3-1-0-with-python-2-7-on-aws-ubuntu-ec2-instance/
'''

import os
import sys
import argparse
import traceback
import subprocess



def call(command):
  # run shell command (string)
  print(command)
  subprocess.call(command.split())



def install_opencv(args):
  # install opencv!

  # print all of the selected installation options
  print("Selected installation options: ")
  for arg, val in vars(args).items():
    print("{}: {}".format(arg, val))
  print("\n")

  # proceed?
  if False and not args.force:
    proceed = input("Proceed with the installation? ")
    try:
      if proceed[0].lower() != 'y':
        print("Exiting.")
        return
    except:
      print("Exiting (exception)")
      print(traceback.format_exc())
      return
      

  # prep directories...

    
  download_source(args)

  configure_build(args)

  build_and_install(args)

  
  
def download_source(args):
  # Download the source code to build
  print("Downloading source...")

  # main repo
  # git clone https://github.com/Itseez/opencv.git
  call("git clone https://github.com/Itseez/opencv.git")
  

  print("TODO: change directories")
  
  # git checkout tags/3.2.0
  #git checkout tags/{}".format(args.tag)
  call("git checkout tags/{}".format(args.tag))

  
  # contributions module
  #git clone https://github.com/Itseez/opencv_contrib.git
  
  print("TODO")


  
def configure_build(args):
  print("TODO")


  
def build_and_install(args):
  print("TODO")
  


def print_prereqs():
  # just prints a list of commands to run to get all the prerequisites for this script
  s1 = "sudo apt-get update"
  s2 = "sudo apt-get upgrade"
  print("{}\n{}\n".format(s1, s2))

  s3 = "sudo apt-get install build-essential cmake git pkg-config libjpeg8-dev libjasper-dev libpng12-dev libgtk2.0-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libatlas-base-dev gfortran python2.7-dev\n"
  print(s3)

  s = '#Install pip\n' \
      'wget https://bootstrap.pypa.io/get-pip.py\n' \
      'sudo python get-pip.py\n'
  print(s)

  print("sudo pip install numpy")

  
    
def parse_command_line_args():
  # parse command line arguments

  parser = argparse.ArgumentParser(description = "Installs OpenCV")

  parser.add_argument('-t', '--tag',
                      default = '3.2.0',
                      help = "Tag of opencv to download & install (default: 3.2.0)")

  parser.add_argument('-f', '--force', action = 'store_true',
                      help = "'Force': don't ask user for confirmation to do anything")

  # TODO: add dir to clone into
  
  args = parser.parse_args()

  return args



if __name__ == '__main__':
  args = parse_command_line_args()

  print("TODO: decide whether to just show prereqs")
  
  install_opencv(args)
  #print_prereqs()
  
