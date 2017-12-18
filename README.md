# PMD Alpine based

A ~150Mb PMD environment

To build
```
docker build --rm=true -t num2/pmd .
```

To run
```
docker run --rm -ti num2/pmd

# E.g. of pmd execution
docker run --rm -ti num2/pmd run.sh pmd -d /<YOUR CODE DIRECTORY> -f html -R <YOUR RULESETS FILE> -reportfile "results.html"
```

This will generate a `results.html` HTML report.

Alternatively, you can open a command line in the container directly.
```
run.sh pmd -d /<YOUR CODE DIRECTORY> -f html -R <YOUR RUELESETS FILE> -reportfile <YOUR REPORT FILENAME>
```

Volume "\workdir" is enabled by default and could be used to share files between the host and the container.
