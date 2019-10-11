Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242E4C47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 17:15:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF09F206A1
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 17:15:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mcCRgzrD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbfJKRP0 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 13:15:26 -0400
Received: from mail-qk1-f180.google.com ([209.85.222.180]:45300 "EHLO
        mail-qk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727984AbfJKRP0 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 13:15:26 -0400
Received: by mail-qk1-f180.google.com with SMTP id z67so9518276qkb.12
        for <workflows@vger.kernel.org>; Fri, 11 Oct 2019 10:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ma3ort9NJLBMUjWqcbLlF+M0+F3wqjkDbQzPJOV8BGQ=;
        b=mcCRgzrDGnXhyFN7sFjy5uoey/EayWQyXZr9ue1juv4/3geIsSCRYKMoUmQRdZrQ6X
         fAyctJIq5gIrZQGu1vYrmBy1R0uEcS8y+IyjubG1Xg4/ZOcS6q5EnuKilJfk6powbvhk
         Ar04yQ3RLf9bTlH4Uwb6x8y2/uM9rqqU/LjW2K0rc+NkukVn1UEyTSXlMnfBTjshVvj0
         S4lkWBLBga9TUsYxpoA9GAOThMxZcdc7lqcmCkgXXDJZZnWJMOUWWCaADB5r/m3uZ9JG
         yMVJyUbZjHbBy/G8MPuzlIXOrq/gulER2e7tqWfkpmsVpThFQdQceOX8YQ2AERBPNaob
         DVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ma3ort9NJLBMUjWqcbLlF+M0+F3wqjkDbQzPJOV8BGQ=;
        b=blCwYYNvkjY/lrWP4Hf2hJOkKPDq2ItWKtX9KU72osFsFQVRD8JlZXGCecgdopaXc0
         +BW+YxclXk+NOG+mYK4TyCAnzHg3WphdLenzc1iheJXMsCXOOVR6JoZreQBl6t/JjCWN
         EVgw8+xuMEnxYQP3Y95+q52N1niWLY0YPjjzoqlKK5kaiWkYFQLG1Z2PGLkrzSe+n/sm
         0n5SqOgI0OPsH2jPmronoXiXZ8X4w2p1AhmexxPyF0CYt7QsaE6JK9KpB8eOoLGFce1f
         hBs6HJAilzbTi2NFfhfm+/i7pc+WaH82i1hTwCQKD7xDyr6TnZOtWmotYdBO7YCmCwxa
         h/iw==
X-Gm-Message-State: APjAAAWx1AG0ZmD0pmlyuukHLojRFcC0UzoEQPCnnJcxQpbCbDt4pvKR
        LwA9jxXteMFd+K98yVpB69h/NWrpa2pQ1TH0ckwNmK3Zt/4=
X-Google-Smtp-Source: APXvYqxaADf8Y3AGmJrB//4QR5ugNnSabSN2qoXjZUwzG/YbRGBZbtDx/R9O6R1+XZ5DL4qevh/BTLFk1+utKA1KArM=
X-Received: by 2002:a37:4a87:: with SMTP id x129mr16424205qka.43.1570814124543;
 Fri, 11 Oct 2019 10:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local>
In-Reply-To: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 11 Oct 2019 19:15:12 +0200
Message-ID: <CACT4Y+YddN06rOcE0jc8rVixamHSJALNvGLfzLk2moutL_9rTg@mail.gmail.com>
Subject: Re: RFC: individual public-inbox/git activity feeds
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Oct 10, 2019 at 9:29 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hi, all:
>
> The idea of using public-inbox repositories as individual feeds has been
> mentioned here a couple of times already, and I would like to propose a
> tentative approach that could work without needing to involve SSB or
> other protocols.
>
> # What are public-inbox repos?
>
> Public-inbox (v2) uses git to archive mail messages, with the following
> general structure:
>
> topdir/
>   0.git/
>   1.git/
>   ...
>
> Each of these git repositories has a single ref, master, with a single
> file "m" containing the entire body of the message, e.g.:
>   - https://erol.kernel.org/workflows/git/0/tree/m
>
> Each incoming message overwrites this file and creates a new commit,
> e.g.:
>   - https://erol.kernel.org/workflows/git/0/log/m
>
> This has the following upsides:
>
>   - with a single file, git commit operations are very fast
>   - git performance remains pretty much unaffected as repository grows,
>     since there aren't more and more objects to hash (the main downside
>     of public-inbox v1).
>   - it is easy to get the contents of any message by simply performing
>     `git show <commit hash>:m`, which is a very fast operation even for
>     very old messages in the archive
>   - most language environments have decent git libraries, so writing
>     tooling around git repositories is easy
>   - git is really good at replicating itself, especially with a single
>     ref
>   - git supports commit signing, so all commits can have cryptographic
>     attestation if the tools are configured to do that
>
> There are a few downsides to this, too:
>
>   - git maintenance tools like git-repack don't expect that repository
>     contents are going to be 90%-100% rewritten with every new commit,
>     so by default it will try to perform many rather useless
>     optimizations looking for non-existent deltas (but this can be
>     tweaked in config files)
>   - most useful operations require maintaining auxiliary databases, e.g.
>     for message-id to commit-id mapping -- so repositories need to be
>     indexed using public-inbox-index in order to be useful for more than
>     just archival and replication. For huge repositories like LKML, the
>     initial indexing takes a long time, though subsequent
>     public-inbox-index calls after each `git remote update` are pretty
>     quick.
>   - there is only rudimentary sharding into epochs, which makes partial
>     replication tricky (e.g. "replicate just the archives from last
>     October")
>
> # Public-inbox repositories are feeds
>
> Each public-inbox repository is therefore a consecutive feed of messages
> in the same sense something like SSB or NNTP is (for this reason,
> there's robust NNTP support in public-inbox). Public-inbox feeds are:
>
>   - distributed
>   - immutable (or tamper-evident once replicated, which is effectively
>     the same as immutable if git is configured to reject non-ff updates)
>   - cryptographically attestable, if commit signing is used
>
> # Individual developer feeds
>
> Individual developers can begin providing their own public-inbox feeds.
> At the start, they can act as a sort of a "public sent-mail folder" -- a
> simple tool would monitor the local/IMAP "sent" folder and add any new
> mail it finds (sent to specific mailing lists) to the developer's local
> public-inbox instance. Every commit will be automatically signed and
> pushed out to a public remote.
>
> On the kernel.org side, we can collate these individual feeds and mirror
> them into an aggregated feeds repository, with a ref per individual
> developer, like so:
>
> refs/feeds/gregkh/0/master
> refs/feeds/davem/0/master
> refs/feeds/davem/1/master
> ...
>
> Already, this gives us the following perks:
>
>   - cryptographic attestation
>   - patches that are guaranteed against mangling by MTA software
>   - guaranteed spam-free message delivery from all the important people
>   - permanent, attestable and distributable archive
>
> (With time, we can teach kernel.org to act as an MTA bridge that sends
> actual mail to the mailing lists after we receive individual feed
> updates.)
>
> # Using public-inbox with structured data
>
> One of the problems we are trying to solve is how to deliver structured
> data like CI reports, bugs, issues, etc in a decentralized fashion.
> Instead of (or in addition to) sending mail to mailing lists and
> individual developers, bots and bug-tracking tools can provide their own
> feeds with structured data aimed at consumption by client-side and
> server-side tools.
>
> I suggest we use public-inbox feeds with structured data in addition to
> human-readable data, using some universally adopted machine-parseable
> format like JSON. In my mind, I see this working as a separate ref in
> each individual feed, e.g.:
>
> refs/heads/master -- RFC-2822 (email) feed for human consumption
> refs/heads/json -- json feed for machine-readable structured data
>
> E.g. syzbot could publish a human-readable message in master:
>
> ----
> From: syzbot
> To: [list of addressees here]
> Subject: BUG: bad usercopy in read_rio
> Date: Wed, 09 Oct 2019 09:09:06 -0700
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    58d5f26a usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=149329b3600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=aa5dac3cda4ffd58
> dashboard link: https://syzkaller.appspot.com/bug?extid=43e923a8937c203e9954
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> ...
> ----
>
> The same data, including all the relevant info provided via
> syzkaller.appspot.com links would be included in the structured-section
> commit, allowing client-side tools to present it to the developer
> without requiring that they view it on the internet (or simply included
> for archival purposes).
>
> The same approach can be used by bugzilla and any other bug-tracking
> software -- a human-readable commit in master, plus a corresponding
> machine-formatted commit in refs/heads/json. Minor record changes that
> aren't intended for humans can omit the commit in master (to avoid
> the usual noise of "so-and-so started following this bug" messages). All
> commits would be cryptographically signed and fully attestable.
>
> All these feeds can be aggregated centrally by entities like kernel.org
> for ease of discovery and replication, though this process would be
> human-administered and not automatic.
>
> # Where this falls short
>
> This is an archival solution first and foremost and not a true
> distributed, decentralized communication fabric. It solves the following
> problems:
>
>   - it gets us cryptographically attestable feeds from important people
>     with little effort on their part (after initial setup)
>   - it allows centralized tools (bots, forges, bug trackers, CI) to
>     export internal data so it can be preserved for future reference or
>     consumed directly by client-side tools -- though it obviously
>     requires that vendors jump on this bandwagon and don't simply ignore
>     it
>   - it uses existing technologies that are known to work well together
>     (public-inbox, git) and doesn't require that we adopt any nascent
>     technologies like SSB that are still in early stages of development
>     and haven't yet had time to mature
>
> What this doesn't fix:
>
>   - we still continue to largely rely on email and mailing lists, though
>     theoretically their use would become less important as more
>     developer feeds are aggregated and maintainer tools start to rely on
>     those as their primary source of truth. We can easily see a future
>     where vger.kernel.org just writes to public-inbox archives and
>     leaves mail delivery and subscription management up to someone else.
>   - we still need aggregation authorities like kernel.org -- though we
>     can hedge this by having multiple mirrors and publishing a manifest
>     of feeds that can be pulled individually if needed
>   - this doesn't really get us builtin encrypted communication between
>     developers, though we can think of some clever solutions, such as
>     keypairs per incident that are initially only distributed to members
>     of security@kernel.org and then disclosed publicly after embargo is
>     lifted, allowing anyone interested to go back and read the encrypted
>     discussion for the purpose of full transparency.
>
> The main upside of this approach is that it's evolutionary and not
> revolutionary and we can start implementing it right away, using it to
> augment and improve mailing lists instead of replacing them outright.


Interesting. This is similar to SSB on _some_ level, right? Because
it's just a different type of transport. I personally don't have any
horses in the transport race (as long as it is easy to setup and
provides a good foundation for transferring structured data).

What attracted my attention is this part:

refs/feeds/gregkh/0/master
refs/feeds/davem/0/master
refs/feeds/davem/1/master

Will this provide a total ordering over all messages by all
participants? That may be a significant advantage over SSB then (see
point 14 in [1]). But the "that can be pulled individually" part
breaks this (complete read-only mirrors for fault-tolerance are fine,
though).

This may also need some form of DoS protection (esp as we move further
from email).

I also tend to conclude that some actions should not be done offline
and then "synced" a week later. Ted provided an example of starting
tests in another thread. Or, say if you close a bug and then push than
update a month later without any regard to the current bug state, that
may not be the right thing. Working with read-only data offline is
perfectly fine. Doing _some_ updates locally and then pushing a week
later is fine (e.g. queue a new patch for review). But not necessary
all updates should be doable in offline mode. And this seems to be
inherent conflict with any scheme where one can "queue" any updates
locally, and then "sync" them anytime later without any regard to the
current state of things and just tell the system and all other
participants "deal with it". Also, if we have any kind of
permissions/quotas, when are these checks done: when one creates an
update or when it's synced?

This is interesting too:

refs/heads/master -- RFC-2822 (email) feed for human consumption
refs/heads/json -- json feed for machine-readable structured data

Playing devil's advocate, what about MIME? :)
It does not need to be completely arbitrary MIME, but say only 2
alternative section, first has to be plain/text, second (optional) has
to be kthul/json. Say, "kthul mail" creates that properly formed email
with plain text and all structured data. Or, CI creates both human
readable and machine readable form. It seems reasonable to keep both
versions together.
Though, it's not that I thought it all out and strongly advocating
this. Just a potential interesting option.

[1] https://lore.kernel.org/workflows/CACT4Y+YU78dQUeFob7NXaOU-gjnKHtxpceQj2c4=2aBV0_PSxg@mail.gmail.com/T/#t
