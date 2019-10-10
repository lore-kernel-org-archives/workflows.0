Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789E9C4360C
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 23:57:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A68A208C3
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 23:57:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbfJJX50 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 19:57:26 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:54216 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbfJJX50 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 10 Oct 2019 19:57:26 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 236141F4C0;
        Thu, 10 Oct 2019 23:57:25 +0000 (UTC)
Date:   Thu, 10 Oct 2019 23:57:25 +0000
From:   Eric Wong <e@80x24.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Subject: Re: RFC: individual public-inbox/git activity feeds
Message-ID: <20191010235725.GA15427@dcvr>
References: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

<snip a bunch of stuff I agree with>

> # Individual developer feeds

<snip>

> (With time, we can teach kernel.org to act as an MTA bridge that sends
> actual mail to the mailing lists after we receive individual feed updates.)

I'm skeptical and pessimistic about that bit happening (as I
usually am :>).  But the great thing is all that stuff can
happen without disrupting/changing existing workflows and is
totally optional.

> # Using public-inbox with structured data
> 
> One of the problems we are trying to solve is how to deliver structured data
> like CI reports, bugs, issues, etc in a decentralized fashion.  Instead of
> (or in addition to) sending mail to mailing lists and individual developers,
> bots and bug-tracking tools can provide their own feeds with structured data
> aimed at consumption by client-side and server-side tools.
> 
> I suggest we use public-inbox feeds with structured data in addition to
> human-readable data, using some universally adopted machine-parseable
> format like JSON. In my mind, I see this working as a separate ref in each
> individual feed, e.g.:
> 
> refs/heads/master -- RFC-2822 (email) feed for human consumption
> refs/heads/json -- json feed for machine-readable structured data

Having a side-channel in addition to email make people learn and
use new tools (not good).  Furthermore, that data likely end up
in commit messages, and have to be translated from JSON...

Instead, the structured data should be RFC822-like so
"git interpret-trailers" can write it.  It'd probably be
similar to Debbugs:

  https://lore.kernel.org/workflows/20191008213626.GB8130@dcvr/

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

That's already close enough to git trailers (s/ /-/).
> ...
> ----
> 
> The same data, including all the relevant info provided via
> syzkaller.appspot.com links would be included in the structured-section
> commit, allowing client-side tools to present it to the developer without
> requiring that they view it on the internet (or simply included for archival
> purposes).

That seems redundant given the above.

> The same approach can be used by bugzilla and any other bug-tracking
> software -- a human-readable commit in master, plus a corresponding
> machine-formatted commit in refs/heads/json. Minor record changes that
> aren't intended for humans can omit the commit in master (to avoid
> the usual noise of "so-and-so started following this bug" messages). All
> commits would be cryptographically signed and fully attestable.

If those bug trackers can already interpret stuff like "Fixes:"
in the kernel commit messages, making them deal with JSON or
another channel is too much.  If they can't deal with "Fixes:",
then there's no expectation they'd deal with a new JSON
thing, either.

"so-and-so following messages" don't need to be public info.

> All these feeds can be aggregated centrally by entities like kernel.org for
> ease of discovery and replication, though this process would be
> human-administered and not automatic.
> 
> # Where this falls short
> 
> This is an archival solution first and foremost and not a true distributed,
> decentralized communication fabric. It solves the following problems:
> 
>  - it gets us cryptographically attestable feeds from important people
> with little effort on their part (after initial setup)
>  - it allows centralized tools (bots, forges, bug trackers, CI) to    export
> internal data so it can be preserved for future reference or    consumed
> directly by client-side tools -- though it obviously    requires that
> vendors jump on this bandwagon and don't simply ignore    it
>  - it uses existing technologies that are known to work well together
>    (public-inbox, git) and doesn't require that we adopt any nascent
> technologies like SSB that are still in early stages of development    and
> haven't yet had time to mature

Even the JSON feed is too much to ask people to adopt.

<snip>

> The main upside of this approach is that it's evolutionary and not
> revolutionary and we can start implementing it right away, using it to
> augment and improve mailing lists instead of replacing them outright.

That.  We should take these one small step-at-a-time and see
where things take us.  The key is to remain harmonious with
existing workflows and be transparent to people who won't
change.

Same thing worked for git-svn obsoleting Subversion.  I just
don't want to end up with a proprietary/centralized InboxHub
this time around :P
