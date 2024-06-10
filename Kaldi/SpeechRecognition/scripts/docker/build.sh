#!/bin/bash

# Copyright (c) 2019 NVIDIA CORPORATION. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -eu

TRITON_TAG=$(date -d "$(date +%Y-%m-1) -1 month" +%y.%m) # latest available build tag is year + last month. E.g. "24.05"

# Use development branch of Kaldi for latest feature support
docker build --build-arg TRITON_TAG=$TRITON_TAG . -f Dockerfile \
    --rm -t triton_kaldi_server:$TRITON_TAG
docker build --build-arg TRITON_TAG=$TRITON_TAG . -f Dockerfile.client \
    --rm -t triton_kaldi_client:$TRITON_TAG
