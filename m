Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D104A1A6808;
	Thu, 14 May 2026 04:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778733155; cv=none; b=E9ohiKLNPeAzFpXvs0aUO7Xzyb/M4qftdRJiOf6K+AGCHLQRPZCymoVVw6M6MjL1l5Z7kW8wLsfiT3fubF/LJ/yOVCzbpyivcGkcBgdlzwGBjLo+kLEGyEZdn/3x15x5AHSa13ifOOyok2UBi9fGntkF450+Af2rHtgiL3caVnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778733155; c=relaxed/simple;
	bh=ChrIsL7aqAz8JUaXNX+awqts9u7WorqGLWdlCrHa9js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMKQqEJwmUI6kJzUtmWYIpCBAxVrBGVO1k1IBEB/c2XKIqOXMNAX2211ER5rahZ8uP6CUplRf/twyJTaV7+evZ9g5nG8p40W3xGZf+0rD6m65STTyN6SYibHQDhLcgY4olyBHXV32j2CI7lVqddToojkUeCw9qfRToAUT8u7Mus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=SwA8HEn+; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="SwA8HEn+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778733144; bh=pN8qLlpR0YPkiCocfJgAgYUAA/OaIyy+ovOWpLPUKsk=;
	h=From:Message-ID:From;
	b=SwA8HEn+YiQdRo8Vm1u2V53kbteIHswApLxbwiZrF3KVssoq3RUeeFE8CWHpV6Io+
	 tk5efdpNQVCmx9oxuEi7Nm2GMaQzFQO1iMGGbRQbWd/x3/1+NOxX2MMLe4vJu5K6/Y
	 rxjsW0YSlgWGcsqKOGKWvWKq753jc94C2AdtqR9c=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 91299C0B5D;
	Thu, 14 May 2026 06:32:24 +0200 (CEST)
Date: Thu, 14 May 2026 06:32:24 +0200
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>,
        skhan@linuxfoundation.org, security@kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <agVQWKR63Nqs8rp-@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-3-w@1wt.eu>
 <87wlx8o87g.fsf@trenco.lwn.net>
 <2026051333-puzzle-smokiness-8096@gregkh>
 <agRfFoMC2Gcu0Esz@1wt.eu>
 <87ecjfmpzj.fsf@trenco.lwn.net>
 <agR1-2Sj1KO9oM2k@1wt.eu>
 <87fr3v6my2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fr3v6my2.fsf@trenco.lwn.net>

Hi Jon,

On Wed, May 13, 2026 at 03:04:21PM -0600, Jonathan Corbet wrote:
> Willy Tarreau <w@1wt.eu> writes:
> 
> > On Wed, May 13, 2026 at 06:52:00AM -0600, Jonathan Corbet wrote:
> 
> >> I definitely wouldn't argue for making it longer, and enumerating all of
> >> the make-me-root capabilities would be silly.  I would consider just
> >> replacing CAP_SYS_ADMIN with "elevated capabilities" or some such.  That
> >> might rule out legitimate reports where some capability provides an
> >> access it shouldn't, but I suspect you could live with that :)
> >
> > I think it could indeed work like this, without denaturating the rest
> > of the paragraph and having broader coverage. Do you think you could
> > amend/update it ? I'm not trying to add you any burden, it's just that
> > it will take me more time before I provide an update :-/
> 
> How's the following?

Looks good, thank you! In case this is needed:

  Acked-by: Willy Tarreau <w@1wt.eu>

> (While I was there, I noticed that threat-model.rst has no SPDX line;
> what's your preference there?)

I didn't notice any was needed, I tried to get inspiration from other
files for the format (I'm still not familiar with the rst format
though this time I could successfully install the tools). Same for
the label at the top BTW, I just did what I found somewhere else,
probably security-bugs.rst which is similar (no SPDX line and has a
label). So regarding SPDX, I do not have any preference. If one is
needed, let's pick what's used by default, I do not care, as long
as it allows the doc to be published.

Thanks,
Willy

> Thanks,
> 
> jon
> 
> >From 1e15a25142583e312dcc504b0279d47508cbfdab Mon Sep 17 00:00:00 2001
> From: Jonathan Corbet <corbet@lwn.net>
> Date: Wed, 13 May 2026 14:58:53 -0600
> Subject: [PATCH 2/2] docs: threat-model: don't limit root capabilities to
>  CAP_SYS_ADMIN
> 
> The threat-model document says that only users with CAP_SYS_ADMIN can carry
> out a number of admin-level tasks, but there are numerous capabilities that
> can confer that sort of power.  Generalize the text slightly to make it
> clear that CAP_SYS_ADMIN is not the only all-powerful capability.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/process/threat-model.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/threat-model.rst b/Documentation/process/threat-model.rst
> index 91da52f7114fd..f177b8d3c1caf 100644
> --- a/Documentation/process/threat-model.rst
> +++ b/Documentation/process/threat-model.rst
> @@ -62,7 +62,8 @@ on common processors featuring privilege levels and memory management units:
>  
>  * **Capability-based protection**:
>  
> -  * users not having the ``CAP_SYS_ADMIN`` capability may not alter the
> +  * users not having elevated capabilities (including but not limited to
> +    CAP_SYS_ADMIN) may not alter the
>      kernel's configuration, memory nor state, change other users' view of the
>      file system layout, grant any user capabilities they do not have, nor
>      affect the system's availability (shutdown, reboot, panic, hang, or making
> -- 
> 2.53.0
