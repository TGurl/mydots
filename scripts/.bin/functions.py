#!/usr/bin/env python
# ----------------------------------------------------------
#   _______                    __   __
#  |    ___|.--.--.-----.----.|  |_|__|.-----.-----.-----.
#  |    ___||  |  |     |  __||   _|  ||  _  |     |__ --|
#  |___|    |_____|__|__|____||____|__||_____|__|__|_____|
#
#        My collection of functions I often use in my
#       scripts.  So I've collected them here so I can
#                  more easily use them.
#
#                   ASCII generated by:
#         https://textkool.com/en/ascii-art-generator
# ----------------------------------------------------------

import os
import sys
import yaml
import shutil
import pathlib
import subprocess

# ---- play a video using mpv
def run_mpv(video, path):
    if video.lower() in ['cancel', '']:
        sys.exit(0)

    if video.lower() == 'play all':
        path = os.path.join(path, 'playlist.m3u')
    else:
        path = os.path.join(path, video)

    command = f"mpv {path}"
    proc = subprocess.Popen([command], shell=True,
            stdin=None,
            stdout=None,
            stderr=None,
            close_fds=True)
    sys.exit(0)

# ---- dmenu interaction
def generate_dmenu_options(optlist: list) -> str:
  """
  Generates a string from list seperated by newlines.
  """
  return "\n".join(optlist)


def run_dmenu(options:list, prompt='dmenu') -> str:
  """
  Runs dmenu with the given options and returns the result.
  This script appends the Cancel options at pos 0 of the list.
  Optional: prompt -> the prompt of the menu, default: dmenu
  """
  options.insert(0, 'Cancel')

  font = "Hack:medium:size=18"
  args = ["-fn", font, "-p", prompt, "-i"]

  dmenu = subprocess.Popen(['dmenu'] + args,
      stdin = subprocess.PIPE,
      stderr = subprocess.PIPE,
      stdout = subprocess.PIPE)
  choicelines = generate_dmenu_options(options)
  res, err = dmenu.communicate(choicelines.encode('utf-8'))

  if dmenu.returncode not in [0, 1] \
      or (dmenu.returncode == 1 \
      and len(err) != 0):
        print("'{} {}' returned {} and error:\n{}".format(
          ['dmenu'], ' '.join(args), dmenu.returncode,
          err.decode('utf-8')))
        sys.exit(1)

  res = res.decode('utf-8').rstrip()
  return res


# ---- Screen interaction
def get_terminal_width():
  return shutil.get_terminal_size().columns


def get_terminal_height():
  return shutil.get_terminal_size().lines


def cprint(text: str) -> None:
  """
  Prints 'text' at the center of terminal.
  """
  term_width = get_terminal_width()
  spaces = int((term_width - len(text)) / 2) * " "
  print(f"{spaces}{text}")


def tprint(text: str, tabs=1) -> None:
  """
  Prints 'text' preceded with number of tabs, deflault=1
  """
  tabs = tabs * "\t"
  print(f"{tabs}{text}")


# ---- File handling
def read_textfile(path: str) -> list:
  """
  Read a text file and resturns contents as a list.
  Requires: path -> full path to the file.
  """
  with open(path, 'r') as text_file:
    data = path.read().splitlines()
  return data


def read_yaml(path: str) -> list:
  """
  Read a yaml text file and resturns the contents as a list.
  Requires: path -> full path to the file.
  """
  with open(path, 'r') as yaml_file:
    data = yaml.load(yaml_file, Loader=yaml.FullLoader)
  return data


def get_files(path: str, flist:list) -> list:
  """
  Reads contents of folder and returns a list of files.
  Requires: path -> full path to the file
            flist -> list of extensions to include
  """
  _list = []
  for file in os.listdir(path):
    extension = pathlib.Path(file).suffix
    if extension in flist:
      _list.append(file)
  return _list

# ---- Terminal operations
def clear() -> None:
  """A function to clear the terminal."""
  if os.name == 'nt':
    os.systme('cls')
  else:
    os.system('clear')

