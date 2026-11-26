Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687388;
	b=ETFCUaBkGERUaMOpELLDE9F6i9VfpGeOcFU6dRARY5N/D4k5TEdPahDYy0wwz8EA2Rd2
	 HWlesTRr1QHr+idY+58whY87dB0xp1YmT5B6VahPrxGo/+DhgWjQKQAQoaIq43Ax04jIN
	 VFLcE7ny8kOrGXD8xQ8l5f7f721GOZg3SBq+q8BGm0TKLNj3s2wIaAHBQbiXa5PsxdNRB
	 o341ImaEAAwkkHPAJtycfPly2CkSZbAT9P7OVyQA9Q13W6zCWKlmBQZUTuzawsFwwj/Do
	 VzVSbhLrUc52Rp1mL6htJyIKogI/OI/jFHh2zG64H3sYwFNo7fp+SMnCYmONaoqyPGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687388;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nvUQAu5hfqrCpAWKTZhT16YQ/ndR7wx4b807Dm1ijNE=;
	b=K3vxrPA6kb1FGBp6VB2wdgky2OBOY89d9dUqGFgHApQQmFqLKJuMPMOBBUF0fSMrUMDF
	 rEp/DitcNRjVE8iUbRcYl+NycGmmX02GZdVkETdZRfpv5vfQ/EHo7Fkkw2jghRuK9909h
	 iAwD2eUNo+v48zd5KxFoQYFbnwMwj1ybhPS4N9NBpWnAz81PA0b37F98Z1VHvJsAxKDJZ
	 7xa+M1t2LBa8N/ccYKVVF1bVGy1AT5W3yX60AMkGpDO9Vv8uCgBLIJUl/7YRKWBBxkwdR
	 TRwC2MY3PNfa1mX7lS6X1JFImsQXvxxbpYd8UfwisFP4sCXInKRpmP8qx7cFOUAz4Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MdrHT3rY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3B6606A31C;
	Thu, 26 Nov 2026 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MdrHT3rY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B79E1F000C6;
	Thu, 26 Nov 2026 10:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795687388;
	bh=nvUQAu5hfqrCpAWKTZhT16YQ/ndR7wx4b807Dm1ijNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MdrHT3rYqxN2GJCrGejAnmr9YhGi/Kt4bJ9mg2PNQ+UdhhhMf/LMqZ//FD2JHkHDf
	 LC2s6pgDsfLL0duQlAlQ57Bv6tbJuPj19/XqAcQ6fq4iZHnsRYcMQc0qFMRqn9rp/h
	 4UiUrGux1R5OW56+LSDwRhtW2cfyG9awbe41vA+tIJwfRdFe3PdYLpUksAr7lT4u18
	 b+hFlJCk3uV3afE4jKafJUeQ85LUdtaY+RyxYKIfor0u+ivooqbOd8fOASOba+26o4
	 MRCieroIOgwaymMzJUppyJ/FbM1e+5ZjHNTpLKSuPPX4JA4SdFy/Xha1FGBiohtRtk
	 xjxYQqhAnhD6Q==
Date: Thu, 26 Nov 2026 12:03:02 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: Limit backtrace trimming to
 timestamps
Message-ID: <20261126100302.GG774860@unreal>
References: <20261126-backtrace-timestamps-v1-1-0a645b25e5ae@kernel.org>
 <CAMuHMdW5mxjaAXcu6nAiK1k6umpCVbfCpPPofPCbv6f9xr3_dg@mail.gmail.com>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW5mxjaAXcu6nAiK1k6umpCVbfCpPPofPCbv6f9xr3_dg@mail.gmail.com>

On Thu, Nov 26, 2026 at 10:45:17AM +0100, Geert Uytterhoeven wrote:
> On Thu, 26 Nov 2026 at 09:13, Leon Romanovsky <leon@kernel.org> wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> >
> > AI tools tend to trim backtraces too far. Taint flags, module lists and
> > module names disappear, which hides that an out-of-tree module was
> > involved or that an in-kernel API was misused, especially a driver API
> > that is not meant for general use.
> >
> > Ask authors to remove only the timestamps and drop the example, which
> > shows a trace reduced to bare function names. Timestamps are the one
> > part of a dump that adds only noise.
> >
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  Documentation/process/submitting-patches.rst | 20 ++++----------------
> >  1 file changed, 4 insertions(+), 16 deletions(-)
> >
> > diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> > index 85ba046d66fbf..56b1b38ac59cf 100644
> > --- a/Documentation/process/submitting-patches.rst
> > +++ b/Documentation/process/submitting-patches.rst
> > @@ -763,22 +763,10 @@ phrase``, it is important to be both succinct as well as descriptive.
> >  Backtraces in commit messages
> >  """""""""""""""""""""""""""""
> >
> > -Backtraces help document the call chain leading to a problem. However,
> > -not all backtraces are helpful. For example, early boot call chains are
> > -unique and obvious. Copying the full dmesg output verbatim, however,
> > -adds distracting information like timestamps, module lists, register and
> > -stack dumps.
> > -
> > -Therefore, the most useful backtraces should distill the relevant
> > -information from the dump, which makes it easier to focus on the real
> > -issue. Here is an example of a well-trimmed backtrace::
> > -
> > -  unchecked MSR access error: WRMSR to 0xd51 (tried to write 0x0000000000000064)
> > -  at rIP: 0xffffffffae059994 (native_write_msr+0x4/0x20)
> > -  Call Trace:
> > -  mba_wrmsr
> > -  update_domains
> > -  rdtgroup_mkdir
> > +Backtraces help document the call chain leading to a problem. Remove
> > +only the timestamps and keep the rest of the dump unchanged. Taint
> > +flags, module lists and module names show whether an out-of-tree module
> > +was involved or an in-kernel API was misused.
> 
> Please don't move the burden of distilling the relevant information
> from the (single) sender to the (multiple) receivers.

Kernel dump stacks have evolved over the years into their current form. They
contain different kinds of information, and you will often look for different
clues when working on different patches, even within the same subsystem.

The coding style guidance currently documented in Documentation contradicts
even with the basic debugging aid Greg describes here:
https://lwn.net/Articles/1103714/:

  Tainting (or not) on manual driver binding
  	...
	Early in the 7.4 merge window, Greg Kroah-Hartman applied a patch that caused
	the kernel to be marked as tainted whenever user space manually binds or unbinds
	a device driver to a device. This change was meant to be a defense against
	a flood of spurious bug reports generated by fuzzers,
	...

A commit message should help people understand why a patch is needed. This
one instead seems designed to persuade an AI to merge it without providing
enough information.

For reference, see this discussion of how AI fabricates reports today and
will do so in the future:
https://lore.kernel.org/workflows/20261116200515.352387-1-sashal@kernel.org/

Thanks

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
