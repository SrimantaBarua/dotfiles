#!/usr/bin/env python


import os


# Recursively create directories for `path`
def mkdir(path):
    pass


# Creates a symlink at `link` pointing to `orig`, deleting any prior
# file/directory/link formerly at `link`
def symlink(orig, link):
    pass


# Parses configuration files and returns list of commands to run
def include_cfg(path):
    root_here = os.path.dirname(path)
    cmds = []
    # Read file contents
    try:
        with open(path) as f:
            for line in f.readlines():
                # Skip comments
                if line.startswith('#'):
                    continue
                # Include other config files
                if line.startswith("INCLUDE"):
                    # Get path to config file
                    target = line[len("INCLUDE"):].strip()
                    child_path = os.path.join(root_here, target, "__cfg__")
                    # Include config file
                    cfg_here = include_cfg(child_path)
                    cmds.append(("INCLUDE", target, cfg_here))
                    continue
                # Make directories
                if line.startswith("MKDIR"):
                    # Get path to directory
                    path = line[len("MKDIR"):].strip()
                    cmds.append(("MKDIR", path))
                    continue
                # Create symlinks
                if line.startswith("SYMLINK"):
                    # Get original and link paths
                    paths = line[len("SYMLINK"):].split(',')
                    orig = os.path.join(root_here, paths[0].strip())
                    link = paths[1].strip()
                    cmds.append(("SYMLINK", orig, link))
                    continue
                # Clone a git repository
                if line.startswith("GIT_CLONE"):
                    args = line[len("GIT_CLONE"):].split(',')
                    repo = args[0].strip()
                    path = args[1].strip()
                    cmds.append(("GIT_CLONE", repo, path))
                # Print todo messages
                if line.startswith("TODOMSG"):
                    msg = line[len("TODOMSG"):].strip()
                    cmds.append(("TODOMSG", msg))
                    continue
    except Exception as e:
        print("Failed to parse config file: {}: {}".format(path, e))
        quit(1)
    return cmds


# Print commands
def print_cmds(cmds, indent=0):
    for cmd in cmds:
        if cmd[0] == "INCLUDE":
            print("{}INCLUDE {}".format(" " * indent, cmd[1]))
            print_cmds(cmd[2], indent + 2)
        elif cmd[0] == "SYMLINK":
            print("{}SYMLINK {} -> {}".format(" " * indent, cmd[2], cmd[1]))
        elif cmd[0] == "GIT_CLONE":
            print("{}GIT_CLONE {} -> {}".format(" " * indent, cmd[1], cmd[2]))
        else:
            print("{}{} {}".format(" " * indent, cmd[0], cmd[1]))


if __name__ == "__main__":
    # Get path to this file
    root_path = os.path.dirname(os.path.abspath(os.path.realpath(__file__)))
    # Parse root __cfg__
    cmds = include_cfg(os.path.join(root_path, "__cfg__"))
    print_cmds(cmds)
