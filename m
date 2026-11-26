Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695820;
	b=jiyfy/e08KvGWnILKSbpb0AVP++1LNAF1PnVg02IKzUOXKj5v2WXW9EqMon5ae0NpVZV
	 HYDpIxa9/FkP9aoRkMfOC+58kjVqyLlI0F6HS1JYUfG0wLq5bWg8pT9mdOO2EXTsENeg6
	 jHxhiBRPOl9M7RK2EXtTWlnIp0WDhOxYHLc4plIoegTQyUKhUkSW8QLhzkp9lIthzG3Fl
	 Ol5ErlHkT1GSTeikqgiEjHvyxiywlJcoi/Fyv2lfqeTCY9oTVP1hJncpcqBeDlvL81D+a
	 qOBXgt3slKhfbym3yvXnQg7Y+5vlXlv5CupihXb+q/FNpBM3a4AidINOtzNwiKKLmqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695820;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=oODzakNKnvZltIkxgIO/FlDOcw5AnI/4fLTT+OV5iGU=;
	b=NmyPpdbnHxnnS6s0brUeu0bI3LMtoX0zrV71wkpx9EWxQVJAPiw1Ur6f3hXkMetlWbA/
	 gNskdsejM3FWAnpRO0QfuJOyvHmLYPtGXCIlW7pCbpe7Us0sBYBBXXFjXtfDfUkFKRHrX
	 efYJXZaImR/sPojTG2ZYWUdL1DvoY3CH57+kWJyCrtjhpKOzwOO6GzfwNtCVWMzDd/21g
	 6NAVHIrCZx4tFZCR1U2jvh4xRpCwNTbyhKcspdMvYFOMecT2UfcrKJW9MSJHcZxwBYS1y
	 7pl8OEWJZ22Rpdvlqp9XT6qTizIxLcPHXA20/sstAIOB4fflZQShdNVkNVdusyCUG/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jo4DJcpN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB3B606A688;
	Thu, 26 Nov 2026 12:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jo4DJcpN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DBC1F000D2;
	Thu, 26 Nov 2026 12:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795695820;
	bh=oODzakNKnvZltIkxgIO/FlDOcw5AnI/4fLTT+OV5iGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jo4DJcpNu7ms93LGeQB/jmcb6ypa1GTFn6H165clzJ+inasE17MGVM8KUqbm9kWrx
	 7wsnJXm8Q/ET6V5zfLPjSA7kUuGb658xL8gKhSkXumdVR5pjIq/1Rn+CAIUFFf0n3F
	 sAOn4cOoWJ10BMoo0eF/aF1UL2JKkuvkPSpTdKhNPvtiLUDkkEIvNejvjfHphxyc+W
	 a7gI2L+Se/27VF5goNtAQic6ijFybkTtk480M5QwLRkXegqF98J+/q9QaO44mHV/b4
	 kaBZ/8O5RYTzP0zs7H5L3DiQweF99tw1VDhIkbx9pUpru/KqVksriEjzptMnet1zE9
	 3jlHudB1v7IKg==
Date: Thu, 26 Nov 2026 12:23:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: Limit backtrace trimming to
 timestamps
Message-ID: <d4848afd-a23a-4119-ac09-1fe5e4681e3a@sirena.org.uk>
References: <20261126-backtrace-timestamps-v1-1-0a645b25e5ae@kernel.org>
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
	protocol="application/pgp-signature"; boundary="jk+xpKFa1zE2PFNA"
Content-Disposition: inline
In-Reply-To: <20261126-backtrace-timestamps-v1-1-0a645b25e5ae@kernel.org>
X-Cookie: Sank heaven for leetle curls.


--jk+xpKFa1zE2PFNA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 10:12:08AM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>

> AI tools tend to trim backtraces too far. Taint flags, module lists and
> module names disappear, which hides that an out-of-tree module was
> involved or that an in-kernel API was misused, especially a driver API
> that is not meant for general use.

> Ask authors to remove only the timestamps and drop the example, which
> shows a trace reduced to bare function names. Timestamps are the one
> part of a dump that adds only noise.

There's more than that, for example when you get something from a
syscall on arm64 you've got five frames before you get to the point
of even invoke_syscall(), and thirty odd registers printed two per line
the values of which are mostly of minimal interest for posterity.  They
can be very useful, which is why they're printed, but can really benefit
=66rom some editing a lot of the time.

--jk+xpKFa1zE2PFNA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIJMcACgkQJNaLcl1U
h9C9VQf/UGg6PAPeeGentaKeO/vgJ18RFWFoF+i/xqTG8lyDANwE/a3nVsBHgl1n
hWt2f1arjkqNMLQy7zMjDrXSep0B9kh5GD9TfL3pLtQFAH6QclM4cWhcCXlIKYz0
p+zO8Pg4YUVtNuyGFLNdwH+MkBnq2auC6We3kioRfEVyuV3/mIrwVWYgNxAuJ/DB
p30HbBaW0o1wpGEFZneAVY3CqHqK9LECD22fs2ZF4gsiumLsRChdpdKknK730HfB
BUbr2G5TvJIJxohnjOT6/VoseiyJ+7Y3r/Tn6+g1trN+v32Qr6M+fYlL3T31tcDf
Z/keJCMv5wGCGS4mI+K5G67o/l91EA==
=OmQo
-----END PGP SIGNATURE-----

--jk+xpKFa1zE2PFNA--
