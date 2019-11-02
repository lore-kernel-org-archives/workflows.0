Return-Path: <SRS0=Umn/=Y2=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC7FCA9ED0
	for <workflows@archiver.kernel.org>; Sat,  2 Nov 2019 01:17:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE41721855
	for <workflows@archiver.kernel.org>; Sat,  2 Nov 2019 01:17:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbfKBBR5 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 1 Nov 2019 21:17:57 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:40120 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726999AbfKBBR5 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 1 Nov 2019 21:17:57 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 88D051F454;
        Sat,  2 Nov 2019 01:17:56 +0000 (UTC)
Date:   Sat, 2 Nov 2019 01:17:56 +0000
From:   Eric Wong <e@80x24.org>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Han-Wen Nienhuys <hanwen@google.com>, workflows@vger.kernel.org
Subject: Re: Lyon meeting notes
Message-ID: <20191102011756.GA14539@dcvr>
References: <20191029222629.GA19318@dcvr>
 <20191029231313.GA124865@google.com>
 <20191101200755.h7gyt63rgwyxuqbd@pure.paranoia.local>
 <20191101213036.GA10609@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191101213036.GA10609@mit.edu>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

"Theodore Y. Ts'o" <tytso@mit.edu> wrote:
> On Fri, Nov 01, 2019 at 04:07:55PM -0400, Konstantin Ryabitsev wrote:
> > The argument was that attempts to sneak in malicious code while
> > pretending to be someone else would be quickly discovered, because any
> > significant code contribution requires back-and-forth and if the "From"
> > address is spoofed, then the real developer would quickly point out that
> > they are not the actual author of the code.
> > 
> > My counter-argument is that history proves that we can't trust humans to
> > recognize maliciously misspelled domains. If you receive a submission
> > like this:
> > 
> > From: Konstantin Ryabitsev <konstantin@linuxfoudnation.org>
> > 
> > you will need to pay very close attention to that "d" and "n" to realize
> > that it didn't actually come from me.
> 
> The other caution I'd raise here about why signing individual commits
> might not be the panacea we might hope it would be is that the vast
> majority of kernel developers don't today have cryptographic
> identities, and we are constantly welcoming new developers to kernel
> development.
> 
> Even if we did have a way to get new ED25519 keys signed for all of
> these new developers, knowing their identity says nothing about how
> much they are (or should be) trusted.
> 
> Consider that any sufficiently well-resourced actor who really wants
> to sneak in malicious code, especially when we consider how much
> zero-day exploits are worth on the open market, will be quite willing
> to establish a "legend" for a developer.  The "developer" might submit
> a dozen cleanup patches, all of which are good, and genuninely improve
> the kernel --- and it will be the 13th or the 31st submit that will
> have the malicious change hidden in it.  The fact that it is signed by
> a key that had previously signed 30 patches says nothing about how
> good the 31st patch will be.

Agreed.  A well-resourced adversary could also coerce a
well-meaning developer into signing a malicious change.  Perhaps
I'm paranoid, but that's a really scary thing if people rely on
identities and reputation too much.  I've always cautioned users
against trusting me for that reason (that and I'm error-prone :x)

> For bonus style points, the patch might have something which claims to
> be the application of a Coccinelle semantic patch --- and maybe in the
> V1 and V2 version of the patch series, it was in in fact a Coccinelle
> patch, but in the v3 patch, that's where malicious code was slipped
> in, and since V2 had received a Reviewed-by, and it was supposedly an
> automatically generated Coccinelle patch, no one took a close look and
> noticed that the v3 version of the patch was different from the v2
> version....
> 
> There are certainly ways we could try to make this sort of thing
> harder; we can have tools that verify that the Coccinelle script
> mentioned in the commit description actually matches with what the
> commit changes.  And we could also have tools which flags deltas
> between the Vn and Vn+1 version of a patch, especially after the Vn
> version of the patch has gotten a reviewed-by.  It's just that none of
> these fixes have anything to do with digital signed commits.

Some of that could be automated, yes, but maintainers must still
remain vigilant.

A lot of it could be a culture prioritizing feature development
over long-term maintenance and review; so improving the
eyes-to-code ratio is needed.  That's a deeper issue which
affects every project, unfortunately.
