---
title: Marek Sapota — GNU WebSocket4J
---

# GNU WebSocket4J

## Warning

GNU WebSocket4J implements an old version of the WebSocket protocol.  I
currently do not have time to update this library, contact me if you are
interested in contributing an implementation of the new protocol and/or taking
over this project.

## What is GNU WebSocket4J?

GNU WebSocket4J is a [WebSocket protocol](
http://www.whatwg.org/specs/web-socket-protocol/) implementation in Java. It
allows you to build Web applications that interact with applications running on
JVM. GNU WebSocket4J implements both server and client side of the protocol, so
it can be used to build both WebSocket servers and clients.

GNU WebSocket4J is free software licensed under terms of GNU GPLv2 (or later)
with linking exception. Feel free to modify and improve!

## Where can I get it?

You can download GNU WebSocket4J releases from [Launchpad](
https://launchpad.net/websocket4j/+download). If you want the bleeding edge
version, use GNU Bazaar:

    bzr branch lp:websocket4j

GNU WebSocket4J Reference Manual in HTML format is available for download along
the source from Launchpad, but it is also available in different formats [here](
http://www.gnu.org/software/websocket4j/manual/).

## There are WebSocket implementations in Java already, why make a new one?

I needed something simple, something that could be used as easy as WebSockets in
JavaScript. At the time when I started this library no Java implementations met
my criteria, so I made my own.

## Can I help?

Help is always welcome.

If you want to report a bug, it is easiest to use Launchpad’s [web interface](
https://bugs.launchpad.net/websocket4j). If you prefer sending bug reports by
email, you can use [bug-websocket4j@gnu.org]( mailto:bug-websocket4j@gnu.org)
address. Please consult [this]( https://help.launchpad.net/Bugs/EmailInterface)
guide to see how bug mail should be formatted.

## Can I get help?

Launchpad provides a support tracker that can be reached [here](
https://answers.launchpad.net/websocket4j). There is also
[help-websocket4j@gnu.org]( mailto:help-websocket4j@gnu.org) mailing list that
you can use (you can subscribe [here](
https://lists.gnu.org/mailman/listinfo/help-websocket4j)).

## Show me some examples!

Example echo server and client are included in the distribution and in the
Reference Manual. This examples are also available online: [echo server](
http://bazaar.launchpad.net/~maarons-gnu/websocket4j/trunk/annotate/head:/src/websocket4j/examples/EchoAndTimeServer.java),
[echo client](
http://bazaar.launchpad.net/~maarons-gnu/websocket4j/trunk/annotate/head:/src/websocket4j/examples/EchoClient.java).

## I would like to see more resources about GNU WebSocket4J.

- [Code, bugs, questions, announcements and blueprints on Launchpad](
  https://launchpad.net/websocket4j)
- [Mailing lists on Savannah](https://savannah.gnu.org/projects/websocket4j/)
- [Freecode record](http://freecode.net/projects/websocket4j)
- [Ohloh record](http://www.ohloh.net/p/websocket4j)
