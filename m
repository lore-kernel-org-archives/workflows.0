Return-Path: <SRS0=MafL=YF=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FB2C4360C
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 07:50:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF5122190F
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 07:50:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="mbh4P1Jb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iu7yt7Z8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbfJLHu1 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 12 Oct 2019 03:50:27 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:39875 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726728AbfJLHu1 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 12 Oct 2019 03:50:27 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id BB43B210F2;
        Sat, 12 Oct 2019 03:50:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 12 Oct 2019 03:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=mbHL+AQ+7qfYVCDIc1+dqFyhfEe
        30/H9pCZbyUHxmKo=; b=mbh4P1JbbFSlhlXQHES1ufOVZq2Oc52cycqjW5g0XZN
        rAiSuwnNSugUJZSQs7CRPJk+ypVtBZv7+rxV4JZG1+zYC3FWrTTSg8wRkMK1Zsbt
        K96T2K4kDJE/pM3oJaMYFTOjpHSYdnozZxPDqu2G3z5fb9zse9+OmiWKPoIGhJ6T
        PPXAXQySOPBfmV4pE9Mq8wZQIzscunKpNiDkhMI2B4KLibid8BfW/2EvbVqA507H
        cEFnPe9eAER9kL0xHJQ8RqgUfZnLpe5EhUvPX5WsjinsPfA6wliW3Oe/nBlZW+Ef
        nStiQvnVaBB5XBFiG6GWBMTF9KdW67Kb0x41vp6ItKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mbHL+A
        Q+7qfYVCDIc1+dqFyhfEe30/H9pCZbyUHxmKo=; b=iu7yt7Z84VLB2gvCSLggF2
        UwPYEWjOVryx8RWUgr1fszGuPzeBPUmprUIc9AlMaXi8S2W5aYxXyl14ySayDt24
        xaoA1D+miu2AbTxwtMVuPepL1kE6K98Ri7fsjT7hxC1uTMFUlKubqV5pG3RYsxgR
        egbsKRVFTX01Exl51ENk/CmtGfALC8a2EXMxz9lvRK3NXHcaxUaGe0404NXlkQmo
        g3+wMDl3ZSQ99xilQrhU3bW242VQnFa5NeHqb9gx2ZmDv9CQ9yuB+rj+XaPMYFMd
        2yTxt3EeCFn0maWCKBAI6Gya+PDafgd5I+26KWQkrpBZiBEwPtboAf5FL29puimw
        ==
X-ME-Sender: <xms:wYWhXaHKOzReYzsWNCMD9U8AhSU8GnQ0_Slb6wxU-j5v8TDNtfqeNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrieeigdejudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    fuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvuffkfhggtggujggf
    sehttdertddtredvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrd
    gtohhmqeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdp
    rghpphhsphhothdrtghomhenucfkphepiedvrdduudelrdduieeirdelnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucevlhhushhtvghrufhi
    iigvpedt
X-ME-Proxy: <xmx:wYWhXXM78Tu_wkKnLQ-FGz0W8cVp_Q-XRxSte3zsmEsR380cEQgEgg>
    <xmx:wYWhXfqIN9IuKjsa0JXp8UokKOr6S7mLQRITEi4zQG9H-6e02FWvjg>
    <xmx:wYWhXYDYoMw0oZcBSu-xXqicqwmciCb23_i4vd9tZ4AfcUQWNmLDIA>
    <xmx:wYWhXdINrRMpCt337Uk6GSfqRfTrs6SpYsy2N9s5BeGNr121oOfHhQ>
Received: from localhost (unknown [62.119.166.9])
        by mail.messagingengine.com (Postfix) with ESMTPA id 762368005C;
        Sat, 12 Oct 2019 03:50:24 -0400 (EDT)
Date:   Sat, 12 Oct 2019 09:50:20 +0200
From:   Greg KH <greg@kroah.com>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Subject: Re: RFC: individual public-inbox/git activity feeds
Message-ID: <20191012075020.GB2037204@kroah.com>
References: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Oct 10, 2019 at 03:28:52PM -0400, Konstantin Ryabitsev wrote:
> # Individual developer feeds
> 
> Individual developers can begin providing their own public-inbox feeds.
> At the start, they can act as a sort of a "public sent-mail folder" -- a
> simple tool would monitor the local/IMAP "sent" folder and add any new mail
> it finds (sent to specific mailing lists) to the developer's local
> public-inbox instance. Every commit will be automatically signed and pushed
> out to a public remote.
> 
> On the kernel.org side, we can collate these individual feeds and mirror
> them into an aggregated feeds repository, with a ref per individual
> developer, like so:
> 
> refs/feeds/gregkh/0/master

The stuff I send out is probably not all that interesting compared to
what is sent to me, given that I receive way more than I send.

> refs/feeds/davem/0/master
> refs/feeds/davem/1/master
> ...
> 
> Already, this gives us the following perks:
> 
>  - cryptographic attestation
>  - patches that are guaranteed against mangling by MTA software
>  - guaranteed spam-free message delivery from all the important people
>  - permanent, attestable and distributable archive
> 
> (With time, we can teach kernel.org to act as an MTA bridge that sends
> actual mail to the mailing lists after we receive individual feed updates.)

This would work well for developers that are "large producers" but that
doesn't help maintainers much, right?

I think I'm missing something, but what would a "feed that only comes
from gregkh" help out with?  Who wants to consume that?

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
> commit, allowing client-side tools to present it to the developer without
> requiring that they view it on the internet (or simply included for archival
> purposes).
> 
> The same approach can be used by bugzilla and any other bug-tracking
> software -- a human-readable commit in master, plus a corresponding
> machine-formatted commit in refs/heads/json. Minor record changes that
> aren't intended for humans can omit the commit in master (to avoid
> the usual noise of "so-and-so started following this bug" messages). All
> commits would be cryptographically signed and fully attestable.
> 
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
> 
> What this doesn't fix:
> 
>  - we still continue to largely rely on email and mailing lists, though
> theoretically their use would become less important as more    developer
> feeds are aggregated and maintainer tools start to rely on    those as their
> primary source of truth. We can easily see a future    where vger.kernel.org
> just writes to public-inbox archives and    leaves mail delivery and
> subscription management up to someone else.

That last one would make the vger.kernel.org admins happy :)

>  - we still need aggregation authorities like kernel.org -- though we    can
> hedge this by having multiple mirrors and publishing a manifest    of feeds
> that can be pulled individually if needed
>  - this doesn't really get us builtin encrypted communication between
> developers, though we can think of some clever solutions, such as
>    keypairs per incident that are initially only distributed to members
> of security@kernel.org and then disclosed publicly after embargo is
> lifted, allowing anyone interested to go back and read the encrypted
> discussion for the purpose of full transparency.

We have tools for that with Thomas's encrypted email server, don't know
if you want to roll that into this type of system or not.

> The main upside of this approach is that it's evolutionary and not
> revolutionary and we can start implementing it right away, using it to
> augment and improve mailing lists instead of replacing them outright.

evolution is good, I think the slow migration of more people using
public-inbox archives instead of directly subscribing to mailing lists
might help out a lot.  Already it seems that lore.kernel.org is updated
faster than my email server sees new messages :)

thanks,

greg k-h
