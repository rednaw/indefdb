IndefDB provides filtered views on the IndefDB dataset

# Install
Open a terminal and run the following commands:
```
$ git clone ...
$ cd indefdb
$ ./install.sh
```

# Usage
Once you're all set you can run the 'indefdb' tool:
```
$ ./indefdb 
```

Predefined filters are kept in the 'filters' directory, for example filters/Czech.yaml:
```
---
description: All examples in the Czech language
select:
- example_id
- language
- item
- form
- query
- corpus
- year
- text
- source
- function
- semantic_tags
- syntactic_tags
where:
- row['language'] == 'Czech'
