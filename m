Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6E13644DB;
	Thu, 14 May 2026 04:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778733281; cv=none; b=J2a8ybw16KI0dA2C8rETCb1vaTBqqRsncIdKjLNQ8snsm0mE4tqt8C2Syot29Lk0rW2nbMqJhKqx7BPqFQV2nx04KvGqKZZp6hRPB2aeU708229hn9lZm1Krjyq76z9MXX/l6jWwr0CCPctdumFtLgC182njbu+tbtsdxApKPMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778733281; c=relaxed/simple;
	bh=BNf1beC3TI86lss8hwiwviIrGH3cMUo8qdYpSgcIXT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u30GitoCaWZk1X/dC8tCaIImqLrF6W5Gr7TqwaqbdX6t06sAuoGwLhWykQC6d546LaSNbJVjFhyc7zx3UbpHSrl0ppr4lHHg1O8R37w1GH5QkxgYFBZWR0k0812J+dcqnq2CMsZOuoNQRF802gSu1j9Rq5skWkqVY+IvJtA2Qig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=CPkwUZt6; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="CPkwUZt6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778733277; bh=gYTruxw5di493xWes33loBllKmvw/soytjivzEwoEVY=;
	h=From:Message-ID:From;
	b=CPkwUZt6w4QR12LQxXbimVtu8bYud8QawFfwa+kgz2rVMX3CuLiCoTjUJ0xfXAlTQ
	 2X8esRhfsCPCyi6dyGfYUHKi62xna8+FbOtaHVtD0HMC1H8Tdlh9xy6ROVUJkK1lr+
	 FTn8XIouvmwoNe6NiNWSutkISiTt8NNm3TYBhPNI=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 81063C0B5D;
	Thu, 14 May 2026 06:34:37 +0200 (CEST)
Date: Thu, 14 May 2026 06:34:37 +0200
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>,
        skhan@linuxfoundation.org, security@kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] Documentation: security-bugs: clarify
 requirements for AI-assisted reports
Message-ID: <agVQ3ZiUpoMGQ4vY@1wt.eu>
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
> jon

Indeed, looks good like this as it won't hide the file name from the
link. In case you'd want it:

  Acked-by: Willy Tarreau <w@1wt.eu>

Thank you! 
Willy

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
> 
> diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
> index f85c65f31f12f..3c51ddde31dd9 100644
> --- a/Documentation/process/security-bugs.rst
> +++ b/Documentation/process/security-bugs.rst
> @@ -191,12 +191,13 @@ handle:
>      Please **always convert your report to plain text** without any formatting
>      decorations before sending it.
>  
> -  * **Impact Evaluation**: Many AI-generated reports lack an understanding of
> -    the kernel's threat model and go to great lengths inventing theoretical
> -    consequences. This adds noise and complicates triage. Please stick to
> -    verifiable facts (e.g., "this bug permits any user to gain CAP_NET_ADMIN")
> -    without enumerating speculative implications. Have your tool read this
> -    documentation as part of the evaluation process.
> +  * **Impact Evaluation**: Many AI-generated reports lack an understanding
> +    of the kernel's threat model (see Documentation/process/threat-model.rst)
> +    and go to great lengths inventing theoretical consequences. This adds
> +    noise and complicates triage. Please stick to verifiable facts (e.g.,
> +    "this bug permits any user to gain CAP_NET_ADMIN") without enumerating
> +    speculative implications. Have your tool read this documentation as
> +    part of the evaluation process.
>  
>    * **Reproducer**: AI-based tools are often capable of generating reproducers.
>      Please always ensure your tool provides one and **test it thoroughly**. If
> diff --git a/Documentation/process/threat-model.rst b/Documentation/process/threat-model.rst
> index ecb432390e792..91da52f7114fd 100644
> --- a/Documentation/process/threat-model.rst
> +++ b/Documentation/process/threat-model.rst
> @@ -1,5 +1,3 @@
> -.. _threatmodel:
> -
>  The Linux Kernel threat model
>  =============================
>  
> -- 
> 2.53.0
> 
