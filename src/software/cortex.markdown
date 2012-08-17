---
title: Marek Sapota — Cortex
---

# Cortex
My master’s thesis in Computer Science project.  The thesis itself is available
[online](/thesis.html).

Cortex is a collection of software that together provides a distributed hosting
platform for web applications.  Cortex implements a private cloud hosting
platform.  The idea is that you install Cortex on some server machines and you
get a private cloud to which you can “push” web applications without manually
configuring the application servers.

Cortex provides a working hosting solution, but since currently I do not host
any big web applications I do not use Cortex myself, which means I do not
develop it any more.

## Miranda
Miranda is a distributed, self-replicating, key-value store that is used by
other modules as a database and a communication bus.

## Saffron
Saffron is responsible for maintaining requested number of running application
instances by spawning new ones and terminating existing instances in case a
machine gets overloaded.

## G23
G23 is a supporting utility that cleans up after improperly terminated Saffron
instances.

## Ariel
Ariel provides a load balancer that creates a single entry point to all web
application instances running on Cortex.

## Vera
Vera is a command line application providing a user interface for managing the
platform.

# Links
- [Cortex repo on Github](https://github.com/maarons/Cortex)
