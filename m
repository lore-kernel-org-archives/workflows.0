Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649784;
	b=VM6MWtijHU9LkoJFTD/UOyp5sveg0Uft2f78sKxOvIqR4emdbGcvHkkfa+m56h/Ax2RY
	 2CrfzKbmKkCpRBfOsjf1bxcs3Dw5J8J2OH2M5pdxTT8PjeN6lumUNHubKmtKS8MpvqQTs
	 ECqrN/zmiyMvXWFdOmnDp5jHdpFQwTd+Fb8GuZ/N47TLMRC6UMgOPvFN6UL0gkNuJQjSQ
	 9VPGTyCxnssNaPj9nvGDNlrhwXgiyl5sxO4rZh5b/5vkZUMQbAFFIswLmRVl7jdPGpDrP
	 yWkDAbDtjKxVfAfC7RnpDUoWK3+jIRM612bmg4HRLAR5X22JE+J+uR3MJH0v120nHgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rlp9gEwrZkHdgv9tEPsrmJHObN6Zh/DO91hvElQOqsQ=;
	b=VguxGl0O38s26ANaJfK4W+BUnnaSpd14bwaIbQ6YyAFmPu9bqbvXe00J/n1I/KJ729aX
	 2iyB4KRaBXHGKY2OvIggdvcd5urK+URUNmIvC0pEoDOBVlz6GdrXUpk1Nw8U7zrfw/oG0
	 jHXkJ8ZiuanjnAeE9yXgxns9fFauAaoJ71QnaXhMCV3930sTPz4zJeEmuOzNwZp23lAMY
	 l1h3j5qPLLHyAOcevbxjDxQN44DouVB8sFenO+pySRVmGeVuL6amqbI0W1S5P5Z+KW+rk
	 qBFnB7lLvFfaMGyw5G05CVzlT50c5EpcvnX0m9FQo9uLiEWCOlO1ZyvVsNhrBAqKaCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR9+m7iT;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD85A606A31E
	for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 23:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD85A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR9+m7iT
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f03920c4a0so41172705ad.3
        for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 15:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649783; x=1796254583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlp9gEwrZkHdgv9tEPsrmJHObN6Zh/DO91hvElQOqsQ=;
        b=nR9+m7iTvWR/jIkbcf9Z+O6bsNRp72Axj2s0OUlmt9yupfWpUT6wQsOmbmA/yZJycV
         li74Whz8zjMczAWHicw6f0f6u4EbjNGeTVeld99kVxbyTQpe2UH7YhtyOh0QMNjRMOep
         HDFIn6AteS/5VpRAOObaLgMoB1UpY+xLEepGGj+nAnWWf7f47TiOtegrcKmxE4VtrxQH
         8OOQxOA/8pggzN/01WLKokpRZletP0m1gmJ/5enVlmreyR7RdJTTGCglXNYekVu8ZEY+
         6SHfiqaacf6otbN3RQX1njz4RCmmRFNHgVZyIWxQeQ/vINPUGxE0gI+gO4JZjNy/S/m7
         Nn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649783; x=1796254583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlp9gEwrZkHdgv9tEPsrmJHObN6Zh/DO91hvElQOqsQ=;
        b=aqQ4pbCSTDE+INj3QSXVUiFPv58Gb1pfjpjlaIghj9XQIpCwYe7xfVe+oU6gSccEUv
         yY/GB6D01xD3IeSQAkjqCRidR2dqJwD9mo/glyBh9LFGZEcEJLpXAdsLSaaQWBMa5r8R
         FCxfcdxE3aPfpfCH3ZDwDzebavUE3pMrNRSEx13BFgzpOhNAYG83ZMebGFJUDv8T0mSh
         NcMJTs+9RqWyE9o7b9dKn/SpmBNW1QpN+Lgve4OmMKq+PdVft2oF8nKn+ztW2FKO7JEl
         ZzMbuJIVs+n3IylruF1z8UnGhD/yalmM1tf06eA4F13Pfgnpzw68iyVL6FuIF6ARMgc4
         6JRQ==
X-Forwarded-Encrypted: i=1; AL+hErFEcf6b/Dc9foNPtBjpLWKeKby044V+tbNK6RXkWepm73heAuJCuTGtGEAOdkfMMBq03RtOJfZM9jY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vCtSvzZhaQ0AcWrwOe8Sy/AOzIN5uHF2gHWhbctEbbig7Hatq
	rezOdUra1OHyObDoz+v6RO6UtvQONeds9zsLW6yyejnRex6lRZWMaP07
