#!/usr/bin/env bash
# Licensed to the StackStorm, Inc ('StackStorm') under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# Script which validates that a pack contains metadata file (pack.yaml).
#

if [ $# -ne 1 ]; then
    echo "Usage: ${0} <path to pack directory>"
    exit 1
fi

if [ ! -d ${PACK_DIR} ]; then
    echo "Pack directory \"${PACK_DIR}\" doesn't exist"
    exit 2
fi

PACK_DIR=$1
PACK_NAME=$(basename $PACK_DIR)

if [ ${PACK_NAME} = "linux" ]; then
    # Workaround for linux pack in st2contrib which only contains a redirect to a new
    # location
    exit 0
fi

if [ ! -e "${PACK_DIR}/pack.yaml" ]; then
    echo "Pack "${pack}" is missing pack.yaml file"
    exit 3
fi
