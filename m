Return-Path: <SRS0=22HX=YG=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A0DC4360C
	for <workflows@archiver.kernel.org>; Sun, 13 Oct 2019 23:19:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8947207FF
	for <workflows@archiver.kernel.org>; Sun, 13 Oct 2019 23:19:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728848AbfJMXT1 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 13 Oct 2019 19:19:27 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:43794 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728782AbfJMXT1 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Sun, 13 Oct 2019 19:19:27 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 99C601F4C0;
        Sun, 13 Oct 2019 23:19:26 +0000 (UTC)
Date:   Sun, 13 Oct 2019 23:19:26 +0000
From:   Eric Wong <e@80x24.org>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     workflows@vger.kernel.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Theodore Ts'o <tytso@mit.edu>,
        David Miller <davem@davemloft.net>
Subject: Re: Fwd: SSB protocol thoughts
Message-ID: <20191013231926.GA13089@dcvr>
References: <CACT4Y+Y0_2rCnt3p69V2U2_F=t4nMOmAOL-RGwxSS-ufk41NAg@mail.gmail.com>
 <CACT4Y+ZVbTk1esf9sDvDbXMCRDvFZwE1SbjxMAFbYjzK7AKoYA@mail.gmail.com>
 <20191010204335.GB5440@dcvr>
 <CACT4Y+YU78dQUeFob7NXaOU-gjnKHtxpceQj2c4=2aBV0_PSxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+YU78dQUeFob7NXaOU-gjnKHtxpceQj2c4=2aBV0_PSxg@mail.gmail.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Dmitry Vyukov <dvyukov@google.com> wrote:
> Thanks for confirming some of my fears :)

Yeah, I thought about this for several years before deciding
on starting public-inbox.  ActivityPub/ForgeFed would have
the same problems w.r.t. spam/flooding/malicious actors.

> On Thu, Oct 10, 2019 at 10:43 PM Eric Wong <e@80x24.org> wrote:
> > Anything about bridging with email?
> 
> I wrote a bit about email/github bridges here:
> https://lore.kernel.org/workflows/d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com/
> But mainly it just says that the bridges should be possible. Do you
> foresee any potential problems with that?

Quoting part of that: https://lore.kernel.org/workflows/d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com/
> > Two more interesting/controversial possibilities.
> > If we have an email bridge, we could also have a github bridge!
> > Don't get me wrong, I am not saying we need to do this now or at all.
> > I am saying that if UI part is abstracted enough, then it may be
> > theoretically possible to take a PR on a special dedicated github
> > project, convert it to "patch for review" SSB message and inject
> > into the system. Comments on the patch will be proxied back to github.
> > Andrew will receive this over email bridge and review and merge,
> > not even suspecting he is reviewing a github PR (w00t!).

The problem is conversations on GitHub can also get siloed off and
formatting/threading screwed up in ways which are confusing to
GitHub's non-threaded UI.

If it can be made 100% transparent, sure; but IMHO it's also
dangerous hypocrisy to be endorsing and promoting proprietary
systems.  Most Open Source hackers obviously disagree with me.

If GitHub provided email access (like Gmail) that interoperated
with any other mail service, then that'd be fine.  But we can't
expect them to do that because social networks' business models
are based on locking users into using their network for
communication.
