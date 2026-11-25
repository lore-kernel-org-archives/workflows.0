Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648322;
	b=qUVsdE2cGGeMg7qBsVyry34kHLF9YhBg4hXR5HSZoNyX2VNAC+b0VezOM3MUpyRHUJ0l
	 +JnQY5m81o1qa9HvqsF8X1sKFxUexbstx4NZ57Ov83W19vLjal9KlFQ8i6lNfTuV8CSbp
	 CP327raY1p4jdhW3r1PeTBK47bNPD0ih1XLAOyQko1gxH1+hwQSvnSt2dhgocs7inQ+Ym
	 Jey5yLCbDjjGvwUNEkuMF5S2sof1kB4mhOu6DVS9/gbALkOAzOz2OspE9qh3oSm1K8Umk
	 Jx5EM9fkfGaD4sDaVK+Le2GjQvYrPvH5aX5yNDepFIXWJ5KwOhKRmyLLYFMI9P+YV4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648322;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=WoJMC9k45nXduaeGWiikgSM0h/+EJXvbBhCZ69eOchM=;
	b=WBoTPlzAe76jg+BgS8BRolOGmjt67UE1++xd5JMMSSCuf1VVPeLzg9UllO7j6gBwfwyj
	 yC+B75L/0/LviSdjUagQWYeCrluxHmNU/X4+7rL95iHZUOekz+XfW7DX/LVbRWhjSY5ZY
	 jNZndVVRHE6OyCuXcwsi0KIyuz3G6DUF1v0q3o20VBVX+O2simIarjbMLx66S1NXif6v+
	 he4kGJaBNzweYdp/ytj3bgYUHDvw5AK84U56XHG4/rW9VYAArSM3Vhh7QQPQ992UVSzQ4
	 ewVpPnulCu0f5vgIT00ZZLv0GBxSeAZ0OGxaw9pXDYatfnsPSR89FQ51JBo+AF9035Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b="Wl/eduvZ";
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922B5606A326;
	Wed, 25 Nov 2026 23:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 922B5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=Wl/eduvZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1795648319; bh=WoJMC9k45nXduaeGWiikgSM0h/+EJXvbBhCZ69eOchM=;
	h=From:Message-ID:From;
	b=Wl/eduvZLVdy8IHIaB5qrLv64bYycFfEYyWVUbPAYUW/eT6/m1NvOmh5doisIiEB/
	 VXwQf+znWQnPVdwLZPI56VVWgN/mXhe0ivSSHy0r8oNOseL6AJx01vsMvaxD4RF3I8
	 0lzeeunpPOoShcqmBUOYcCQ3/FkQ8hkBQBIuEKa4=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 25E86C0701;
	Thu, 26 Nov 2026 00:11:59 +0100 (CET)
Date: Thu, 26 Nov 2026 00:11:58 +0100
From: Willy Tarreau <w@1wt.eu>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, gregkh@linuxfoundation.org,
        Johan Hovold <johan@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 05/14] docs: security-bugs: explain how to send a fix
 that can be applied
Message-ID: <awdrPui-KI-SK_5N@1wt.eu>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-6-w@1wt.eu>
 <awdqgBF62SOKaU0Q@archie.me>
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
In-Reply-To: <awdqgBF62SOKaU0Q@archie.me>

On Thu, Nov 26, 2026 at 06:08:54AM +0700, Bagas Sanjaya wrote:
> On Sat, Nov 14, 2026 at 08:00:05PM +0100, Willy Tarreau wrote:
> > +Most fixes sent along with reports cannot be applied as-is because they were
> > +damaged by the mailer or lacking a commit message, forcing maintainers to ask
> > +for a resend. A fix must be applicable using ``git am``, which is most easily
> > +achieved by letting git produce and send the messages (see
> > +Documentation/process/submitting-patches.rst).
> > +
> > +When the fix is meant to only be sent privately, the preferred method is to
> > +send the report as a cover letter of a series, followed by the fix::
> 
> Documentation/process/submitting-patches.rst guidelines also applies to
> privately-sent fixes, no?

Yes, why this question ?

> > +
> > +  $ git format-patch --cover-letter -1
> > +  (edit 0000-cover-letter.patch and replace the subject and text with the
> > +   report's subject and text)
> replace the subject and message body placeholder as appropriate for the report

That's a wording detail / preference, not going to respin a series for that!

Thanks,
Willy
