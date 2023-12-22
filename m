Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AF7612E
	for <workflows@vger.kernel.org>; Fri, 22 Dec 2023 18:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qHl39ZQy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39E9C433C7;
	Fri, 22 Dec 2023 18:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703269858;
	bh=MMbPm0lj1+TC0t1o82gQLn2RwdopxkvLDuzLRnt1WQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHl39ZQy3pzEzTQOExJZK6pCqisC05o9yHEKbgMw9/TvnflebQlWsb3zYZANp4lrQ
	 2FT1vk99Y5thzXYr+rTLoDRKsiFX4tbnbRiQsZ7kvqr9x5ZLAMQw5bhLutzFHtOVNA
	 yxfjK0a7VjCFNf0b0Efay2MmNyxKh1+a55RvbiMTQYmZ9FtdOjfxGdwc1EVxKdHCuY
	 CfThUTHOoPBUH88kJpETP07lAwEleuO7JgBbsuEkTSmZcpfiAtbGuCqYHHc8PAb3my
	 sXJkMw6k1i6ew2e3+Jzs7xx8ePMH6I2oeGV8cKTp25csHk5plHeb6NWbQHj8Bbja6q
	 7x95imPSOF0sQ==
Date: Fri, 22 Dec 2023 19:35:28 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>
Subject: Re: [PATCH] MAINTAINERS, docs/process/howto: Update man-pages'
 maintainer
Message-ID: <ZYXW8EWmNd1rLwnm@devuan>
References: <20231221112533.5259-4-alx@kernel.org>
 <CAMuHMdXO58KyZF2TuUaS-HrK6ry2ARHtDntbGT86YQTwieXs4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H9tCaWW+NI+jRF9v"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXO58KyZF2TuUaS-HrK6ry2ARHtDntbGT86YQTwieXs4Q@mail.gmail.com>


--H9tCaWW+NI+jRF9v
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 Dec 2023 19:35:28 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>
Subject: Re: [PATCH] MAINTAINERS, docs/process/howto: Update man-pages'
 maintainer

Hi Geert,

On Fri, Dec 22, 2023 at 07:21:42PM +0100, Geert Uytterhoeven wrote:
> Hi Alejandro,
>=20
> On Thu, Dec 21, 2023 at 12:27=E2=80=AFPM Alejandro Colomar <alx@kernel.or=
g> wrote:
> > Michael retired from maintaining the Linux man-pages project in 2021.
> > See commit 06e72cb19c74d3b1d661609c698ee26d7b6e4d7e ("CONTRIBUTING,
> > README, lsm: Remove mtk as maintainer") in the Linux man-pages
> > repository.
> >
> > Reported-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xy=
z>
> > Signed-off-by: Alejandro Colomar <alx@kernel.org>
>=20
> Thanks for your patch!
>=20
> > ---
> >  Documentation/process/howto.rst | 3 +--
> >  MAINTAINERS                     | 2 +-
> >  2 files changed, 2 insertions(+), 3 deletions(-)
>=20
> I think Michael deserves an entry in CREDITS.

Sure!  Will do.

>=20
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12745,7 +12745,7 @@ F:      drivers/mailbox/arm_mhuv2.c
> >  F:     include/linux/mailbox/arm_mhuv2_message.h
> >
> >  MAN-PAGES: MANUAL PAGES FOR LINUX -- Sections 2, 3, 4, 5, and 7
> > -M:     Michael Kerrisk <mtk.manpages@gmail.com>
> > +M:     Alejandro Colomar <alx@kernel.org>
> >  L:     linux-man@vger.kernel.org
> >  S:     Maintained
> >  W:     http://www.kernel.org/doc/man-pages
>=20
> This page links to https://www.kernel.org/doc/man-pages/maintaining.html,
> which needs an update, too.

Yeah, I have that one pending from long ago.  I want to move it to some
text file in the repository: <./MAINTAINING>.  But that'll take some
time.

>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert

Have a lovely day,
Alex

--=20
<https://www.alejandro-colomar.es/>

--H9tCaWW+NI+jRF9v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmWF1vAACgkQnowa+77/
2zJKCA/+OVDrKJJreTxC0W7oXb0luGE8UwdoEVV7cEmod2Jwbx7cwn2PtKHxDaRh
RhUHiHOZjsz6Q8sqZTxqjMYxg1U+xv//lTAbqQu95cWy+o1hJJNaL9jWwzgHw/O3
kk7Tt/NFUBGRUiu6YZ8Wi7aIZ0SV5Sa4le/WMLg2sZgsJWJXIJi8afUwL2kTWXIc
t8WdQT6yKoPgco4BdXuvcJi3C3F0pGuFCmZqjb43K9SdWstZ9j/3V3IqvT1UuvsI
8N25l+SvqVxDJzex616zmJPvyOpTPCaf3Bak67SvlTogBPrBFUFkA2t5lnK3OjI4
c0ZhlDSYTSUvGt+uhb7MG6BtQblWv85/mlb1qPq0E26Gojri0A4F4Ey9iH0hcCUS
k4T68MwMWDTU7OxbtA62B202FJ3Mr2XlYnQs1cbjmcrLBx9Ab0B0zQHhAaRcwkAx
ahMBw5J7jpxH4DKRQPrTSjE/+7BrGt+7hql4LtYE8UFWMmDAHdW1k/YwodZsbU5u
iw48MNPoxtZDLVxT209N/Ow87ISJnJzeTf74HWYYKTyG14tGNV8ofp6jrXVhhgsA
vlYSb729gkM5fldqJ/GJ94di92PBxBwFd7QKe/IlD+xrPDHPyyhKehzSqPDE7ZnF
PervKLvHaBMTpvppipbZhHtgtESwrtqDir97R03noFQdqjpZ0pI=
=uSn5
-----END PGP SIGNATURE-----

--H9tCaWW+NI+jRF9v--
