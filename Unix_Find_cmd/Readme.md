#Problem Statement

There is a directory tree with lots of files, some of them are text files. Text files may contain phone numbers in the format: <3-digit-area-code>-<3-digit-prefix>-<4-digit-suffix>.

Result the area code and frequency of numbers for each area code.

## Usage

Given A directory `dir`, use the below command to get required result.

```
find <given directory `dir` path> -name '*.txt' -exec grep -o '[0-9]\{3\}[-][0-9]\{4\}[-][0-9]\{3\}' {} \; | cut -c 1-3 | sort | uniq -c
```
This can be used for any regular files with slight modification.