X-Gm-Gg: AZFdTZf8JmiCiuTRKvAE5sqjQg+XNfO4rQyaUHGs1308IVHclVD/YToCYjud17hdMfU
	wY+ZFS6XEWV9YuMRUYsUjGN4ZLuUEiDwcgGHMYLmSWj/s7B8dEZ00bdcTXPXmuOET7vHa/21ITe
	E/hZowGYmcUcxY1cedRio7It716uuJS9JQIw6gP3ej+FltVlxd8XC0Nd70gNEb7NIhqevq9j5L0
	qfUK9PJlyWILzYU5HkzUVWSbHNxp6WE60y2TB7M3exFML8yAOqtHoITlKylHrZjeEk3PTZSe6hv
	4fR+P0TRV+kGl5DyHR42pMC8ucwiMSFwPd63c6umerilDEaHjnUATkLBy9CRaDn1TRnrHOJYuNF
	M7mgnpWnptA4SkhjlAVSzeJPcJe+mIcSuAa23a9v+1Oq8SbvkgrBYwmr6H0KpD0EIga9UFsQXlS
	tQ502/i4G8X8YEBeLb8eUV1P4fAsUNyHADToPMkOWx+EAwyAKNBTu/vOpWhE5MkihSed2CZt5/F
	+RmTi6CjsGONc7qT9MLPPgbNPOivSw7gQEu2tY0mwyLlXkGJ+fjW8nQR8ieW75Ox5u0YLNDMrec
	T/cqv4XKVAtlaswXobpp1QIhSiid
X-Received: by 2002:a17:90b:4ec4:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b41c8fcd3fmr17046919a91.10.1795649783039;
        Wed, 25 Nov 2026 15:36:23 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm19602862a91.9.2026.11.25.15.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:36:20 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C3C7E420A76D; Thu, 26 Nov 2026 06:36:17 +0700 (WIB)
Date: Thu, 26 Nov 2026 06:36:17 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Willy Tarreau <w@1wt.eu>
Cc: Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, gregkh@linuxfoundation.org,
	Johan Hovold <johan@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 05/14] docs: security-bugs: explain how to send a fix
 that can be applied
Message-ID: <awdw7OLaYvXcGPgj@archie.me>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-6-w@1wt.eu>
 <awdqgBF62SOKaU0Q@archie.me>
 <awdrPui-KI-SK_5N@1wt.eu>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Kjo8vLeaeTg8pZ2D"
Content-Disposition: inline
In-Reply-To: <awdrPui-KI-SK_5N@1wt.eu>

--Kjo8vLeaeTg8pZ2D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 12:11:58AM +0100, Willy Tarreau wrote:
> On Thu, Nov 26, 2026 at 06:08:54AM +0700, Bagas Sanjaya wrote:
> > On Sat, Nov 14, 2026 at 08:00:05PM +0100, Willy Tarreau wrote:
> > > +Most fixes sent along with reports cannot be applied as-is because t=
hey were
> > > +damaged by the mailer or lacking a commit message, forcing maintaine=
rs to ask
> > > +for a resend. A fix must be applicable using ``git am``, which is mo=
st easily
> > > +achieved by letting git produce and send the messages (see
> > > +Documentation/process/submitting-patches.rst).
> > > +
> > > +When the fix is meant to only be sent privately, the preferred metho=
d is to
> > > +send the report as a cover letter of a series, followed by the fix::
> >=20
> > Documentation/process/submitting-patches.rst guidelines also applies to
> > privately-sent fixes, no?
>=20
> Yes, why this question ?
>=20
> > > +
> > > +  $ git format-patch --cover-letter -1
> > > +  (edit 0000-cover-letter.patch and replace the subject and text wit=
h the
> > > +   report's subject and text)
> > replace the subject and message body placeholder as appropriate for the=
 report
>=20
> That's a wording detail / preference, not going to respin a series for th=
at!

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--Kjo8vLeaeTg8pZ2D
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCawdw7AAKCRD2uYlJVVFO
oy3qAQC4EPhrAXmftWcO+Qjt6IRMGr42yV+tdJa0t7L7OWolnwEAxVxjaT6iGwY7
vDe54HMMZEorAqWYR7Jt1hlwu+PDuA4=
=BL++
-----END PGP SIGNATURE-----

--Kjo8vLeaeTg8pZ2D--
