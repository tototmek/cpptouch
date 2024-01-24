#! /usr/bin/python3

import argparse
import os
import re


def parse_args():
    parser = argparse.ArgumentParser(description="Create C++ files")
    parser.add_argument(
        "files", nargs="+", help="The path to the file(s) to be created, no extension"
    )
    parser.add_argument(
        "--header-only", action="store_true", help="Generate only a header file"
    )
    parser.add_argument(
        "-n", "--namespace", help="Given namespace is added at files' top scope"
    )
    parser.add_argument(
        "-a",
        "--auto-namespace",
        action="store_true",
        help="Use parent directory as namespace",
    )
    args = parser.parse_args()
    if args.auto_namespace and args.namespace:
        parser.error("Cannot use --namespace with --auto-namespace")

    return args


def generate_files(file, args):
    validate_directory(file, args)
    generate_header(file, args)
    if not args.header_only:
        generate_source(file, args)


def validate_directory(file, args):
    directory = os.path.dirname(file)
    if not os.path.exists(directory):
        print(f'Error: directory "{directory}" does not exist.')
        exit(1)
    if not (os.access(directory, os.R_OK) and os.access(directory, os.W_OK)):
        print(f'Error: Cannot access directory "{directory}": permission denied.')
        exit(1)


def generate_header(file, args):
    file_name = get_header_name(file, args)
    validate_filename(file_name, args)
    header_guard = get_header_guard(file, args)
    namespace = get_namespace(file, args)
    write_header(file_name, header_guard, namespace)


def generate_source(file, args):
    file_name = get_source_name(file, args)
    validate_filename(file_name, args)
    header_name = os.path.basename(get_header_name(file, args))
    namespace = get_namespace(file, args)
    write_source(file_name, header_name, namespace)


def validate_filename(file, args):
    if os.path.exists(file):
        print(f'Error: file "{file}" already exists.')
        exit(1)


def get_header_name(file, args):
    return file + ".h"


def get_source_name(file, args):
    return file + ".cpp"


def get_header_guard(file, args):
    relative_path = get_relative_path(file, "src")
    components = re.split(r"[\/\\.]+", relative_path)
    return "_".join(components).upper() + "_H"


def get_namespace(file, args):
    if args.auto_namespace:
        relative_path = get_relative_path(file, "src")
        directory_path = os.path.dirname(relative_path)
        components = re.split(r"[\/\\.]+", directory_path)
        namespace = "::".join(components)
    else:
        namespace = args.namespace
    if namespace == "":
        return None
    return namespace


def write_header(file_name, header_guard, namespace):
    with open(file_name, "w") as file:
        file.write(f"#ifndef {header_guard}\n")
        file.write(f"#define {header_guard}\n")
        file.write(f"\n")
        if namespace is not None:
            file.write(f"namespace {namespace} " + "{\n")
            file.write(f"\n")
            file.write("}" + f" // namespace {namespace}\n")
        file.write(f"\n")
        file.write(f"#endif // {header_guard}")


def write_source(file_name, header_name, namespace):
    with open(file_name, "w") as file:
        file.write(f'#include "{header_name}"\n')
        file.write(f"\n")
        if namespace is not None:
            file.write(f"namespace {namespace} " + "{\n")
            file.write(f"\n")
            file.write("}" + f" // namespace {namespace}")


def get_relative_path(file_path, base_folder):
    try:
        relative_path = os.path.relpath(file_path, base_folder)
        return (
            relative_path
            if not relative_path.startswith("..")
            else os.path.basename(file_path)
        )
    except ValueError:
        return os.path.basename(file_path)


if __name__ == "__main__":
    args = parse_args()
    for file in args.files:
        generate_files(file, args)
