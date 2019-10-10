Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55ECC4360C
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 19:28:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 798F6214E0
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 19:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570735737;
	bh=7lgn1mTAdY2Q0/cnNJCueLW+UKQ7PFN1+U6wph1PkOE=;
	h=Date:From:To:Subject:List-ID:From;
	b=KwqB0D0NRwtGV/X3UzdW+xul5la9BwYZm6mJh32BYphg767a3Wraowh3/TOnvc/hk
	 d+6YR9fjWZfzABzPYF4GB2pJvPN/jQiJFtcuxIKeSQd4Ifoe0tY/+Yy3XfHzhJlkAR
	 1L91gMddnYb4n0hCXfaVJ8BlSh0+kY0yU8yApEbU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbfJJT25 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 15:28:57 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:36587 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfJJT24 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 10 Oct 2019 15:28:56 -0400
Received: by mail-qt1-f196.google.com with SMTP id o12so10400831qtf.3
        for <workflows@vger.kernel.org>; Thu, 10 Oct 2019 12:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=Xna+Zll6k0sfl71uer9iWFaXQk5lDYDUPRTb3HGi44g=;
        b=Clbp75M/ltyTzzvPQeF3fYnTGXlp0W/Ht+u07vzd0xi0bSSCmeKI+oRzizZ+nWyogK
         O0AtReWtRUjkMWQ2X1WfS1eQpptHdtBVBCfGk0TBNLAksL9viAj3gi0lI9sAzhXybawr
         oCg7TTVpkJlp4agfywK5rlwe98CeILcDX1Ouw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=Xna+Zll6k0sfl71uer9iWFaXQk5lDYDUPRTb3HGi44g=;
        b=ZNJCApKDObYVF5f0Mz+iejNiMP4cnG+joQMy2skmNEcVDro2OIUC1C8F2H+N/A6AIO
         lCfdX2AdUZG1q8cFUsDUoeI7Oe+H9zOHwm30bmOfQWRiKpIvBD5Aisp9OgBBRhv6eQeb
         mkIIKO7s29fD1XF1imHMKFGMLmIPtaAaOeKybya0duWrk8ZGvD6PZWXQNwHBmifQ0LuK
         VA2l97NWZXGXF7EbKlQXW8x57U0xkSC0OhFpmXSaBFuij6GeKLBn+BNFWEIYBJwxLorx
         0VVNh3BaUBR7cBU0yvwYZ1Gd1F5K07JiJ5oDydh5X7n3H5txMZp9IjQzy07jrXhAbFsr
         dYlQ==
X-Gm-Message-State: APjAAAUtEwAcwK4qhp5cv3dA9xh6+gz+DY55tepycpNQNvT/bEVrJ6K2
        htTMJcF8UEMkOBrvjTKXD90P8ziF83SO9g==
X-Google-Smtp-Source: APXvYqw4PSLgAHmEH0IerYVDh7I5cQ9TTQBH1elJAiw5kJEsDoTCgkEBRwdwYBzb1xD8Snb8rT44xA==
X-Received: by 2002:ad4:524c:: with SMTP id s12mr11728790qvq.244.1570735735071;
        Thu, 10 Oct 2019 12:28:55 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id n4sm3117300qkc.61.2019.10.10.12.28.54
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 12:28:54 -0700 (PDT)
Date:   Thu, 10 Oct 2019 15:28:52 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     workflows@vger.kernel.org
Subject: RFC: individual public-inbox/git activity feeds
Message-ID: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi, all:

The idea of using public-inbox repositories as individual feeds has been 
mentioned here a couple of times already, and I would like to propose a 
tentative approach that could work without needing to involve SSB or 
other protocols.

# What are public-inbox repos?

Public-inbox (v2) uses git to archive mail messages, with the following 
general structure:

topdir/
  0.git/
  1.git/
  ...

Each of these git repositories has a single ref, master, with a single 
file "m" containing the entire body of the message, e.g.:
  - https://erol.kernel.org/workflows/git/0/tree/m

Each incoming message overwrites this file and creates a new commit, 
e.g.:
  - https://erol.kernel.org/workflows/git/0/log/m

This has the following upsides:

  - with a single file, git commit operations are very fast
  - git performance remains pretty much unaffected as repository grows, 
    since there aren't more and more objects to hash (the main downside 
    of public-inbox v1).
  - it is easy to get the contents of any message by simply performing 
    `git show <commit hash>:m`, which is a very fast operation even for 
    very old messages in the archive
  - most language environments have decent git libraries, so writing 
    tooling around git repositories is easy
  - git is really good at replicating itself, especially with a single 
    ref
  - git supports commit signing, so all commits can have cryptographic 
    attestation if the tools are configured to do that

