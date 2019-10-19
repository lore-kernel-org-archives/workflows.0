Return-Path: <SRS0=lNma=YM=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9C0CA9EA0
	for <workflows@archiver.kernel.org>; Sat, 19 Oct 2019 00:29:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CA94222C2
	for <workflows@archiver.kernel.org>; Sat, 19 Oct 2019 00:29:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729709AbfJSA33 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 18 Oct 2019 20:29:29 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:54246 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727727AbfJSA33 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 18 Oct 2019 20:29:29 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 0399E1F4C0;
        Sat, 19 Oct 2019 00:29:29 +0000 (UTC)
Date:   Sat, 19 Oct 2019 00:29:28 +0000
From:   Eric Wong <e@80x24.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     workflows@vger.kernel.org, meta@public-inbox.org
Subject: Re: workflow problems and possible public-inbox solutions
Message-ID: <20191019002928.GB20824@dcvr>
References: <20191018032516.GB29290@dcvr>
 <20191018190305.GF25456@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018190305.GF25456@chatter.i7.local>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> On Fri, Oct 18, 2019 at 03:25:16AM +0000, Eric Wong wrote:
> > 1. vger deliverability problems to major mail providers
> > 
> > (NNTP|public-inbox) => POP3 bridge, since all major providers
> > support importing mail from POP3.
> > 
> > https://public-inbox.org/meta/20160411034104.GA7817@dcvr.yhbt.net/
> > 
> > Locally-run NNTP -> mail fetchers can also work, but requires
> > more effort to setup.
> 
> There is also this:
> https://git.kernel.org/pub/scm/linux/kernel/git/dborkman/l2md.git/
> 
> With a bit more tweaking (see TODO), it can be made into a very nice generic
> interface tool -- in fact, I hope to use it at some point for feeding
> patches into patchwork instead of piping directly from postfix.

Looks like that still needs local storage?  I'm planning a tool
which would work remotely while allowing local caching/memoization.

> > 2. attestation of messages
> > 
> > Self-publishing "Sent Mail" folders via NNTP or git,
> > (similar to Certificate Transparency):
> > https://lore.kernel.org/workflows/20191010192852.wl622ijvyy6i6tiu@chatter.i7.local/
> > 
> > This would provide redundancy, too; and it's probably more
> > usable and learnable than GPG :P
> 
> Well, it still uses GPG, but it hides away the horrible parts. The easiest
> way to accomplish auto-signing is to create a dedicated ECC subkey and store
> it (and just it) in a dedicated dir used by the self-publishing tool.

Self-hosting an .onion would get rid of the need for GPG.
That should be doable on most home Internet connections, but
requires constant uptime...  But more self-hosting and not
having to pay registrars is good :>

HTTPS still relies on trust authorities, and it's "good enough"
for a lot of people so probably OK... *shrug*

> > 4. secret exchanges for embargoed issues
> > 
> > No idea, really; not my department :P
> > 
> > It would be good if all messages in the exchange can be
> > published and mirrored once the embargo is lifted, though.
> 
> There is ongoing separate effort to address this, using remail:
> https://git.kernel.org/pub/scm/linux/kernel/git/tglx/remail.git/
> 
> I haven't started implementing it yet, but my hope is to provide builtin
> archives that can be released once the embargo is lifted.

Cool :>
