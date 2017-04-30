#!/usr/bin/python3

'''
Install OpenCV
run `install_opencv.py --help` for usage

NOTE: Does only minimal error checking!
      You may not want to use this if it's critical that everything works properly!

Loosely based on http://arijitgeek.me/index.php/2016/06/24/install-opencv-3-1-0-with-python-2-7-on-aws-ubuntu-ec2-instance/
'''

import os
import sys
import argparse
import traceback
import subprocess
import json


# if the user doesn't provide build options, use these default values
DEFAULT_BUILD_OPTIONS = { "CMAKE_BUILD_TYPE"       : "RELEASE",
                          "CMAKE_INSTALL_PREFIX"   : "/usr/local",
                          "INSTALL_C_EXAMPLES"     : "OFF",
                          "INSTALL_PYTHON_EXAMPLES": "OFF",
                          "BUILD_OPENCV_PYTHON2"   : "ON",
                          "PYTHON2_INCLUDE_DIR"    : "/usr/include/python2.7",
                          "BUILD_EXAMPLES"         : "OFF"}


def call(command):
  # run shell command (string)
  print(command)
  subprocess.call(command.split())


def chdir(dirpath):
  # try to cd into the directory dirpath
  # if it can't be done, print the exception and exit
  try:
    os.chdir(dirpath)
  except:
    print("ERROR: Couldn't chdir into {}. Exiting.".
          format(dirpath))
    print(traceback.format_exc())
    sys.exit()



def install_opencv(args):
  # install opencv!

  print("NOTE: this script assumes you have already installed all of the " \
        "prerequisities; if you have not done so, rerun this script " \
        "with the -p flag to see how to do it.\n")

  # print all of the selected installation options
  print("\nSelected installation options: ")
  for arg, val in vars(args).items():
    print("{}: {}".format(arg, val))
  print("\n")

  # proceed?
  if not args.force:
    proceed = input("Proceed with the installation? ")
    try:
      if proceed[0].lower() != 'y':
        print("Exiting.")
        return
    except:
      print("Exiting (exception)")
      print(traceback.format_exc())
      return


  # directories we'll use
  dirs = {}
  dirs['root'  ] = os.path.realpath(args.build_dir)
  dirs['opencv'] = os.path.join(dirs['root'], 'opencv')
  dirs['build' ] = os.path.join(dirs['opencv'], 'build')


  # download the source code
  download_source(args, dirs)

  configure_build(args, dirs)

  build(args, dirs)

  install(args, dirs)



def download_source(args, dirs):
  # Download the source code we'll build
  print("Downloading source...")

  chdir(dirs['root'])

  # main repo
  # git clone https://github.com/Itseez/opencv.git
  call("git clone https://github.com/Itseez/opencv.git")

  chdir(dirs['opencv'])

  # git checkout tags/3.2.0
  #git checkout tags/{}".format(args.tag)
  call("git checkout tags/{}".format(args.tag))

  # contributions module
  if args.contrib:
    print("WARNING: INSTALLING opencv_contrib IS NOT YET IMPLEMENTED\n")
    #git clone https://github.com/Itseez/opencv_contrib.git
    # NOTE: later will need to define for CMAKE OPENCV_EXTRA_MODULES_PATH=opencv_contrib/modules

  chdir(dirs['root'])



def configure_build(args, dirs):
  # configure the build

  # create the build directory
  try:
    os.makedirs(dirs['build'])
  except FileExistsError:
    # the build directory already exists for some reason; that's fine
    pass
  except:
    print("ERROR: Couldn't create the build directory. Exiting.")
    print(traceback.format_exc())
    sys.exit()

  chdir(dirs['build'])

  # load values for all of the cmake build options
  build_options = {}
  if os.path.exists(args.build_options_file):
    # load 'em
    with open(args.build_options_file, 'r') as fp:
      build_options = json.load(fp)

  # if we have nothing so far, use the default values
  if len(build_options) == 0:
    build_options = DEFAULT_BUILD_OPTIONS

  print("Building OpenCV with the following options:")
  for arg, val in build_options.items():
    print("{}: {}".format(arg, val))
  print("\n")

  args_string = ''
  for arg, val in build_options.items():
    s = "-D {}={} ".format(arg, val)
    args_string += s

  cmake_call = 'cmake {} ..'.format(args_string)
  call(cmake_call)



def build(args, dirs):
  # build the library
  chdir(dirs['build'])
  call('make -j 3') # uses three cores for the build



def install(args, dirs):
  # "install" the library
  chdir(dirs['build'])
  call('sudo make install')
  call('sudo ldconfig')



def print_prereqs():
  # just prints a list of commands to run to get all the prerequisites for this script

  print("Before running this script, run the following to install all of the " \
        "prerequisites:\n")

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

  parser.add_argument('-d', '--build-dir',
                      default = os.getcwd(),
                      help = "Directory where to build opencv. By default, creates an opencv directory in the present working directory")

  parser.add_argument('-p', '--prereqs', action = 'store_true',
                      help = "Show the prerequisities for this script and exit")

  parser.add_argument('-c', '--contrib', action = 'store_true',
                      help = "Also install the opencv contributions modules (see github.com/opencv/opencv_contrib). NOT IMPLEMENTED YET.")

  parser.add_argument('-b', '--build-options-file', default = '',
                      help = "JSON file from which to load the CMAKE build options.")

  args = parser.parse_args()

  return args



if __name__ == '__main__':
  args = parse_command_line_args()

  # does the user just want to see the prerequisites?
  if args.prereqs is True:
    print_prereqs()
    sys.exit()

  install_opencv(args)
