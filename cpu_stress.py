#!/usr/bin/env python3

# Copyright 2017 Adobe Systems, Inc. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from flask import Flask
from multiprocessing import Pool

app = Flask(__name__)


@app.route("/health", methods=['GET'])
def check_health():
    return '', 200


def busy_work(n):
    while True:
        n ** n


worker_pool = Pool(processes=1)
worker_pool.map(busy_work, range(1))


def main():
    app.run()


if __name__ == "__main__":
    main()
