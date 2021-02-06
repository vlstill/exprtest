ExprTest
==========

[![Build Status](https://travis-ci.org/vlstill/exprtest.svg?branch=master)](https://travis-ci.org/vlstill/exprtest)

Automatic testing of small programming assignments.

This project is an programming-language-agnostic driver for
testing which invokes teacher-provided script on student's solution.
For the Haskell testing tool support look at
[hsExprTest](https://github.com/vlstill/hsExprTest).

This tool was initially used in the [Non-Imperative
Programming](https://is.muni.cz/predmet/fi/podzim2020/IB015?lang=en) course on
[Faculty of Informatics, Masaryk University (FI MU)](https://www.fi.muni.cz) and
is now used in a few courses on the same faculty (with different-teacher
provided components).  It can be used either locally (but that is not very
useful) or connected to a testing frontend, such as the frontend of [IS
MU](https://is.muni.cz).  In either case, testing requires [assignment
files](#assignment-files).

## Evaluators / Language Backends

There is support for multiple evaluators which are plugged in using a simple
script interface. The original evaluator is
[hsExprTest](https://github.com/vlstill/hsExprTest) used for Haskell.

Other evaluators are mostly private to the courses which use them.
Documentation for writing evaluators will be added.

## IS MU Integration

For integration with IS MU, you will need a server capable of running a
web server, the [`exprtest` service](/src/core/)
([documentation](/src/core/README.md)) and your language backends of choice.
For running the service, you can start with [the systemd unit
file](src/systemd/exprtest.service).

### Questionnaire Frontend

The original frontend is the questionnaire frontend which uses ability of IS to
send questionnaire evaluation to an external server.

TODO: doc

### Submission Folder Frontend

The [`ispol`](/src/ispol) ([documentation](/src/ispol/README.md)) is an
alternative frontend/glue for IS MU. It allows students to submit a file to
submission folder which is checked by `ispol` and evaluated using ExprTest
service. The results are written to student's notebooks.

This frontend is now deprecated in favour of frag (which sadly has no public
page to link to as far as I know).

### Writing questions for IS MUNI integration

Questions are stored in question directory (defaults to `/var/lib/checker/qdir`),
they have extension `.q.hs`, or other `.q.??` extension.


## Bug Reporting

Use GitHub bug reporting for bugs (I'm sure there are some).
