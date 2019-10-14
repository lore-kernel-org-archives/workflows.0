Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635F6ECE587
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 14:29:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39F3C21848
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 14:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571063357;
	bh=J675B/OCL95uZ2Sfp44pl8uYexIMESmEO7msMxQuJ80=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=lAIpy/xRNS5TtjN1slN3cZUB5fjoev7734xAPk7zAudvkRfwGZX7/BrWlmZpq41GX
	 5Jwyh0I3D1Iq8fWcFy6O5pnhrIQPme7z55oFKd9zPMZa5/s/JIFJ29ihwYVXmTQrOa
	 K/r7LADrMtFox0SjI/s7KJVrJdQNxz+EHegOHyh8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732752AbfJNO3Q (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 10:29:16 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:54982 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731121AbfJNO3Q (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 14 Oct 2019 10:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=LrezXRSygKKGcuQwyQTIHGiqwIAimUH6daRVHKHAyPo=; b=k9SwcwbJICvShCMOu80Memlx0
        G4zQQnnZ0wOeNR4m8piV7LQoE6Q4dyQRyb/XSzUZWrlZlvoF5evt/6xujT0mm/7vMQ0rVUzKenSP1
        /+Wiocm4NRUc+QcXuifIK8DJxu+35GaWGjC+24L0dMBDL7eqB/lG5auVj3dqcFT5X5GYAKkye5jIR
        //gVRFuWfrCfQ03zZRA2vSPV3uUz0u6EiDONpakpEgJgyUSDDhgZVrKagOgOT2z0omh87orKxWBHn
        rHhmLEI9c+2ilHblZJWzWZ6oEamBCccOa2+iG8XFPyqoANteS+D1PXwgEWPZnp9hXx4SdjYme9j3W
        q+YYX+5TQ==;
Received: from 201.47.160.77.dynamic.adsl.gvt.net.br ([201.47.160.77] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iK1LP-000090-HJ; Mon, 14 Oct 2019 14:29:07 +0000
Date:   Mon, 14 Oct 2019 11:28:59 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>,
        Daniel Axtens <dja@axtens.net>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Dave Airlie <airlied@gmail.com>,
        David Miller <davem@davemloft.net>, skhan@linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191014112859.4174e3b8@coco.lan>
In-Reply-To: <20191014135358.GF5564@mit.edu>
References: <20191011.121153.1410013220730418292.davem@davemloft.net>
        <20191011141909.1ccb58b3@hermes.lan>
        <20191011174719.16e997f5@gandalf.local.home>
        <CAPM=9tyjGBC2e5mi7=OetWACYjQ6iwiLPNXpuAEReeyttKNrtw@mail.gmail.com>
        <20191011190009.6ee15756@gandalf.local.home>
        <20191011170839.75c52ad3@hermes.lan>
        <87lftotdv8.fsf@dja-thinkpad.axtens.net>
        <874l0bk3qb.fsf@toke.dk>
        <20191014122637.GB5564@mit.edu>
        <20191014104132.76b19507@coco.lan>
        <20191014135358.GF5564@mit.edu>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Em Mon, 14 Oct 2019 09:53:58 -0400
"Theodore Y. Ts'o" <tytso@mit.edu> escreveu:

> On Mon, Oct 14, 2019 at 10:41:32AM -0300, Mauro Carvalho Chehab wrote:
> > It can still have man-in-the-middle (MITM) attacks between the sender and
> > vger.kernel.org. Please notice that using https and adding the patch
> > via a web interface can also be subject to MITM, as companies and even some
> > Countries with strong policy enforcement may have some gateway on their
> > infra that will prevent end-to-end encryption[1], blocking direct
> > client-server https tunnels.
> > 
> > [1] They add an internal certificate to the browsers, so that the client
> > will see the connection as trustful, but the infra will actually do two
> > separate HTTPS encryption:
> > 
> > 	client  ---> Gateway
> > 	Gateway ---> Server
> > 
> > While unlikely, nothing prevents that the patch would be maliciously 
> > altered at the Gateway.
> > 
> > From security PoV, the only way to ensure that the patch was not
> > altered is to have it signed by the one who wrote it.  
> 
> Well, sure, but the maintainer should be reviewing the patch looking
> for problems anyway.  There is the risk that people might slap a
> "Reviewed-by:" tag on a patch without sufficiently careful review if
> it's from a prominent kernel contributor, but we've always had that
> problem.  And so nothing, not even a digitally signed patch from a
> reviewer should absolve the maintainer from doing their own review.

Yeah, our current security model is based at the maintainer for
him to do his duties, properly reviewing the patch.

Yet, at the example that Daniel gave:

Instead of:

	if ((permissions == allowed) && other_stuff) {
		do_things();
	}
	do_more_stuff(permissions);

Patch was maliciously modified to:

	if ((permission == allowed) && other_stuff) {
		do_things();
	}
	do_more_stuff(permissions);

I suspect that a change like that might sleep though the maintainer's
review.

> 
> Now, one might argue that if there is a forged patch from "famous
> kernel developer A", followed up with a forged patch from "famous
> kernel developer B", that might cause a maintainer to happily take the
> patch without doing their own, independent review, for scaling
> reasons.  But that's a "vulernability" we've lived with for a long
> time, since today neither patches or "Reviewed-by" messages are
> usually signed.
> 
> And at least (as far as we know) no one has managed to sneak a
> malicious patch with a zero-day hidden with malice aforethought.  And
> perhaps that shouldn't be surprising.  We seem to be quite capable of
> introducing our own security vulererabilities without "help", so
> perhaps most malicious attackers wouldn't want to do something which
> could be so easily detected, when they can just pay money to a black
> hat hacker.

True, but, once we discover a patch introduced with a malicious code,
some action should be taken to eliminate the source of the bad code.

I mean, one thing is if "famous kernel developer A" maliciously
wrote a patch to violate security. The other thing is that the
infra used by "famous kernel developer A" is not safe, and has
some hidden back hat hacker in the middle of it.

The only way to identify that is by using signed patches/PRs.


Thanks,
Mauro
