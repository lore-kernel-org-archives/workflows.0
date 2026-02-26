Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1870B1EB5B;
	Thu, 26 Feb 2026 00:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772065233; cv=none; b=JicTvkvj2sP41WKRMx95X6pYAomwowcB0BSmviT246xjfgZHI8s5dy8R0+isFVot7R9RQIMuOW0OxUWrs6ODme9H0HMTkLsX61CPkZwgsYlxLuL1xxe4xO5/nRCFUo7KlQv5U9GbyBjnCkZp8ImTVWVhO/wT0dFbt6/OU7qC8cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772065233; c=relaxed/simple;
	bh=vQ9100hika6XOwYaftLaiYtlieJs6dQvC4bVW3nQWVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pv/l6XLCYBGPtQ8uMV/4nbqoIGLdNb62UeGCVU4y/9kIpm5ZPvOq0cYbw0A+SzMWn0Qk85O6sC5jMbAgxUmh5VRyq3Du6S0I9z9ZDW431M4swg2KeDUtU9LyKV2Qpyzsf6rfql5LelkFvICYCB4hlMe5Q5tC/ePL1EDVYSYCPFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmJqUl2A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmJqUl2A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16F2C116D0;
	Thu, 26 Feb 2026 00:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772065232;
	bh=vQ9100hika6XOwYaftLaiYtlieJs6dQvC4bVW3nQWVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmJqUl2ASn6bqmwLkn5vT/0ezdEM6YnqFKJMhujeX/RXesODN1ty+Uyx/4rHlchUu
	 F5Z2na9dABbEze/R+1f53bkshkGjLQMZMWoRLq/tE64uV2S9jNDJPp85BOlSegGhZ6
	 ILCZpJy8e+B0PNm8/UiQAJpvUeAcJrAR2qL4GZ9Jsm1PjvS+KHkiTHEjnxAUPgKWFp
	 R41HCj8/penECWeYWcftGUhmIOQjsV3wszAGUyftzhuxJQVlSrYSIrHfu1GusSe1dm
	 jtKE1qeErDwm1eWvIvt2bsl4OUBS/Hd993wXVb19xLZmBJmGnjFOegHEfctd/rTtt0
	 g991JFu0HRlew==
Date: Thu, 26 Feb 2026 01:20:26 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>, 
	Sasha Levin <sashal@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Jacob Keller <jacob.e.keller@intel.com>, Yeking@red54.com, kuba@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tech-board-discuss@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] Add short author date to Fixes tag
Message-ID: <aZ-NVcaidg58qXEu@devuan>
References: <aZ4_sBIy8rOUL59Q@devuan>
 <2026022531-tightness-rare-6a14@gregkh>
 <aZ87Z24f9HZsofGl@devuan>
 <2026022539-commotion-huskiness-8736@gregkh>
 <aZ9p2RMrJL1mQ10w@devuan>
 <2026022547-confirm-upturned-a736@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zubq56rjnllg3g3p"
Content-Disposition: inline
In-Reply-To: <2026022547-confirm-upturned-a736@gregkh>


--zubq56rjnllg3g3p
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>, 
	Sasha Levin <sashal@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Jacob Keller <jacob.e.keller@intel.com>, Yeking@red54.com, kuba@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tech-board-discuss@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] Add short author date to Fixes tag
Message-ID: <aZ-NVcaidg58qXEu@devuan>
References: <aZ4_sBIy8rOUL59Q@devuan>
 <2026022531-tightness-rare-6a14@gregkh>
 <aZ87Z24f9HZsofGl@devuan>
 <2026022539-commotion-huskiness-8736@gregkh>
 <aZ9p2RMrJL1mQ10w@devuan>
 <2026022547-confirm-upturned-a736@gregkh>
MIME-Version: 1.0
In-Reply-To: <2026022547-confirm-upturned-a736@gregkh>

Hi Greg,

On 2026-02-25T15:46:28-0800, Greg Kroah-Hartman wrote:
[...]
> > Secondarily, it helps with the ID, in case it becomes ambiguous.  But
> > I started using it for the human part of it.
>=20
> Our ids are not ambiguous.  Our "problem" is people putting git ids in
> the logs that are not valid git ids.  Just happened again today as we
> are "human".  Putting the date in there would not help with that very
> real problem we have today at all.

