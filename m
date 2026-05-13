Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AFF3655EE;
	Wed, 13 May 2026 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677104; cv=none; b=Qej6em0A+cJBXTLSTYuysJFkKuffsF1aQyGt2i8nmprj3RLy9bGvR0QfyS4pKFT0Zn3yX5Phb21an7ZezZP4VZ/FSsf5L7ZDnaFSd5CqPbSsuSqACADJfAZSpTwzeqw140rmQ1E8RU/gk0BypT+3ORBYAMMYiziDaP57GOiNsYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677104; c=relaxed/simple;
	bh=++15Zm8EsjxdSFxKum1kXNQmUOyyLrCD/zkFTR1A7dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mo6MmyD0u4bm0bZjyuNxJ/pNthivFZtHcYZxfbJsM03C3MnMGqFywfLv4KebHWnlScflrREDIjNZIyMwarPNtR9xF2HfzavDhJxi267CtY0GkEgLOb626i3TiCacZt1FJiPEep/XhArBn/D0zECm7OTObFgWDVMlndkGuDc9T5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=Xzsxfh3d; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="Xzsxfh3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778677099; bh=XokBXItwAJ511mMtz7LpI940MXrMEWQfmJDpWe9Taew=;
	h=From:Message-ID:From;
	b=Xzsxfh3ddM5FYJ1FujiCRMzyU9Z4X6cBnnaCLhkMHCu5Yt8zN1dTk43EYsXcmdnPu
	 oO3LhwU4OYzTYvvn2of0uNfiOZS4OPkaMsH99sd5VCTrOE6tf7p5dyeUD5i26O/ctR
	 cGk087bkAgNSoZv/hWW10PZYJX8880j1qwvUnm+4=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 528FFC0A33;
	Wed, 13 May 2026 14:58:19 +0200 (CEST)
Date: Wed, 13 May 2026 14:58:18 +0200
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>,
        skhan@linuxfoundation.org, security@kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] Documentation: security-bugs: clarify
 requirements for AI-assisted reports
Message-ID: <agR1ag43uhKukzw3@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-4-w@1wt.eu>
 <87se7wo861.fsf@trenco.lwn.net>
 <2026051353-apricot-kleenex-fa57@gregkh>
 <agRfXQvN7ZDTNGQG@1wt.eu>
 <87a4u3mpxk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4u3mpxk.fsf@trenco.lwn.net>

On Wed, May 13, 2026 at 06:53:11AM -0600, Jonathan Corbet wrote:
> Willy Tarreau <w@1wt.eu> writes:
> 
> > On Wed, May 13, 2026 at 12:30:10PM +0200, Greg KH wrote:
> >> > One nit:
> >> > 
> >> > > +  * **Impact Evaluation**: Many AI-generated reports lack an understanding of
> >> > > +    the kernel's threat model and go to great lengths inventing theoretical
> >> > > +    consequences.
> >> > 
> >> > If only we had a shiny new document describing that threat model that we
> >> > could reference here... :)
> >> 
> >> Ah yes, a link to that would make things better, but don't we have that
> >> elsewhere in this series?
> >
> > It's in the same patch, I think Jon was sarcastic here. I thought I had
> > addressed that one but apparently I was wrong :-/
> 
> I'm just saying that this particular text should link to that document,
> don't make readers go searching for it.  I can certainly add a patch
> doing that if you like.

That would be kind, thank you Jon. Feel free to modify my patch if you
haven't published it if you prefer.

Thanks!
willy
