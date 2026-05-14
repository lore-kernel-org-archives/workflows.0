Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9315B1DF748;
	Thu, 14 May 2026 07:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778743478; cv=none; b=UfF3y1l+tSOv5A2NXWcGQZoBlJboI9LXmX8kOGymkbcjOwAQI6hrxtov2bleAhNR5u2ZZoiA0JoxFMDlPZSbYyxa+orgUA4EBoXkYKpPZUQHCz2bp4jkZhJ0qmMREuZwe/4NDWdFuD9hhDTw2PiMz8QX0x8frZVNPExJgkaoHsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778743478; c=relaxed/simple;
	bh=qyBgmyKnXrQV6qm83BCHmNVHAslYtlyBrnJabep9YJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJBskK20R0s/CruQxg7D422U09BD1hMTsea0E+dUkXt5cDtB+JUwbrNc5Hc4Za/dSSYWxRWXv36lMMY6tcEnzac8pmbd/eDKGEB0Ga1y9baXntfmcYga01/velIoTjv1SJhkbTe5HCocxG4Pbe6F8/yuGZnmAG5nCYceVMBNySI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE61FC2BCB7;
	Thu, 14 May 2026 07:24:37 +0000 (UTC)
Date: Thu, 14 May 2026 09:23:53 +0200
From: Greg KH <greg@kroah.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Willy Tarreau <w@1wt.eu>, Leon Romanovsky <leon@kernel.org>,
	skhan@linuxfoundation.org, security@kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] Documentation: security-bugs: clarify
 requirements for AI-assisted reports
Message-ID: <2026051439-reorder-flight-5a14@gregkh>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-4-w@1wt.eu>
 <87se7wo861.fsf@trenco.lwn.net>
 <2026051353-apricot-kleenex-fa57@gregkh>
 <agRfXQvN7ZDTNGQG@1wt.eu>
 <87a4u3mpxk.fsf@trenco.lwn.net>
 <87ik8r6n1r.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ik8r6n1r.fsf@trenco.lwn.net>

On Wed, May 13, 2026 at 03:02:08PM -0600, Jonathan Corbet wrote:
> Jonathan Corbet <corbet@lwn.net> writes:
> 
> > Willy Tarreau <w@1wt.eu> writes:
> >
> >> On Wed, May 13, 2026 at 12:30:10PM +0200, Greg KH wrote:
> >>> > One nit:
> >>> > 
> >>> > > +  * **Impact Evaluation**: Many AI-generated reports lack an understanding of
> >>> > > +    the kernel's threat model and go to great lengths inventing theoretical
> >>> > > +    consequences.
> >>> > 
> >>> > If only we had a shiny new document describing that threat model that we
> >>> > could reference here... :)
> >>> 
> >>> Ah yes, a link to that would make things better, but don't we have that
> >>> elsewhere in this series?
> >>
> >> It's in the same patch, I think Jon was sarcastic here. I thought I had
> >> addressed that one but apparently I was wrong :-/
> >
> > I'm just saying that this particular text should link to that document,
> > don't make readers go searching for it.  I can certainly add a patch
> > doing that if you like.
> 
> I was thinking something like this.
> 
> jon
> 
> >From 3f02a3c190bab6b54e2a250ead0c7408af1a3c51 Mon Sep 17 00:00:00 2001
> From: Jonathan Corbet <corbet@lwn.net>
> Date: Wed, 13 May 2026 14:51:29 -0600
> Subject: [PATCH 1/2] docs: security-bugs: add a link to the threat-model
>  documentation
> 
> Rather than make readers search for this document, just a link to it where
> it is referenced.
> 
> (While I was at it, I removed the unused and unneeded _threatmodel label
> from the top of threat-model.rst).
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/process/security-bugs.rst | 13 +++++++------
>  Documentation/process/threat-model.rst  |  2 --
>  2 files changed, 7 insertions(+), 8 deletions(-)

Looks good, thanks!

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
