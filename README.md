Storecoin Core integration/staging tree
=====================================

http://www.storecoin.org

Copyright (c) 2009-2013 Storecoin Core Developers

What is Storecoin?
----------------

Storecoin is an experimental new digital currency that enables instant payments to
anyone, anywhere in the world. Storecoin uses peer-to-peer technology to operate
with no central authority: managing transactions and issuing money are carried
out collectively by the network. Storecoin Core is the name of open source
software which enables the use of this currency.

For more information, as well as an immediately useable, binary version of
the Storecoin Core software, see http://www.storecoin.org/en/download.

License
-------

Storecoin Core is released under the terms of the MIT license. See [COPYING](COPYING) for more
information or see http://opensource.org/licenses/MIT.

Development process
-------------------

Developers work in their own trees, then submit pull requests when they think
their feature or bug fix is ready.

If it is a simple/trivial/non-controversial change, then one of the Storecoin
development team members simply pulls it.

If it is a *more complicated or potentially controversial* change, then the patch
submitter will be asked to start a discussion (if they haven't already) on the
[mailing list](http://sourceforge.net/mailarchive/forum.php?forum_name=storecoin-development).

The patch will be accepted if there is broad consensus that it is a good thing.
Developers should expect to rework and resubmit patches if the code doesn't
match the project's coding conventions (see [doc/coding.md](doc/coding.md)) or are
controversial.

The `master` branch is regularly built and tested, but is not guaranteed to be
completely stable. [Tags](https://github.com/storecoin/storecoin/tags) are created
regularly to indicate new official, stable release versions of Storecoin.

Testing
-------

Testing and code review is the bottleneck for development; we get more pull
requests than we can review and test. Please be patient and help out, and
remember this is a security-critical project where any mistake might cost people
lots of money.

### Automated Testing

Developers are strongly encouraged to write unit tests for new code, and to
submit new unit tests for old code. Unit tests can be compiled and run (assuming they weren't disabled in configure) with: `make check`

Every pull request is built for both Windows and Linux on a dedicated server,
and unit and sanity tests are automatically run. The binaries produced may be
used for manual QA testing — a link to them will appear in a comment on the
pull request posted by [StorecoinPullTester](https://github.com/StorecoinPullTester). See https://github.com/TheBlueMatt/test-scripts
for the build/test scripts.

### Manual Quality Assurance (QA) Testing

Large changes should have a test plan, and should be tested by somebody other
than the developer who wrote the code.
See https://github.com/storecoin/QA/ for how to create a test plan.
