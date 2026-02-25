Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7EE1CBEB9;
	Wed, 25 Feb 2026 18:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772043632; cv=none; b=kbhUnUj35bGcRYkoJFYosRNyiQVvx1hBn2YOd2RMH61vOtgukgBq38+MF4/lXLEJ99yg6x0iV7iOsBiZxFginJPgddxZBDqFiTWSNAkM9cQEuMW1xwOiVjmB2l0EcuxLbprds9XGBeJCO1lNwMHeQnEXMDAKS707u0D39luAib0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772043632; c=relaxed/simple;
	bh=IO1qWMkICTElEo3PJKb+9CFkPd/Oszwv0RcLN1OxRhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYOiDjJzPa1N7a8lkjNch3dosT6zbIRSOkcVYcKCY4ITwuPfKx5lQN5gFtMU5K2bg1CNtCLKfwLtFGLB/QBZDUIhDrt7t3k1y7B9sEf3bY8YZSP2l/4CSooQdg5opcu2aPeJm46TOGth24hIxzBLgQlRCAP1f+gf0Y83fYEcZA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1qLrbLq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1qLrbLq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AEB4C116D0;
	Wed, 25 Feb 2026 18:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772043631;
	bh=IO1qWMkICTElEo3PJKb+9CFkPd/Oszwv0RcLN1OxRhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1qLrbLqy3mHY12uhNXopSgwWVQBWFTdK7G0OSFm/0wed9hQVCiMxmV92mNBAtFhQ
	 6seK3p8Tn4905J5wzthS2r74sXLL2mDN8mQ7XByh+JautnhurvQN84BEmcFB91jUwI
	 0jbf5o6SwrcE17XzuXne6h1FyG+3Q9VljCG2BpKZRTXWTUlVMTklovCNunUoYMe6FI
	 2ik7e9QhXZ+VyQ51IZ5SHlBIG5k/d5DpL4iglD/SRKhsq+yW/SPs7tyVUK5PlWah7s
	 cXRW3MQXSflof1/NMgk+P8ni6Q/5/9CY1CVS+s8Fy29Rz3eES2OvjYsUi8C9PD3R/y
	 JfeiTB2rUv3ww==
Date: Wed, 25 Feb 2026 19:20:25 +0100
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
Message-ID: <aZ87Z24f9HZsofGl@devuan>
References: <aZ4_sBIy8rOUL59Q@devuan>
 <2026022531-tightness-rare-6a14@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="42oqugo2ge7dyzsg"
Content-Disposition: inline
In-Reply-To: <2026022531-tightness-rare-6a14@gregkh>


--42oqugo2ge7dyzsg
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
Message-ID: <aZ87Z24f9HZsofGl@devuan>
References: <aZ4_sBIy8rOUL59Q@devuan>
 <2026022531-tightness-rare-6a14@gregkh>
MIME-Version: 1.0
In-Reply-To: <2026022531-tightness-rare-6a14@gregkh>

Hi Greg,

On 2026-02-25T10:00:06-0800, Greg Kroah-Hartman wrote:
> On Wed, Feb 25, 2026 at 01:56:02AM +0100, Alejandro Colomar wrote:
> > [Message-ID: <2025011032-gargle-showing-7500@gregkh>]
> > Greg wrote (Fri, 10 Jan 2025 13:32:22 +0100):
> > > Please no, you will break all of our tooling and scripts that parse
> > > these types of fields.  The git commit id and commit header is all we
> > > need to properly determine this type of information, no need to add a
> > > date in here at all.
> > >=20
> > [...]
> > >=20
> > > So I don't think you need to add a date here.  Dates also really do n=
ot
> > > mean much with commits, what matters is what release a commit is in, =
not
> > > when it was originally made.  We have commits that take years to show=
 up
> > > in a release, so if you only look at a date, you will be mistaken many
> > > times as it's not showing what came before what many times (i.e. we
> > > apply commits out-of-date-order all the time.)
> >=20
> > As I said above, I agree that the commit date is the right choice.
> > Author dates can be out-of-date-order by years.  Commit dates are
> > necessarily in order, though.
>=20
> Commit date also doesn't matter.  If I commit a fix to one of my
> branches today, but Linus pulls it in in 2 years from now, what would
> that date really show to anyone?

I think this is a bit confused.

If you commit a fix for a commit that is in Linus's tree, your Fixes tag
will refer to the mainline commit, and the Fixes tag will remain valid
if the fix is pulled by Linus in the future, because it will continue to
refer to the same commit with the same hash and date.

The case where it would matter is if you commit a fix for a commit that
is only in your stable branch.  However, since the stable branches are
not real branches, but actually a set of patches, I expect you would
just drop the faulty patch, right?

I expect any Fixes tag refers to commits in Linus's tree, right?
Otherwise, they are dangling references, except to those who know where
to find the commit.  If all Fixes tags refer to commits in Linus's tree,
then all Fixes tags are stable.

The commit date is tied to a commit and its hash, and the date will
remain valid as much as the hash itself.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--42oqugo2ge7dyzsg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmfPWMACgkQ64mZXMKQ
wqk+7A/9Eyypd0+DzDs+SsD17FfnEQ701lSyqC+upHIOFJcb/rCsZr5DQJxx9L8+
swFWafq+x2iAyA8xIYWJYgE7FOhvy10qq1StUMkk+rhAsfAq/wresuqyvcxvZiE1
iK/+Ib1NyIg1CzsK9q49hytO7NARbPLR3CGoCr2DyCxJ8vGRfkeY9rvQkGhx2Pq9
TVf/Ytqli0MlAWgsF/nnbnyuCkM2PSlejjkTHK2F+N6JfanfKkfInFH9yOe/BZGv
olQGj9wCFmNDnzYhfBX6YETB2eZ2sEvDiQORPF2p+5FXCvf3FEWsNRtdjyeEOa3d
I4AaIHxO786SPf0ugb/rVqPHa2ZCfzYzeXF9mwwgXYYRfExXBUTeOZkTuvMW/VRJ
AW8D51cbB4F4tw9aOgYH5xfKYdxT0TMUzHJIhb0KMVXxCc2T4hPdP5v5iEVqhR3B
QKhhfevBoBtuolKxvlwtQ+oZ8/u1yRgoTVgfEjsP+DIpH9pFYHGo7p2JjQTEZw0J
DpIqiR6/p48OhU3jBiCQlIjjWFEzh0qyFZCHHrh+DJmKK0MixfZMhgb8V/Ht5xeI
RnFtdgSjISR7sqpCFqPD7vg8XWmmSQYxoKLzYoWU1MNyj2HX4mPQhNT0d0YAzOVy
SwqkE1iMlTugdsD/9F3f/W7zIi/OkOqLwaEhZd82PDKpevOvTLU=
=ZMa3
-----END PGP SIGNATURE-----

--42oqugo2ge7dyzsg--
