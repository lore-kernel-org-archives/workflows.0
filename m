Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704466;
	b=b5Oi60RowhWqHjSvYukKZTvbBMIJlRfle9CYtauL/B7SsUPkWsBDrd/tVHAc6MMSrL7W
	 f/GAIuyntUtQM/8uWhXhj82Sc4Y+2H9wuENviuOunBiBFYuIit3hTKPuCShSruq2NRLxM
	 160WQT8WyeJ105xsI4jejJ7v/dayuV56l6sRez38kAz3puHvYl4jA11B1DM5yUcsr3ARs
	 G0alt9hanqMIeRYlu2wFD+a3XgW+q5HyunCekXPtajtKnWw8+yKtxrBi0HMCUR64sZJiX
	 9xPwKKVNN5n5U8HdI79obyIGOgK6Vcc5IAvoB23uJzOcrbMNqQA3VJIxX0BfRplXtLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704466;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HbDqO5PfLnJVP6Lbsj094JccLCxv/nfcyplB3Zsx0xI=;
	b=Nf+IzuaxqP8vFnPz3GtzOrveT+QtExndcFDDZtM8HPufVHQj8a3EeTttwTrhKD+VE6Fp
	 JDTFQNWq4/wVUGDUC43Tt9Kher2KOxw5uIej9fyLunFex8OcEN5wQGga7bDuoUtcWsouP
	 cMFQY5xTvrn7uhgla7ZWskV+uKE4M3vFM+9z4aZ6iz3wrWMnN8INr8qi4IPF6JBSU0lhJ
	 GZkLkHnebYXLO691eGNpRnnYasCSjzTZhpr3Dfz39c+tqVwKXbBID5nWOVip00NEQWeuT
	 OYxgBaDXuP1KkenLy+R95jomcEip0K7s0rlmolyWVkrFabVQBC6Qc4/WhfQckbaDwww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ebTi8J/r";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D967B606A321;
	Thu, 26 Nov 2026 14:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ebTi8J/r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A811F000C0;
	Thu, 26 Nov 2026 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795704466;
	bh=HbDqO5PfLnJVP6Lbsj094JccLCxv/nfcyplB3Zsx0xI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ebTi8J/rxEy9hRgD5Idv2XKwxTyjA9iv+kJ2FatCxLSdsUKjjQHjqagzX15TQ6Mte
	 V2ZNIOdLqt8irFAfywOlfkCAI643/e1ZBVq8zxoiT6eDpacCGG0rF7iQKBjo8dGhwc
	 m+ynFrt40ej9WtIxhgL6/VGSob1h3NIqNPb9ijBNWfj3xINrNmB5TzbJ74Gzdhp2aL
	 6pOmmH5rUPumk21CFUHONbkE2ECS4GY+2L5G7lomg0M2J7YtSbmGzPl7tuIyrLTzd6
	 z5aUwmP4vkuHat8pYQ2sgxQ+0h2kS7kPHRnO4SJ03N7aFoSmFUCSCdIgMz/zHbq2SI
	 yEbzYolvI5xVg==
Date: Thu, 26 Nov 2026 16:47:40 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] docs: submitting-patches: Limit backtrace trimming to
 timestamps
Message-ID: <20261126144740.GR774860@unreal>
References: <20261126-backtrace-timestamps-v1-1-0a645b25e5ae@kernel.org>
 <d4848afd-a23a-4119-ac09-1fe5e4681e3a@sirena.org.uk>
 <20261126125959.GL774860@unreal>
 <00561b8f-c85c-4cb4-82dd-aee3d14e509b@sirena.org.uk>
 <20261126133042.GM774860@unreal>
 <8836d5ee-b800-49e3-a866-327041384b40@sirena.org.uk>
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
In-Reply-To: <8836d5ee-b800-49e3-a866-327041384b40@sirena.org.uk>

On Thu, Nov 26, 2026 at 01:52:15PM +0000, Mark Brown wrote:
> On Thu, Nov 26, 2026 at 03:30:42PM +0200, Leon Romanovsky wrote:
> > On Thu, Nov 26, 2026 at 01:22:26PM +0000, Mark Brown wrote:
> 
> > > I think there's room for improvement but I think what you're proposing
> > > right now goes far too far in the other direction.  It is a very
> > > definitive statement that nothing should be removed, it would be better
> > > to do things like call out specific bits that are generally relevant and
> > > should not be removed (like taint information) and encourage people to
> > > use faddr2line.
> 
> > I'm aware that I took an overly aggressive approach, but there was a
> > reason for it - it lets us trim the text line by line. If we take the
> > opposite approach and add request for more information, we'll inevitably
> > miss important details.
> 
> That doesn't help with making the patch submission readily legible which
> goes to Geert's point that you're pushing the work of making the thing
> comprehensible onto everyone looking at the mail, and ideally whoever
> applies the patch.  Perhaps the stronger version of this is something
> that needs to go into per subsystem documentation if you find that's the
> best balance there, I know I have vastly more issues with having to page
> through enormous amounts of irrelevant information than with missing
> details.

I can try to work around this using the maintainer's profile, but can we at least
agree to remove the example from the documentation? It does more harm than good.

Thanks