It would help locate the commit it refers to.  If you have a commit
date, you know that if it was rebased, the date can only increase.  So,
instead of having to search exclusively by subject, you can limit your
search to dates no older than the date from the Fixes tag.

Let's say we want to locate

	bogus-hash (2025-11-21; "bug: Add BUG_FORMAT_ARGS infrastructure")

We can first of all check if maybe there's a typo in the hash (maybe
the first character is missing, due to a cut/paste accident).

	$ git log --oneline --before 2025-11-22 --after 2025-11-20 \
	| grep BUG_FORMAT_ARGS;
	5c47b7f3d1a9 bug: Add BUG_FORMAT_ARGS infrastructure

But even if the date was wrong.  Let's say someone used a reference to
a commit that got rebased a year later, as the case you stated.

	old-hash (2025-01-21; "bug: Add BUG_FORMAT_ARGS infrastructure")

We can search by date something that looks similar.  We know the date
can't be older than that, if it wasrebased.

	$ git log --oneline --after 2025-11-20 | grep infrastructure
	cb2dc6d2869a can: Kconfig: select CAN driver infrastructure by default
	93d7a7ed0734 netfilter: flowtable: move path discovery infrastructure to i=
ts own file
	23343b6b09ac sched/mmcid: Introduce per task/CPU ownership infrastructure
	775465fd26a3 lib/test_hmm: add zone device private THP test infrastructure
	99e4e1028337 RDMA/bng_re: Add basic debugfs infrastructure
	4f830cd8d7fe RDMA/bng_re: Add infrastructure for enabling Firmware channel
	5c47b7f3d1a9 bug: Add BUG_FORMAT_ARGS infrastructure
	d292dbb5640c bug: Add BUG_FORMAT infrastructure

So, we'd start looking at the tail of that list (assuming the rebase was
close to the commit date), and depart from that as necessary.  In this
case, we find it as the second commit.

On the other hand, if you have no date, you must look at the entire
git-log(1), which is a lot more work.

> thanks,
>=20
> greg k-h

Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--zubq56rjnllg3g3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmfkb4ACgkQ64mZXMKQ
wqkHcw//b0sPsO3GJVOzCienU9HT8eFzJL6b2B0uwuium6S0m5HcmtXYdQ2YIDIv
b5c6ykDVOcbSzWN9aFraxFLu0oUKxr70jFb1W0YmMbJbXF0frzrmTAkjyr+kaFXh
WBW+AUcPYbiywxBiT37p8bNut2giQGcx2N0rwwiFMqP+NTNAsxww/0rJDWVJVQim
hOhTFGnHxHQJvgGJQOpnfFmB0HPRiYGR/Hze2n10fjjCEUh0k4fkzznhTeY1tsgN
kTZVePf7ZERMAXeHE2WKMXqMgFEdxBNRTkYtmZxUHv7FcJtp9OIs2aDhOwwe+vAh
NkXNuuNZzETsakhW5tswt5HPbt9DescVN7uU1VLAUQw268dRuuxeRBUPb0AJERYr
SNGUH5QnWcXOE247iSXCdkBcyEO72txtb3iFmEK1ydgZFhaKGWH0eKP2GE7GGKAV
O669xQsf6GXHJqoUlO3CH3sHjnKpMU9G0TdKRNrV3KYdZW5qG3v2ZK/xle8V6gjy
woZDITVtsBZ7BGKWlGXlFJ720OnfnZ5dV54RPjPdCAE2PPovxznITko9Q00ih9b+
K2a5eDJJLFqmFSXWL0WYfi2eyJCtmUkMKxIo2CRDcnZ/Gza8JuHoSwry4kh8D+5L
9jQe7Pv5xuAVTWOITDVdmbK+5K5yatbB9pApo0nNi7OxhmltNrg=
=qO8H
-----END PGP SIGNATURE-----

--zubq56rjnllg3g3p--
