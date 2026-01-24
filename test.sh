#!/bin/bash

build -a X64 -t XCODE5 -p MdeModulePkg/MdeModulePkg.dsc -d 8 2>/dev/null | grep "MIKE" | sed 's/    MIKE: //' | ggrep -P -v 'GCC(48|49|5)' > keep_test.txt
diff keep.txt keep_test.txt || exit 1
build -a X64 -t XCODE5 -p MdeModulePkg/MdeModulePkg.dsc -d 8 2>/dev/null | grep "MIKE" | sed 's/    MIKE: //' | ggrep -P 'GCC(48|49|5)'
ggrep -P 'GCC(48|49|5)' Conf/tools_def.txt | ggrep -P -v '^#'
