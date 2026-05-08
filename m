Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5352B3D75DA;
	Fri,  8 May 2026 15:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778255976; cv=none; b=sghkq7dXH+bb7KtMLO5mCoiqT8Y+4rc83itj+E3QhCUaB/ZQPcJN31IssjsJSErUUSrF6vK9YqnxfsoPMxzcZaXF4JQs+riFrsm3FfoSawBKRCj0ligh8t/GdxBgJdGx2ckS5kvC72vXGQIqxrGn7f3vRG/7fyMhBx20XX3qVmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778255976; c=relaxed/simple;
	bh=Nv0IeqEWz/Sy1KGCTYSzmkcHAr2Ts+ZDRUdBTm0RZug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDyDzqmtUiGBQPC4bqV2mCUeRFuQBl/42p+IzziYXMth/oEfpp2U4pFolOxnONamOZ+chEgpg0KDsfwCMvE49jLunD8AmbJloYRQbpqzQ1xklBYcHWQfRnPHgLvodrPtsEdLw5k4ahVexqM6+pgnjnwTbZNg16b9yaJOtRT2kgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=LAwW89ex; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="LAwW89ex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778255963; bh=tdrzBG+3GV5MhiEQB/dCW07kA3ElvBnTDOKowXqz3z8=;
	h=From:Message-ID:From;
	b=LAwW89exoX9XuiYIwUU8drp8RuFUjvWKtrlqdkfjKti8f1LivnSwyD+6mc8/0VT8h
	 wgwzf8nz81Crkk1sXbOhox387r6ucIGhhSK0yim9uHRpaO2qPZR4Ms/xuNvP9coJ3Y
	 PUCskQ2JuHVcdq7KnsVkoB68fwn+i2QzsZ2djZvM=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id DC237C0C0C;
	Fri, 08 May 2026 17:59:23 +0200 (CEST)
Date: Fri, 8 May 2026 17:59:23 +0200
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <greg@kroah.com>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, leon@kernel.org,
        security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <af4IW_ycR2RpAjhy@1wt.eu>
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-3-w@1wt.eu>
 <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
 <2026050801-semifinal-expulsion-9af6@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026050801-semifinal-expulsion-9af6@gregkh>

On Fri, May 08, 2026 at 05:35:39PM +0200, Greg KH wrote:
> On Wed, May 06, 2026 at 08:46:07AM -0700, Linus Torvalds wrote:
> > [ Coming back to this after a week of trying to clean up the disaster
> > that is my inbox after the merge window ]
> > 
> > On Sun, 3 May 2026 at 04:35, Willy Tarreau <w@1wt.eu> wrote:
> > >
> > > The use of automated tools to find bugs in random locations of the kernel
> > > induces a raise of security reports even if most of them should just be
> > > reported as regular bugs. This patch is an attempt at drawing a line
> > > between what qualifies as a security bug and what does not, hoping to
> > > improve the situation and ease decision on the reporter's side.
> > 
> > I actually think we may want to go further than this.
> > 
> > I think we should simply make it a rule that "a 'security' bug that is
> > found by AI is public".
> > 
> > Now, I may be influenced by that "my inbox is a disaster during the
> > merge window" thing, but I do think this is pretty fundamental: if
> > somebody finds a bug with more or less standard AI tools (ie we're not
> > talking magical special hardware and nation-state level efforts), then
> > that bug pretty much by definition IS NOT SECRET.
> 
> After the past 2 weeks, and the past 2 months, I am going to violently
> agree with you here.  We've seen so many "duplicate" bug reports it's
> not funny.  All of the modern LLMs are feeding the output back into the
> model for future runs, which makes the data totally public.  Even if
> not, the output is being monitored by external companies at the very
> least.
> 
> > So why should be consider it special and have it be on the security list?
> 
> I don't think we should anymore.
> 
> Yes, having a full reproducer in public is not good, but the general
> "this is a bug" comments we should start redirecting to public lists
> more.  That's the only way we are going to handle this influx as our
> "normal" bug workflow works very well, especially when it comes with a
> fix, as these LLM tools can provide very easily.
> 
> So if this could be reworded somehow to reflect that, maybe?

What I'm trying to do is to make sure the reports don't flood just to
maintainers (some of whom never got a report, and getting an intimidating
one written by an LLM can be really painful). And in parallel we're trying
to limit public reports for non-AI. So I think the split point revolves
to:
  - all bugs (AI and non-AI) affecting the threat model are security bugs,
    but AI reports must be considered public as others will find them in
    parallel (and we do know that pretty well now).
  - if non-AI, send to maintainers and Cc: security, send all repros 
    you can share
  - if AI,  the report must be considered public so send to maintainers
    and Cc: public lists AND always LKML, and never security@, and do
    not send the repros publicly.

=> this reinforces the role of security@ to be for triage, coordination
   and assitance to maintainers so that they're never left to themselves
   (i.e. private bugs=maint+s@k.o; public bugs=maint+public list).

Also, I'll add "for AI, please see the points below" (the 3rd patch with
all the rules).

There remains a gray zone with the repros from AI tools (since they're
good at writing them). They should sent to maintainers only (no need to
involve s@k.o) but it requires a second message.

> But the "what is and is not a security bug" is a good thing overall.  We
> need a solid definition of our threat model if for no other reason to
> keep me from having to write over and over "Once a driver is bound to
> the kernel, we trust the hardware"...

Over the last two weeks I felt like you needed a macro on your keyboard
that would post a link to that doc in lore!

Thanks,
Willy
