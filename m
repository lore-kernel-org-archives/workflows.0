Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D218ECE587
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 13:55:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D6CA2133F
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 13:55:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732012AbfJNNzR (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 09:55:17 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:38389 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731995AbfJNNzQ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 14 Oct 2019 09:55:16 -0400
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com [104.133.0.98] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x9EDrxjA011239
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Oct 2019 09:53:59 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id D4604420287; Mon, 14 Oct 2019 09:53:58 -0400 (EDT)
Date:   Mon, 14 Oct 2019 09:53:58 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
        Daniel Axtens <dja@axtens.net>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Dave Airlie <airlied@gmail.com>,
        David Miller <davem@davemloft.net>, skhan@linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191014135358.GF5564@mit.edu>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014104132.76b19507@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 14, 2019 at 10:41:32AM -0300, Mauro Carvalho Chehab wrote:
> It can still have man-in-the-middle (MITM) attacks between the sender and
> vger.kernel.org. Please notice that using https and adding the patch
> via a web interface can also be subject to MITM, as companies and even some
> Countries with strong policy enforcement may have some gateway on their
> infra that will prevent end-to-end encryption[1], blocking direct
> client-server https tunnels.
> 
> [1] They add an internal certificate to the browsers, so that the client
> will see the connection as trustful, but the infra will actually do two
> separate HTTPS encryption:
> 
> 	client  ---> Gateway
> 	Gateway ---> Server
> 
> While unlikely, nothing prevents that the patch would be maliciously 
> altered at the Gateway.
> 
> From security PoV, the only way to ensure that the patch was not
> altered is to have it signed by the one who wrote it.

Well, sure, but the maintainer should be reviewing the patch looking
for problems anyway.  There is the risk that people might slap a
"Reviewed-by:" tag on a patch without sufficiently careful review if
it's from a prominent kernel contributor, but we've always had that
problem.  And so nothing, not even a digitally signed patch from a
reviewer should absolve the maintainer from doing their own review.

Now, one might argue that if there is a forged patch from "famous
kernel developer A", followed up with a forged patch from "famous
kernel developer B", that might cause a maintainer to happily take the
patch without doing their own, independent review, for scaling
reasons.  But that's a "vulernability" we've lived with for a long
time, since today neither patches or "Reviewed-by" messages are
usually signed.

And at least (as far as we know) no one has managed to sneak a
malicious patch with a zero-day hidden with malice aforethought.  And
perhaps that shouldn't be surprising.  We seem to be quite capable of
introducing our own security vulererabilities without "help", so
perhaps most malicious attackers wouldn't want to do something which
could be so easily detected, when they can just pay money to a black
hat hacker.

	       	    	     	       - Ted
