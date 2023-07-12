# benchmarks

To get the int-map files registered: 

`cd int-map && make && make TARGETDIR={...}/benchmarks/ install` 

To use any needed files from tree-automata project files (needed to run tests in tree-automata):

`cd tree-automata-coq-gym && make && make TARGETDIR={...}/benchmarks/ install` 

To run any test, just go into that directory and run `make`. If the project was not previously made, make sure to comment out the `lfind` tactic call, call `make` and then add the tactic back and remake. This is also assuming that `lfind` was previously and properly installed. Planning on adding a script to run batches of benchmarks at once.

In general, there is a project folder (let's say `project-example`) and then there will be the full CoqGym project, which will be called `project-example-coq-gym`. LFind benchmarks can be found in `project-example`; the `project-example-coq-gym` is included so that libraries can used in dependent files. There is also a folder `clam`, which will be populated with results from running the clam benchmarks to have a record of those runs.