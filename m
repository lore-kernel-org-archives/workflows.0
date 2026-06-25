Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFF23E171C;
	Thu, 25 Jun 2026 12:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390675; cv=none; b=bhstXb5NoEWU55eT33o4Nf6D3yA1a9cipgo2oQGyFJMvvZU7hQ/BOQ0A5evzCxx+Zr785+1kyrJSt9AmP9R4h8lwz1wWuyMItCf3nHizLgreuHUJwaACcSOKEWtqEqH+W7Q5e0d4oNiDPFz79NRTUbq17nlbsuJveWJ+pY3bqHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390675; c=relaxed/simple;
	bh=5xy8h636tmtCopoxuXzUZkd3JJK5P0fFfNE178+TpLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXyrm7z116j//sx0Dz424wZD1/Tn+ADmWQS4WenUTCmM8N25dC78X+rHpu2sqIbZ+sfC+nUAzc0jEV5tFjAvaJdWbo6LInT8gDNX/EaBsEjuwIpsMpf0Czkg91qN1LgjIhwN0BeQ1gzOf+ywYKGvFgVHd4m+3H2qAJWAsYElYRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=YE4w6uHD; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="YE4w6uHD"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AF8D3ED96;
	Thu, 25 Jun 2026 12:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1782390663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0/JVB+W7sCf7Gi/CyFGpUxCh0l8gAFhKDGHEk2hQoJc=;
	b=YE4w6uHDsRSzpd5ImGoFCmdhvfJjeFAkDaY45U7yqYkJrCzELZUpAyEQX/2KRgtT0s6Qpk
	HCIG2GoHK9QG3aJQvIEHNT0TJQwfBYaimZJCGcg6GlfTcuV3+9ctm1kvJf0srhqBT0lvRP
	4fnLRwm/yUNLnFt/WEhg9cZq891pgfFd1GQfNWDGOPkFRN/34TjhFzD9pn61clA/8Ozrdu
	/QTnBInVgbnou+/IG/AlW3FETRjz/60U8rQ5OQtfuJSZsDieOzOkZ/Ep+PApHvTbIiPpNA
	ubR1653fdIrE80t0pq88v9LtT8iMVzXO+0VfE0CCUFfNGi7R/4S57V23jCHeww==
Message-ID: <00735150-06ec-4274-a66a-c1d1052482a5@gtucker.io>
Date: Thu, 25 Jun 2026 14:31:01 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hosting first-party kernel.org container images
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Ben Copeland <ben.copeland@linaro.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 workflows@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io>
 <CAL0q8a7mepGUdgrLsQhCUdLVP8VcxB9x_oBRCWAYNeoVAUb=7A@mail.gmail.com>
 <78adef0e-81b0-47d4-be20-32f42ab8ec04@gtucker.io>
 <CANiq72=t=q4__vwTFjg+gQyjKLUEJrZBngr3cAnnKiTNM5uteg@mail.gmail.com>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <CANiq72=t=q4__vwTFjg+gQyjKLUEJrZBngr3cAnnKiTNM5uteg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTFo3v66VJpNjhW3/jKHwEKcUvhtc2Ace844iZNYuGRBUCPHz2RWlFpYtFfI/Jjq6uDs8AwIw4DAPKsj3d/5p3J2wJAAvjs6HVsIf8voEr+47OCdR0wBkzlhly++wxPFzAW3iO1QHkxpSi2ma1uJUXC+4901uzyOoQYVkPp24ZxVEvW6S0OcVSP6AMES85erL7wQIzSpsswbrLITbJajBu76TcYfRcyChGGPGehwc3RUwGbYcc2cZSFg2vsuuRZbJaGNq8s5js+1LotiICPMd6gtGDi1IwDzSK4K8hUBeDIVj9eKDCJLD5TqvFHRSGMg6AndXCRDj12sS5ZmRqtXebD0izxXyu6EFdmfSps1Ih6UZD4DoJod9mkHh2JzEnt51y6c5QtPI0XPBlkWwDGee+/T6s+DaRlFRCc98BGRFQglsNgPtO3SovC1b0mHDcR2xblofyox2wMSmIO8ifGVB1ONWCknUZW7gyLpTjbkzXd9cI/1Aa2d0rG4fgfjwKxeIql8CEH+W7qMytPM9xey4DqQLmCYID7e/mG+5+sYgE7OPJLEFoMXzyR7sKbpi1JmIwVp3xJNyRGeCimOjxojnIZirDVjRFCSpMhOK+kHx2BDSdIcBjiQD0gfjs0X7QA9mdaP+gP190POjb0khVZhtJnUbYWmSgbbJlWXDLzGodWiYA

Hi Miguel,

(sorry, picking this up again after a long pause)

On 19/03/2026 12:10, Miguel Ojeda wrote:
> On Wed, Feb 25, 2026 at 3:44 PM Guillaume Tucker <gtucker@gtucker.io> wrote:
>>
>> Nathan, Nicolas, Miguel - what are your thoughts on this?
> 
> I agree with Nathan that `Containerfile`s on git.kernel.org sounds good.

Thanks for your feedback.  My understanding of Nathan's reply is that
it's more about looking for what users need in practice to drive
decisions rather than any strong opinion regarding this approach, but
I think we all agree at some level.

> While many kernel developers may not use them (mostly because everyone
> has their own setup already), if we had a set of "base" images that
> are maintained by someone trusted (including publishing them in the
> usual registries for easy use), then I think a bunch of us would
> actually use them for CI and possibly other tasks; just like some of
> us already use the kernel.org toolchains "manually" anyway etc.
> 
> It could serve as an entry point to discover the different toolchains
> and software offered by kernel.org, i.e. not just the GCC and LLVM and
> LLVM+Rust toolchains, but also perhaps `b4` pre-installed and so on.
> Even things like `tc-build` or the latest and greatest set of AI
> context text files could be considered too.
> 
> It could also perhaps simplify a tiny bit giving quick reproducers
> compared to giving the instructions for a distro base image + extra
> things to install. It could also be a good thing to give newcomers
> (i.e. how to set up all the development environment is a common
> question) and LLMs.
> 
> I mean, all this is nothing new of course, but sometimes trust and
> convenience go a long way.

Yes I believe there's a solid list of reasons why this would be a
good thing to have, and also no compelling reason to do it right now.
As I happen to have some R&D time available to spend on this again,
we can resume progress and aim for a first goal.

What I'm proposing next is to make it trivial for developers to use
scripts/container with the TuxMake images that include the kernel.org
toolchains via either built-in defaults in the tool or a standard
user config file.  I'm under the impression that at least a few
people have started using the tool so I think there's a real growing
interest there.  The TuxMake images can further facilitate adoption.

Then as a separate initiative, we can consider keeping Containerfiles
on git.kernel.org if developers feel it would make sense and maybe
even images in a dedicated registry.  These things aren't on the
critical path for using the tool, they're more like potential
consequences of people using it.  So we'll see how this goes.

Best wishes,
Guillaume
