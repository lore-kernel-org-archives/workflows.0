Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E482F99BD;
	Fri,  8 May 2026 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778256440; cv=none; b=AROachXgDzbgI9p/aurhDcooEz1/hhq/F0XG/jY08ND09XWCp8Bz77weVNIfKlvAhcnNO9S8Gqa1DzYMWlQHbYTtjTh76iyoivE5/mKAg6UQYmsjMMnYuebKgVgJgZgsvdfXqWSAGBMAL7dyFbDD+Zh6g33AkrRzzdwKdF8Kf0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778256440; c=relaxed/simple;
	bh=NXhc4qq2Val+dvAS0fe11J5GtsnFb7FwYFQF49976fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OymX5CoD8wDniZZ1fdmZh+KogPuU/61BZPXOleJ1T9DqdcI9JfKUHBvP5Nq/9gz/G+10Je3TYaYTDoiMGlVp4ES4BH53FPP4Slc4mxG1jQUvmqq/jGZ50Rqjn40LlIZXCbw6aYQiVrhAlHwgJ5fvnO9w8L6ZMrbKodcHuJLBfwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=Y6xCpPCC; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="Y6xCpPCC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778256436; bh=0f4octcpexIhSjsQMpH7nRTCC7nCifZ/N0FmmWGliuk=;
	h=From:Message-ID:From;
	b=Y6xCpPCCdr8p/dCM8aMmGDx3pp6iPUvLNUTzSs7zRtYpSe1R9y4dXBGuTXK4SPfkf
	 zfuWVZFF7hu+JI01uz+5Td3QefD+Axi7V1EhzhyNp3KT9TIUvZHmDGyxMvypytFYsO
	 56Ybp8lWeqjwIRtdA5DhDagvNGW4w9aLwihlZ+qY=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id E83C6C0C0C;
	Fri, 08 May 2026 18:07:15 +0200 (CEST)
Date: Fri, 8 May 2026 18:07:15 +0200
From: Willy Tarreau <w@1wt.eu>
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: Greg KH <greg@kroah.com>, Linus Torvalds <torvalds@linuxfoundation.org>,
        leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <af4KMwAQGK1AXKoo@1wt.eu>
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-3-w@1wt.eu>
 <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
 <2026050801-semifinal-expulsion-9af6@gregkh>
 <DIDF0Y3YTGL4.31WQZEPS1JOQW@ubuntu.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DIDF0Y3YTGL4.31WQZEPS1JOQW@ubuntu.com>

On Fri, May 08, 2026 at 11:54:32AM -0400, Joshua Peisach wrote:
> On Fri May 8, 2026 at 11:35 AM EDT, Greg KH wrote:
> > On Wed, May 06, 2026 at 08:46:07AM -0700, Linus Torvalds wrote:
> > > [ Coming back to this after a week of trying to clean up the disaster
> > > that is my inbox after the merge window ]
> > > 
> > > On Sun, 3 May 2026 at 04:35, Willy Tarreau <w@1wt.eu> wrote:
> > > >
> > > > The use of automated tools to find bugs in random locations of the kernel
> > > > induces a raise of security reports even if most of them should just be
> > > > reported as regular bugs. This patch is an attempt at drawing a line
> > > > between what qualifies as a security bug and what does not, hoping to
> > > > improve the situation and ease decision on the reporter's side.
> > > 
> > > I actually think we may want to go further than this.
> > > 
> > > I think we should simply make it a rule that "a 'security' bug that is
> > > found by AI is public".
> 
> Whether my opinion is cared about or not, I feel it should be put in here:
> 
> Yes, *in theory* the bug is public. Anyone can find it. But just like bugs
> sitting in open source code repositories, anyone can look for if it they try.
> 
> The only difference is that a LLM is making it more apparent and noticable
> to people, if you ask it to.
> 
> The choice to then decide "therefore we can disclose it immediately", in my
> opinion, is not great. Because then you are bringing attention to a bug that
> nobody, or at most, relatively few people knew about (even in small circles)
> to a broader audience.

It's no longer needed, please trust us. Last week we've seen about one
duplicate every day and some bugs had up to 2 duplicates. I tried myself
to ask my *local* LLM to find bugs in a certain class over the whole net
tree, and it found one of the recently pubished ones without me having to
give it any hint about this.

Really, these days LLMs can swallow huge amounts of data and correlate
complex patterns very easily over an immense context. You don't need to
ask them to analyze a patch anymore nor to work on this or that file.

An issue found by an LLM is just a proof that this issue CAN BE FOUND by 
an LLM, thus a good indication that someone else will find it, and very
likely that someone else might already be using it.

> Take Dirty Frag - even though the embargo is said to have been broken, and
> all parties agreed to release the disclosure, it was put on GitHub. Of course,
> information that is public, is public. But putting it on GitHub and then
> buying the domain dirtyfrag.io makes it easy to bring attention to the bug
> that was disclosed **with no patch or CVE.**

It's really not how it works nor how it worked.

> Even if the mitigation is "just disable the module", I still think that by
> giving up the embargo entirely, we are creating more attention, and more
> opportunity for exploitation. Even if it's a PoC and not an exploit for
> malicious purposes.

What is important is that we insist on no longer sharing PoCs publicly.
This will slow down script kiddies (who are the ones doing the most
damage because they don't need the bug for their business yet they cause
harm using it). Criminals are probably already playing with it and might
have been for weeks or months already.

> > After the past 2 weeks, and the past 2 months, I am going to violently
> > agree with you here.  We've seen so many "duplicate" bug reports it's
> > not funny.  All of the modern LLMs are feeding the output back into the
> > model for future runs, which makes the data totally public.  Even if
> > not, the output is being monitored by external companies at the very
> > least.
> > 
> 
> I think that's more "unresponsible disclosure" - maybe there is some way
> that LLM emails can be filtered?

No :-(  If you saw the flood we're receiving on s@k.o, feels like
taking a shower under the niagara falls. Sometimes we just say "trim
this and repost it, it's too long we can't read it".

> And again, yes, the data is being trained. But **you have to look for it.**.
> It is still a needle in a haystack, but it's not a black hole absorbing
> said haystack.

No, really not at all. Not since the last month at least.

> > > So why should be consider it special and have it be on the security list?
> > 
> > I don't think we should anymore.
> > 
> > Yes, having a full reproducer in public is not good, but the general
> > "this is a bug" comments we should start redirecting to public lists
> > more.  That's the only way we are going to handle this influx as our
> > "normal" bug workflow works very well, especially when it comes with a
> > fix, as these LLM tools can provide very easily.
> > 
> 
> Could this at least be temporary? There are only a finite number of bugs
> that can exist in a codebase.

We regularly update the doc based on circumstances so we don't need to
care now. It looks like AI-based reports consume the doc and this will
make them less painful to maintainers, which is already a great thing.

Willy
