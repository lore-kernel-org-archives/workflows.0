Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092895;
	b=iqbVVB2GwRx6qtb5Fzoo1VZx27RSWPGqAlsdA/xxZZLufdLRIpUewTbVTWdmhjRfXL1T
	 n6MPb3GQ1Iqx2S/Flx9JtJUS/zNnYceAaAzUcmD8gw4AgTOlj1uC/qWv7NTTq+4hdD02u
	 qN+K5fedgbekQPMI7FOFLwcESyYW/QBlqjNYI2JFWQFeLbdsZzuXCBU5RabfB0wsitXfU
	 As8dktnWx9DVJmdGyhGWKzhWZXdsLBUvMeEZWERG84mgcurI/sfHtns9OxxI4fNChE60P
	 0HUJxLLv9nXXlA5xfrYd28OmKyqhE8MIlyBrWmSy9pAN8ovylzNSOcf5uadjHOopE+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092895;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=km7LDHNPxX4e4wuO40L2V79o2NhbF+mkYqzBP/cqFYg=;
	b=svqruAMUURlMVwoEWPN/01sv/iZY10CUHC/NRl9KdJzg76T57jMtDDn2dhRJQd9Sh6G2
	 oTc+pCzv1jZw15NykqE1NVyYfxjLHlr+hEGLkPekA0nfYH8u3xzviGaivSNDqns+L1XHJ
	 NsqVfVXA3uZlXttpZrXQL7HhiWW+iUaKrxkuh+l9AmCdzy1eDgZV9I8lX8ptbSAB5KiZp
	 OL7caTTBUKVhWzDCv56gAncUb74MORfsefuolyk3C+JHKJuaUkLwwP/jl+Kbe1Oz9oHNX
	 X0TqCNbR3rWsCG/3Dn18Z+mu7pToID2k8G6l4sVxzFtrClPwcFVoJrALoGBGIAfSRfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjH9gCkK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F94606A320;
	Thu, 19 Nov 2026 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjH9gCkK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0460F1F000C5;
	Thu, 19 Nov 2026 12:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795092894;
	bh=km7LDHNPxX4e4wuO40L2V79o2NhbF+mkYqzBP/cqFYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kjH9gCkK6Pn8FoQx8sJs/RNfbGsH7seAY54RXGjdgb9kehWRTMJyai//SK/bYPuEK
	 6aj+RwOLlEQfpISNcamWwys2s8rcDcKyZPgGMPwjTaddZrTNk1UB8xnnO0zfjdugW+
	 vHRjXk1hH3iB6XLp6Voy5GF+HwTaSg10wZ86nOuChOZlFF0ORP5Kk0LUX/vqIU1s2q
	 +rh4k6UI7IKYOLKpFXvW47khbCsQvfoZ6w8HpTPDOpU5U1gnK2c6SS4AubRwbHSpKo
	 DaLGiAwAx4rVQNn2ObIRCebbzNguI9XwCbsQ3FhMiqfDgArLqx33SK6hFfYzwQfpxZ
	 cfAdSwF+HncGw==
Date: Thu, 19 Nov 2026 14:54:50 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <20261119125450.GJ162713@unreal>
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
 <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>
 <20261119111902.GH162713@unreal>
 <04ff90ba-296a-4618-9d25-390f84f856ae@kernel.org>
 <av7tY64O34gbJvH_@1wt.eu>
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
In-Reply-To: <av7tY64O34gbJvH_@1wt.eu>

On Thu, Nov 19, 2026 at 01:36:51PM +0100, Willy Tarreau wrote:
> On Thu, Nov 19, 2026 at 01:04:32PM +0100, Krzysztof Kozlowski wrote:
> > On 19/11/2026 12:19, Leon Romanovsky wrote:
> > > On Thu, Nov 19, 2026 at 11:13:57AM +0100, Krzysztof Kozlowski wrote:
> > >>>> v1: https://lore.kernel.org/r/20261116191436.188098-1-sashal@kernel.org
> > >>>>
> > >>>>  Documentation/process/coding-assistants.rst  |  6 +++--
> > >>>>  Documentation/process/submitting-patches.rst | 23 ++++++++++++++++++++
> > >>>>  2 files changed, 27 insertions(+), 2 deletions(-)
> > >>>
> > >>> Sasha,
> > >>>
> > >>> Since you're already making changes in that area, could you add a sentence
> > >>> asking reporters to provide the full dmesg stack trace?
> > >>
> > >> If so, then trimmed. We do not need all addresses and registers and the
> > >> [time markers], but rather the calltrace from decode_stacktrace.sh.
> > > 
> > > Regarding time markers, I agree. However, addresses are an important part of
> > > debugging information. These bugs are rare, but addresses are still useful for
> > > identifying incorrect pointer arithmetic or pointer assignments.
> > 
> > Depending on the case, e.g. some driver lockdep reports don't need them.
> > NULL ptr usually as well. The point is that dmesg should be trimmed to
> > relevant and useful information. If that includes addresses for that
> > particular case, then of course these should stay. But 75% of data here
> > in commit like 5b4bd13e0552926648a46c2c9a12a24dfaee3715 is not really
> > helping. In the same time undecoded call trace is useless, because these
> > addresses depends on the build. The dmesg should simply be the decoded
> > stacktrace ONLY for this case.
> 
> Then just the 2-3 lines capture inline, and the full log attached could
> please everyone ?

I don't think so, because this information is also important to preserve in the
Git history. I received offline feedback that the full stack is useful for
backporting and customer support, too. Sometimes the dmesg output is similar
enough to recognize, but differs in two or three lines.

I welcome AI-generated patches, but they should not be trusted blindly.
I also don't believe AI can reliably trim stack traces.

Thanks

> 
> Willy
