Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758761CFBA;
	Thu,  7 May 2026 04:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778127513; cv=none; b=HFSdCvfA+zoFdRoCEXpI8Ia5A7yJuGc9TSeN71F69AVyuacBSNnQL/uuq2SuLGuKLVpLVwlcmavThf3vZiuEvIaMk1ts/Ca7kcCENSHYLzrpIGSjkvTRQWds1PM2n00ITlidR2dBYREcMYp7whTXylIVN78w4FhywUeIXBURJpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778127513; c=relaxed/simple;
	bh=nE8pEYUjJ3MQ9dJLwmhhz1cUJNV6CC+sW+5G3m53hqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ahei0k7ug+zudhXWk65RdMzF3L86VRDHrTxma1TVnMBvrdBp0LD1OFu68ci9w3in4jQ2c8hL0H8BA8cqGA37sHOEHmZcVE8GsbWUwO9KVvqxXNdpZi2qJcWNCrHaCWh/KFdm2q0G9xvx2D/Qek+9mGMgAd+NfHurc6PbOmRjzXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=exbUtlAm; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="exbUtlAm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778127508; bh=HggbJKsWAbyTUqF9cCHSdSJKGC/niCg/w9Y43kUFCTA=;
	h=From:Message-ID:From;
	b=exbUtlAm0xj6IpLj5Pbz1LoUs+3hDOh/ypVcPtzQ0amUe44Nd53/hksDLrpgQbZrf
	 QLHjPdwtGUD2yecBlSPqluEwFoVr5bNv1+USStWpbjgsvi//OdilkJ4EXlLF/JAaTN
	 R+qDqnSZFxpFGXnsdb/wtODmRZWOvlKWlRYYW0+4=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 67473C0B2C;
	Thu, 07 May 2026 06:18:28 +0200 (CEST)
Date: Thu, 7 May 2026 06:18:27 +0200
From: Willy Tarreau <w@1wt.eu>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: greg@kroah.com, leon@kernel.org, security@kernel.org,
        Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <afwSk3BC8mewPfPp@1wt.eu>
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-3-w@1wt.eu>
 <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
 <aftmB435XJ8FP3V_@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aftmB435XJ8FP3V_@1wt.eu>

On Wed, May 06, 2026 at 06:02:15PM +0200, Willy Tarreau wrote:
> Hi Linus,
> 
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
> 
> This would definitely help us a lot on sec@k.o, but...
> 
> > Now, I may be influenced by that "my inbox is a disaster during the
> > merge window" thing, but I do think this is pretty fundamental: if
> > somebody finds a bug with more or less standard AI tools (ie we're not
> > talking magical special hardware and nation-state level efforts), then
> > that bug pretty much by definition IS NOT SECRET.
> 
> I think it's only 99.9% true. I mean, I've used such tools myself to
> find bugs that were not found otherwise and I know that:
>   - interactions with the tools count a lot
>   - luck counts even more

Thinking more about it, there's still something that won't go round:

- people have always been looking for vulnerabilities, sometimes for
  fun, and often to proudly show a CVE on their resume ; we've been
  dealing with that for many years.
- now they can do the same using AI and making much less effort, but
  their approach still stems from actively searching a vulnerability
- when they find something, they're certain it's a vulnerability
  because it's what they asked for (hence the threat model addition).
- if we tell them "don't report this to s@k.o" they will simply send
  them directly to the maintainers, who are even less accustomed to
  the process and will not benefit from the security team's experience
  in triaging nor support in saying "no". And we all know how stressful
  a vulnerability report can be for a developer who instantly has to
  stop doing everything and start to look at it just in case it would
  be valid.

For these reasons I'd rather propose that we say something around these
lines:

    Note that the security team will generally consider AI-assisted
    findings as public and will often ask you to repost your report
    to public lists.

Another point is that for many vulns there are two types of adversaries:
  - criminals
  - script kiddies

The former must be assumed to also have discovered the same vuln, possibly
earlier, and to be actively exploiting it. The latter however, is just
going to use whatever published exploit to say "look mum, I'm root".
Public reports containing too many details will speed up usability for
this group and that's not good for users.

And we *know* that some reports contain working PoC that need very little
modification. Passing them through s@k.o for triaging feels safer than
directing them to public lists with no early validation.

So in short, I think that:
  - AI reports should be considered public, but not necessarily well known
    yet
  - AI reports often contain repros that shouldn't be posted publicly
  - AI reports wording can be intimidating to developers not used to
    receiving these things

 -> the security team should remain the first filtering layer for this
    for new reporters even if it means continuing to see some noise.
    I think that instead it's the 3rd patch about the threat model that
    should help us receive less noise by explaining what is not a
    vulnerability.

I can rework that part a bit to reflect this.

Willy
