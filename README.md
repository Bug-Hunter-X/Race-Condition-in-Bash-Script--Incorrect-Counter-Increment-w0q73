# Race Condition Bug in Bash

This repository demonstrates a race condition bug in a bash script.  Two threads concurrently increment a counter, resulting in an inaccurate final count. The `bug.sh` file contains the buggy code, while `bugSolution.sh` provides a corrected version using proper synchronization.