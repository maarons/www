---
title: Marek Sapota — MailChariot
---

# MailChariot

# Warning
This project is abandoned — if you choose to use it you will have to maintain it
yourself.

I have created MailChariot to prevent huge amounts of spam I was getting from
polluting my inbox and in a way the project was successful.  MailChariot can
pipe incoming mail through a spam filter and it can help you retrain the spam
filter if it had made a mistake.  Sounds good but unfortunately the spam filter
I have used — the immensely famous SpamAssassin — is a slow, buggy and useless
piece of junk that can not detect spam even after training it for several
months.  Because of this failure I had to severely modify my mail flow and in
the process MailChariot got replaced by Dovecot’s antispam plugin.

# About

MailChariot’s mission is quite simple:

1. Take your incoming mail (from `/var/spool/mail` for example).
2. Filter your emails through a spam filter like SpamAssassin.
3. Depending on the verdict put your email into ham or spam mailbox.
4. If you disagree with spam filter’s choice you can move the email into notham
   or notspam mailbox and MailChariot will let spam filter know that it was
   wrong.  Mail that you put into notspam folder will be moved to ham folder
   afterwards.

Notice that all of this is mail reader agnostic.  Marking messages as spam only
requires moving an email to a mailbox, so it is not important if you use
Thunderbird, Mutt or whatever.

If you are on a shared host without root privileges and your admins do a bad job
of keeping your mailbox spam free, you can use MailChariot to filter the mail
yourself.

# Reliability

MailChariot makes the best effort to keep your email safe.  In no instance your
email is stored only in memory, it is removed from your mailbox only if it is
already saved in some other safe place.  That being said if some other process
uses the same mailbox that MailChariot uses and does not do proper locking, the
mailbox might get corrupted.

Please remember that this software is provided without warranty of any kind, so
if it does destroy your email you will not have anyone but yourself to complain
to.

# Usage

If you were not scared by the note above, below you will find a guide how to
configure and use MailChariot.  Do not get frightened by all this options,
probably default settings will be OK and you will not have to write anything.

# Configuration

MailChariot’s configuration file should be present in
“`${HOME}/.MailChariot.conf`”.  If it is not there, all configuration values
will be set to defaults.  Configuration file is in INI format read by Python’s
ConfigParser module.  Following examples show default values for configuration
options (used when you do not supply one yourself), “`${X}`” syntax means value
of environmental variable `X`.

## Mailbox paths

Queue path should start at “`/`”, paths to mailboxes can start at “`~/`”.  All
intermediate paths should exist before you run MailChariot, with default
settings that would mean that “`${HOME}/.MailChariot`” folder should be created.

    [Paths]
    ; This is where new mail arrives, MailChariot will get mail from here and put
    ; it in ham and spam mailboxes.
    inbox: /var/spool/mail/${USER}
    ; Mailboxes where filtered mail will arrive.
    ham: ${HOME}/.MailChariot/ham
    spam: ${HOME}/.MailChariot/spam
    ; Mailboxes used for marking message as spam or ham.
    notham: ${HOME}/.MailChariot/notham
    notspam: ${HOME}/.MailChariot/notspam
    ; This is where your mail goes from inbox, notham and notspam mailboxes before
    ; MailChariot actually deals with it.
    queue: ${HOME}/.MailChariot/chariot-queue

## Mailbox formats

Maildir and mbox formats are supported, but Maildir is recommended as it is less
likely to be corrupted.

    [Format]
    inbox: mbox
    ham: Maildir
    spam: Maildir
    notham: Maildir
    notspam: Maildir

## Spam filter commands

`Cleanup` command will be run before classification or marking as ham/spam.  By
default it removes existing SpamAssassin markup.  All commands get the message
as standard input, `cleanup` and `classify` commands should return the message
as standard output (probably with changed headers).  All commands should exit
with exit code 0 if they succeeded.

    [Commands]
    cleanup: spamassassin -d
    classify: spamassassin -L
    learn_spam: sa-learn --spam
    learn_ham: sa-learn --ham

## Classification

    [Classification]
    ; If (after running classify method) given header contains given string it
    ; will be treated as spam.
    header: X-Spam-Flag
    spam: YES

# SpamAssassin configuration tips

SpamAssassin (as of version 3.2) has lots of bugs and will probably cause
problems.  If it hangs it should be safe to kill SpamAssassin process - it will
not kill MailChariot and MailChariot should retry operation that was
interrupted.

If you do not want to perform time consuming synchronization while running
spamassassin and sa-learn, you should add following lines to your SpamAssassin
configuration.

    bayes_learn_to_journal 1
    bayes_journal_max_size 0

If you use this configuration it is important to run “`sa-learn --sync`” from
time to time.  It is advised to turn MailChariot off before running
synchronization, as noted before SpamAssassin is of really poor quality and
might deadlock with other SpamAssassin instances or do some other unpredictable
thing.

# Running MailChariot

    chariot

Above command should run MailChariot that will start monitoring your mailboxes
and moving emails around.  Above command has some additional options, you can
use the “`--help`” switch to see them all.  To exit MailChariot send it a SIGINT
(usually `C-c` in a terminal), it will finish whatever it is doing and shut down
gracefully.  Any other terminating signal, such as SIGKILL or SIGTERM, will shut
MailChariot down immediately.  This should not damage any emails that you have,
but it is better not to try it=).

MailChariot should work with Python 2.6, 2.7 and 3.x, if it does not file a bug
report.

# Example Mutt configuration

Following configuration opens your ham folder by default (instead of your
spoolfile) and adds “`S`” and “`H`” macros that mark a message as spam or ham
respectively.  They also work with several marked messages and “`;S`” or “`;H`”.

    set mbox_type=Maildir

    # move message to notham or notspam folder
    macro index,pager S "~/.MailChariot/notham" "mark message as spam"
    macro index,pager H "~/.MailChariot/notspam" "mark message as ham"

    # Open this folder by default
    set spoolfile=~/.MailChariot/ham

    mailboxes ~/.MailChariot/ham
    mailboxes ~/.MailChariot/spam

# Links
- [MailChariot repo on Launchpad](https://launchpad.net/mailchariot)
- [Freecode record](http://freecode.net/projects/mailchariot)
