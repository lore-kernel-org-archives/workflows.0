Return-Path: <SRS0=mXxz=22=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1680AC00523
	for <workflows@archiver.kernel.org>; Sun,  5 Jan 2020 08:15:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2B2020801
	for <workflows@archiver.kernel.org>; Sun,  5 Jan 2020 08:15:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="swW0t/tO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="u4lvfupj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgAEIP4 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 5 Jan 2020 03:15:56 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:55695 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725828AbgAEIP4 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sun, 5 Jan 2020 03:15:56 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 826AA21ADD;
        Sun,  5 Jan 2020 03:15:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 05 Jan 2020 03:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=8/TA91690DekiHl4uQ5KP7bZIVF
        rGXP6ZS8UA4ijjI4=; b=swW0t/tOXs9KUG4RWOIUHVovPnOw4boqAsPMZRNd0MY
        b9S0y0ndzCngPgLgy++YWab/EbG/z6wUHEH5OQWeaN41wr8pJbe2OFFirCz7sCWV
        QaNDskjqjRO86zyJaNxzxebQ6CXzoyTRL/bz23sx1zT7IzGQrDTCAHicAII61Y6f
        fa6RcSsJpSp9NHsen09MiVXWZxD4hKt7571GVY1jI+PGajTb6F8j4uVrN92FhUqu
        zX/4EC9mPwiGTy2gsv0chulE9z2f378dGCGCiYrFJ64HHtPzdMEo5Yys6x9mcvfN
        Q+weRqXzdcpTJmoP3IWSqe7VCXQ/UaPotuS/H9YYyFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8/TA91
        690DekiHl4uQ5KP7bZIVFrGXP6ZS8UA4ijjI4=; b=u4lvfupjSkrGax+rtQX7R3
        u6Mn/IU+1PzJv23+vD376wai0jf3L/7IptHBP3N5XOdflvs2jY7HgoYJHuZl/XYK
        392aZec5EY3KgDNxNSsxW8pf+N2MNc8EQWdy6YVmBJSDhAFLgx9Krxl+A16eUYmo
        nzJ3DrYC6h4HwbCkxVo6kOo2yO+3f+iuxQ1SvO4XQlX+PvaiSRAy62XMaqNR6i8V
        x0EMfE75yAJ7dPm29SmvoVOYaaG75jkYFD7OEaUvqcJycaRC+r7+b3di+VOMtTz9
        YyQFE84KWKo5hVyHsZULwjmwukXrOGCF9HzljuCeQIj7/roUXGHzxo8mKND80Q/w
        ==
X-ME-Sender: <xms:O5sRXtKuLsH06dyapDGu7Bb4mkznD9dRGHHBQt-fSAlXfOSa8fwrag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegjedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necukfhppeekfedrkeeirdekledruddtjeenucfrrghrrghmpehmrghilhhfrhhomhepgh
    hrvghgsehkrhhorghhrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:O5sRXgCX6uGRXkpzOsDpTRoM1sDiK_hJbl3e2ohUAZ1AKHtAu7pYWg>
    <xmx:O5sRXirMHTO6xRMBL1BuZaw88Cf-wYZDETpGFpDbcappyh5Z4gJ-EA>
    <xmx:O5sRXrizqJkZYRrO1RF9uTZESWadtRBpq0OLrAj8yLzTwyFAZkGpRQ>
    <xmx:O5sRXvSJK3DiXKT-ozi8XifLERrQOkNYT03twPY0bqJ6TfeWJmeWkw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1809430607B0;
        Sun,  5 Jan 2020 03:15:55 -0500 (EST)
Date:   Sun, 5 Jan 2020 09:15:50 +0100
From:   Greg KH <greg@kroah.com>
To:     Evan Rudford <zocker76@gmail.com>
Cc:     workflows@vger.kernel.org
Subject: Re: Is the Linux kernel underfunded? Lack of quality and security?
Message-ID: <20200105081550.GB1667342@kroah.com>
References: <CAE90CG5h0RqNs8N7qbZzajYK9A3eY0LWHqLfzX7Z-v-aef4R2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE90CG5h0RqNs8N7qbZzajYK9A3eY0LWHqLfzX7Z-v-aef4R2g@mail.gmail.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sun, Jan 05, 2020 at 04:49:32AM +0100, Evan Rudford wrote:
> The problem of underfunding plagues many open source projects.

Does it?  Citation please :)

And compared to what exactly?

> I wonder whether the Linux kernel suffers from underfunding in
> comparison to its global reach.

Does it?  Again, specifics would be great to have.

> Although code reviews and technical discussions are working well, I
> argue that the testing infrastructure of the kernel is lacking.

Does it?  No one can argue we are "doing to much testing", and more
testing is always wanted, and happening, can you help with that effort?

> Severe bugs are discovered late, and they are discovered by developers
> that should not be exposed to that amount of breakage.

Specifics please.

Remember that Linux runs on _EVERYTHING_ so testing on _EVERYTHING_ is
sometimes a bit hard and bugs only show up later on when people get
around to running newer kernels on their specific hardware/workload.

> Moreover, I feel that security issues do not receive enough resources.

Again, citation please?  I would argue that right now we have too many
people/resources working on security issues that are really really minor
in the overall scheme of things.

What specific "security issues" are not currently being addressed?

> I argue that the cost of those bugs is vastly higher than the cost
> that it would take to setup a better quality assurance.

Why do you think that?

> With sufficient funding, the kernel might do all of the following:

Define "sufficient" :)

> - Make serious efforts to rewrite code with a bad security track
> record, instead of only fixing security vulnerabilities on an ad hoc
> basis.

What code do you think meets this criteria?

> - Although the kernel will always remain in C, make serious efforts to
> introduce a safe language for kernel modules and perhaps for some
> subsystems.

That is already happening for those people that really like those types
of languages.  Why not help them out with that effort as it seems to be
going slowly.

> - Build an efficient continuous integration (CI) infrastructure.

What is wrong with the one(s) that we currently have and rely on today?

> - Run a fast subset of the CI tests as a gatekeeper for all patch sets.

Um, this already happens, what needs to be added?  What tests are not
being run that would catch issues?  Why not add them to the existing
tools we all use today?

> - Run strict CI tests to ensure that userspace compatibility does not break.

What tests are those that are not being run today?

> - Run CI tests not only in virtual environments, but also on real hardware.

That's happening today, what specific platforms/hardware is not being
tested in this manner?

> - Run CI tests that aim to detect performance regressions.

Again, we are doing that, what tests need to be added to the tools?

> I realize that some companies are already running kernel testing
> infrastructure like this.

Exactly :)

> However, the development process seems to either lack the resources or
> the willingness to build a better quality assurance?

Why do you think this?  Again, specifics please.

greg k-h
