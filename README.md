# cpptouch
It's a simple utility program that generates .h and .cpp files for you. Saves a little bit of typing, and that's all.

### Usage
The program uses Python – make sure you have it installed. You can use the program by simply running the `cpptouch.py` script, like so:
```bash
python3 cpptouch.py src/somefile
```
Files `src/somefile.h` and `src/somefile.cpp` will be created. They will contain appropriate header guards, includes as well as namespaces.
To list possible options, use:
```bash
python3 cpptouch.py --help
```
You can install the script system-wide using the provided Makefile, like so:
```bash
sudo make install
```
Then, you can use the program like this:
```bash
cpptouch src/somefile
```
If you wish to uninstall, run:
```bash
sudo make clean
```


The header quard generation and automatic namespaces work best in projects with the following structure:
```bash
src
├── bar
│   ├── main_window.cpp
│   ├── main_window.h
│   ├── widget.cpp
│   └── widget.h
└── foo
    ├── core.cpp
    ├── core.h
    ├── io
    │   ├── io.cpp
    │   └── io.h
    ├── util.cpp
    └── util.h
```