There are a few downsides to this, too:

  - git maintenance tools like git-repack don't expect that repository 
    contents are going to be 90%-100% rewritten with every new commit, 
    so by default it will try to perform many rather useless 
    optimizations looking for non-existent deltas (but this can be 
    tweaked in config files)
  - most useful operations require maintaining auxiliary databases, e.g.  
    for message-id to commit-id mapping -- so repositories need to be 
    indexed using public-inbox-index in order to be useful for more than 
    just archival and replication. For huge repositories like LKML, the 
    initial indexing takes a long time, though subsequent 
    public-inbox-index calls after each `git remote update` are pretty 
    quick.
  - there is only rudimentary sharding into epochs, which makes partial 
    replication tricky (e.g. "replicate just the archives from last 
    October")

# Public-inbox repositories are feeds

Each public-inbox repository is therefore a consecutive feed of messages 
in the same sense something like SSB or NNTP is (for this reason, 
there's robust NNTP support in public-inbox). Public-inbox feeds are:

  - distributed
  - immutable (or tamper-evident once replicated, which is effectively 
    the same as immutable if git is configured to reject non-ff updates)
  - cryptographically attestable, if commit signing is used

# Individual developer feeds

Individual developers can begin providing their own public-inbox feeds.
At the start, they can act as a sort of a "public sent-mail folder" -- a 
simple tool would monitor the local/IMAP "sent" folder and add any new 
mail it finds (sent to specific mailing lists) to the developer's local 
public-inbox instance. Every commit will be automatically signed and 
pushed out to a public remote. 

On the kernel.org side, we can collate these individual feeds and mirror 
them into an aggregated feeds repository, with a ref per individual 
developer, like so:

refs/feeds/gregkh/0/master
refs/feeds/davem/0/master
refs/feeds/davem/1/master
...

Already, this gives us the following perks:

  - cryptographic attestation
  - patches that are guaranteed against mangling by MTA software
  - guaranteed spam-free message delivery from all the important people
  - permanent, attestable and distributable archive

(With time, we can teach kernel.org to act as an MTA bridge that sends 
actual mail to the mailing lists after we receive individual feed 
updates.)

# Using public-inbox with structured data

One of the problems we are trying to solve is how to deliver structured 
data like CI reports, bugs, issues, etc in a decentralized fashion.  
Instead of (or in addition to) sending mail to mailing lists and 
individual developers, bots and bug-tracking tools can provide their own 
feeds with structured data aimed at consumption by client-side and 
server-side tools.

I suggest we use public-inbox feeds with structured data in addition to 
human-readable data, using some universally adopted machine-parseable
format like JSON. In my mind, I see this working as a separate ref in 
each individual feed, e.g.:

refs/heads/master -- RFC-2822 (email) feed for human consumption
refs/heads/json -- json feed for machine-readable structured data

E.g. syzbot could publish a human-readable message in master:

----
From: syzbot
To: [list of addressees here]
Subject: BUG: bad usercopy in read_rio
Date: Wed, 09 Oct 2019 09:09:06 -0700

Hello,

syzbot found the following crash on:

HEAD commit:    58d5f26a usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=149329b3600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aa5dac3cda4ffd58
dashboard link: https://syzkaller.appspot.com/bug?extid=43e923a8937c203e9954
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

...
----

The same data, including all the relevant info provided via
syzkaller.appspot.com links would be included in the structured-section 
commit, allowing client-side tools to present it to the developer 
without requiring that they view it on the internet (or simply included 
for archival purposes).

The same approach can be used by bugzilla and any other bug-tracking 
software -- a human-readable commit in master, plus a corresponding 
machine-formatted commit in refs/heads/json. Minor record changes that 
aren't intended for humans can omit the commit in master (to avoid
the usual noise of "so-and-so started following this bug" messages). All 
commits would be cryptographically signed and fully attestable.

All these feeds can be aggregated centrally by entities like kernel.org 
for ease of discovery and replication, though this process would be 
human-administered and not automatic.

# Where this falls short

This is an archival solution first and foremost and not a true 
distributed, decentralized communication fabric. It solves the following 
problems:

  - it gets us cryptographically attestable feeds from important people 
    with little effort on their part (after initial setup)
  - it allows centralized tools (bots, forges, bug trackers, CI) to 
    export internal data so it can be preserved for future reference or 
    consumed directly by client-side tools -- though it obviously 
    requires that vendors jump on this bandwagon and don't simply ignore 
    it
  - it uses existing technologies that are known to work well together
    (public-inbox, git) and doesn't require that we adopt any nascent 
    technologies like SSB that are still in early stages of development 
    and haven't yet had time to mature

What this doesn't fix:

  - we still continue to largely rely on email and mailing lists, though 
    theoretically their use would become less important as more 
    developer feeds are aggregated and maintainer tools start to rely on 
    those as their primary source of truth. We can easily see a future 
    where vger.kernel.org just writes to public-inbox archives and 
    leaves mail delivery and subscription management up to someone else.
  - we still need aggregation authorities like kernel.org -- though we 
    can hedge this by having multiple mirrors and publishing a manifest 
    of feeds that can be pulled individually if needed
  - this doesn't really get us builtin encrypted communication between 
    developers, though we can think of some clever solutions, such as
    keypairs per incident that are initially only distributed to members 
    of security@kernel.org and then disclosed publicly after embargo is 
    lifted, allowing anyone interested to go back and read the encrypted 
    discussion for the purpose of full transparency.

The main upside of this approach is that it's evolutionary and not 
revolutionary and we can start implementing it right away, using it to 
augment and improve mailing lists instead of replacing them outright.

-K
