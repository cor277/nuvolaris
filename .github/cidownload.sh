#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

REL="${1:?release}"
REL="${REL#refs/*/}"
VER="${2:?version}"
VER="${TAG#refs/*/}"
PRE="https://github.com/nuvolaris/nuvolaris-cli/releases/download"
wget -nc $PRE/$VER/nuv-$VER-windows-amd64.zip -O nuv-$REL-windows-amd64.zip
wget -nc $PRE/$VER/nuv-$VER-windows-amd64.zip.md5 -O nuv-$REL-windows-amd64.zip.md5
for OS in linux darwin
do for ARC in amd64 arm64
   do wget -nc $PRE/$VER/nuv-$VER-$OS-$ARC.tar.gz -O nuv-$REL-$OS-$ARC.tar.gz
      wget -nc $PRE/$VER/nuv-$VER-$OS-$ARC.tar.gz.md5 -O nuv-$REL-$OS-$ARC.tar.gz.md5
   done
done
