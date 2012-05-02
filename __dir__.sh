#!/bin/bash
# -*- coding: utf-8 -*-
#
#       __DIR__.sh
#       
#       Copyright 2012 John Francis Mukulu <john.f.mukulu@gmail.com>
#       
#       This program is free software; you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation; either version 2 of the License, or
#       (at your option) any later version.
#       
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#       
#       You should have received a copy of the GNU General Public License
#       along with this program; if not, write to the Free Software
#       Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#       MA 02110-1301, USA.
#       
#       
# @Usage: Put the function in /etc/bash.bashrc or $HOME/.bashrc
# PROJECT_DIR="$(__DIR__)"

function __DIR__() {
    # Deduce this file's full dir path
    FILE_PATH="$0"
    CURRENT_DIR="$PWD"
    DIR_NAME=$( dirname $FILE_PATH )
    reference="$(echo $FILE_PATH | cut --fields=1 --delimiter=$'/')"
    if [ -n "$reference" ];then
        if [  "$reference" == "." ];then
            dirpathwithperiod=$(dirname $FILE_PATH)
            if [  "$reference" == "./" ];then
				dirpathwithoutperiod=${dirpathwithperiod[@]/\.\//}
			else
				dirpathwithoutperiod=${dirpathwithperiod[@]/\./}
			fi
            fullpath="${CURRENT_DIR}${dirpathwithoutperiod}"
            echo "$fullpath"
        else
            dirpathwithperiod=$(dirname $FILE_PATH)
            fullpath="${CURRENT_DIR}/${dirpathwithperiod}"
            echo "$fullpath"
            
        fi
    else
        fullpath=$(dirname $FILE_PATH)
        echo "$fullpath"
    fi
}

