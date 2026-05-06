Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571AC3F9F23;
	Wed,  6 May 2026 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083355; cv=none; b=SEHqA/PD+8rmxMaF75fMHyhqUdb/38gCRV+QysUCks67xwwbrQSQAITYQTMl8Xl5bMKOTGUqNYT+wtdw+DynbLc9xN5wgPWzLMTNyhPRkkm7F3sktVu444XmyUvf1hJ+zsCZ4LC9oHRdoH4PdL2n3IWuAfzoBEFYNwEMC96IGp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083355; c=relaxed/simple;
	bh=obfSVO+8HW/DbNJa+VnTSxO47YVfzqxF5oObKGgvAXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJauybFDRCz7zFPVJMypfANoVREoy8BjxVsqDUfmWsdhMSisvi8d/Jv315z+1G0Vjo/MizRz9TzKejH4PC7GDc8VoFLrEwBglYvuGLQbzpAUSZWewEP9DvgLosq6smrQ1Hgy7eC/4kgxUmScuW2c+Cr1Go+LOwhDLD2K0k0PKSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=Fi3x4M/6; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="Fi3x4M/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778083336; bh=RjfZ5ZDr3CNZNDkOAQDwIrY2DBYxtmL7s65QjxivLpk=;
	h=From:Message-ID:From;
	b=Fi3x4M/6ElZw6YAzEoXCan7YSFs3d5RDT8WjJfp6nFoD2MnEx+DVqgMVtPvkI7SAK
	 PLaa8XMEFnUz2XHGxtn0OikcpCpvKOU5SLVRA+SiwoBCQQVm9OtjQ/Tnjvi/cE2StA
	 bbF7qJmGIoaRRDAsaeu9K8vIv5l46LUb7dSu0N+s=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 1970EC0AC0;
	Wed, 06 May 2026 18:02:16 +0200 (CEST)
Date: Wed, 6 May 2026 18:02:15 +0200
From: Willy Tarreau <w@1wt.eu>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: greg@kroah.com, leon@kernel.org, security@kernel.org,
        Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <aftmB435XJ8FP3V_@1wt.eu>
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-3-w@1wt.eu>
 <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>

Hi Linus,

On Wed, May 06, 2026 at 08:46:07AM -0700, Linus Torvalds wrote:
> [ Coming back to this after a week of trying to clean up the disaster
> that is my inbox after the merge window ]
> 
> On Sun, 3 May 2026 at 04:35, Willy Tarreau <w@1wt.eu> wrote:
> >
> > The use of automated tools to find bugs in random locations of the kernel
> > induces a raise of security reports even if most of them should just be
> > reported as regular bugs. This patch is an attempt at drawing a line
> > between what qualifies as a security bug and what does not, hoping to
> > improve the situation and ease decision on the reporter's side.
> 
> I actually think we may want to go further than this.
> 
> I think we should simply make it a rule that "a 'security' bug that is
> found by AI is public".

This would definitely help us a lot on sec@k.o, but...

> Now, I may be influenced by that "my inbox is a disaster during the
> merge window" thing, but I do think this is pretty fundamental: if
> somebody finds a bug with more or less standard AI tools (ie we're not
> talking magical special hardware and nation-state level efforts), then
> that bug pretty much by definition IS NOT SECRET.

I think it's only 99.9% true. I mean, I've used such tools myself to
find bugs that were not found otherwise and I know that:
  - interactions with the tools count a lot
  - luck counts even more

There remains a faint possibility that the reporter has worked a lot
with their tool to be able to find the problem. I.e. the user helped
the LLM and not the opposite. In this case it might be possible that
it's not public. But clearly from what we've seen over the last few
weeks, the number of duplicates has exploded, with up to 3 reports
for the same issue within 2 days, so it's clear that they're not in
the category I mention above.

Maybe we should leave some rope for "if you are fairly confident that
the work you did is unlikely to have been replicated by anyone else,
the you can report it here" but I think we'll both agree that for now
most reporters really think they did something exceptional while we all
saw it was not the case (or they all do the same exceptional thing).

Thus I'm embarrassed with that.

> So why should be consider it special and have it be on the security list?
> 
> Yes, yes, I know - some people think that "security bugs are special".
> And I've been on the record before calling that opinion special - in
> the short bus sense.
> 
> Bugs are bugs. And not having them in public only makes them harder to
> deal with.
> 
> Do we want to make bugs with potential security impact harder to deal
> with? No. No, we really don't.
> 
> So I claim that the only reason for a security list is the non-public
> nature of the bug and the whole "responsible disclosure" argument.

As you probably guess, I totally agree with these points. I'm just
trying to leave the door open for the rare exceptions without having
to accept all the flood.

> But that argument is complete and utter garbage in the face of some
> mostly automated AI discovery (now, that argument is mostly a fiction
> in the first place, but I am not going to argue with people who have
> vested interest in making their special  patches "security bugs").
> 
> To recap - I think this "document the scope of security bugs" is good,

Thanks for the feedback.

> but I think we should go even further, and just document the fact that
> anything found by regular AI tools should just always go to public
> lists and is simply not special.

I'm fine with that but I'd like to add "except..." though I don't know
how to phrase it. If you have any idea, we can write something for a
start and see how it goes. It looks like these tools are pretty good
at swallowing our doc updates to help reporters so the good thing is
that we can now write instructions that are mostly followed in process
docs ;-)

Willy
