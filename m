Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC2819E97F;
	Wed, 25 Feb 2026 00:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771980968; cv=none; b=mTXfO7GyExnGia6+MJmapXigpEfuiFytGWvEwjc27J3ShdYZ+icUuzZmvKjcHb2FdBvZM76fvK3HgZsVsD8QOZIgt35J4O7iplD/rNmrQlM0Ta6H6CpGCO1Eln8NjOVy1T30TRCZOHljjYcfEUthiOwv7v5gugKgl/i3BvvyW6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771980968; c=relaxed/simple;
	bh=Irq47y1482tHDdMkZeBf15ArWulyQhXMVT8h2mlT2LM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NywIrcEo7nKXYzKa7DKPHE8gjGHY987G3KoLwUSP2lUyRujtBY86CqS/V1YTm/E1431aftgFGh029ULR9I1eWzCy8FkF/2Vj4yFtVvVnn0ASewhX/2BtmH1TgR6q9s+2JBE2po4ZWZh0FsY5+mniL2QQFklil5KfI+cs0AgMie4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BV1I2Ga4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BV1I2Ga4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D40C116D0;
	Wed, 25 Feb 2026 00:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771980968;
	bh=Irq47y1482tHDdMkZeBf15ArWulyQhXMVT8h2mlT2LM=;
	h=Date:From:To:Cc:Subject:From;
	b=BV1I2Ga4ScmLDnN5CNQrOGHJTVlivcUAApBxkJLsOs4lRS+guQLSS8NuYnxLtPE/5
	 Ydt9oVJ9mL/aJqUIB52R0y7CoW72OpmG/RMlX0IKXr4ZHfKGGGmIHtvZbnNw9RTG/j
	 t0ObOXRLiVS1KruKPl1C9AM8yUZ7K/ImehSqkuoXu68m1mNUC60ry2Rv8g0wT3ncKE
	 rHgWRz+e8vM6svef9vlTyEQAHqO5SgHDZhlr8OMgY509+kYbNE3PoKjILAdt2RIOpU
	 TVGj62GSyM81I0imcFJ3HJSwsfaHhhfRWuEpSKTtvOMl1gjcm1VYdflrSEMePXaeJG
	 Np2uDBrmnyUDQ==
Date: Wed, 25 Feb 2026 01:56:02 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Jacob Keller <jacob.e.keller@intel.com>, Yeking@red54.com, 
	kuba@kernel.org, Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tech-board-discuss@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] Add short author date to Fixes tag
Message-ID: <aZ4_sBIy8rOUL59Q@devuan>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zjji7kj23uvdbgtr"
Content-Disposition: inline


--zjji7kj23uvdbgtr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Jacob Keller <jacob.e.keller@intel.com>, Yeking@red54.com, 
	kuba@kernel.org, Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tech-board-discuss@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] Add short author date to Fixes tag
Message-ID: <aZ4_sBIy8rOUL59Q@devuan>
MIME-Version: 1.0

Hi Steven, Greg,

[I'll reply to several sub-threads at once.]


[Message-ID: <20250113095101.4e0fff91@gandalf.local.home>]
On Mon, Jan 13, 2025 at 09:51:01AM -0500, Steven Rostedt wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> > $ git help fixes
> > 'fixes' is aliased to 'show --format=3D'Fixes: %h ("%s")' -s'
>
> Hmm, I've just been manually adding the Fixes tags ;-) That's because when
> I add a fixes tag, I also do a more in depth analysis to make sure the
> commit being tagged is really the cause of the problem. A lot of my fixes
> tags are due to very subtle bugs, and a lot of times its a combination of
> event that happened.

I also precede the generation of the fixes tag with an in-depth
analysis.  However, that doesn't conflict with using a git alias to
generate it, once I've reached a conclusion.  I use this alias to
generate them, and it's quite handy:
<https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/CONTRIBUT=
ING.d/git#n46>

>
> That said, maybe one day I'll use a script or alias in the future.


[Message-ID: <20250111120935.769ab9a3@gandalf.local.home>]
On Sat, Jan 11, 2025 at 6:08=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
> On Fri, 10 Jan 2025 16:21:35 -0800
> Jacob Keller <jacob.e.keller@intel.com> wrote:
>
> > I personally find the date helpful as it can help place a commit without
> > needing to take the extra time to do a lookup.
>
> I've never found dates to be meaningful. I'm always more concerned about
> when a commit was added to mainline. Thus the version where the commit was
> added is very important for me.

Indeed.  I agree with this, and it's a quite important difference.
The commit dates are strictly increasing, which means you can use the
date to perform a search of a commit, if there's a collision in the
hash (and possibly in the subject).

I documented this in the man-pages project, where I require the commit
date to appear in Fixes tags.
<https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/CONTRIBUT=
ING.d/patches/trailer#n16>

> This is why I keep a bare clone of Linus's
> tree and commonly do:
>
>  $ git describe --contains fd3040b9394c
> v5.19-rc1~159^2~154^2
>  $ git describe --contains a76053707dbf
> v5.15-rc1~157^2~376^2~4
>
> I can easily see that a76053707dbf was added in 5.15 and fd3040b9394c was
> added in 5.19. The amount of work needed to add dates to Fixes tags would
> greatly exceed the amount of added work someone would need to do to do the
> above operations if they wanted to know the order of commits.


[Message-ID: <2025011032-gargle-showing-7500@gregkh>]
Greg wrote (Fri, 10 Jan 2025 13:32:22 +0100):
> Please no, you will break all of our tooling and scripts that parse
> these types of fields.  The git commit id and commit header is all we
> need to properly determine this type of information, no need to add a
> date in here at all.
>=20
[...]
>=20
> So I don't think you need to add a date here.  Dates also really do not
> mean much with commits, what matters is what release a commit is in, not
> when it was originally made.  We have commits that take years to show up
> in a release, so if you only look at a date, you will be mistaken many
> times as it's not showing what came before what many times (i.e. we
> apply commits out-of-date-order all the time.)

As I said above, I agree that the commit date is the right choice.
Author dates can be out-of-date-order by years.  Commit dates are
necessarily in order, though.


[Message-ID: <20250110080331.04645768@gandalf.local.home>]
Steven wrote (Fri, 10 Jan 2025 08:03:31 -0500):
> How can it lead to misjudgment? If you have two or more hashes matching, =
do
> you really think they'll have the same subjects?

The possibility isn't zero.  Statistically, it's quite low.  However,
it's non-zero.

$ git log --format=3Dtformat:'%s' | sort | uniq -c | sort | tail
    248 Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/tip/tip
    263 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-2.6
    275 Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/pub/scm=
/linux/kernel/git/tip/tip
    293 Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/arm64/linux
    314 Merge branch 'akpm' (patches from Andrew)
    315 Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
    318 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel=
/git/jejb/scsi
    324 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kern=
el/git/dtor/input
    369 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
    670 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
$ git log --format=3Dtformat:'%s' | grep -v ^Merge | sort | uniq -c | sort =
| tail
grep: (standard input): binary file matches
     22 drm/amd/display: Clean up some inconsistent indenting
     25 Auto-update from upstream
     26 [ARM] Update mach-types
     26 pmdomain: Merge branch fixes into next
     30 s390: update defconfigs
     32 tools arch x86: Sync the msr-index.h copy with the kernel sources
     38 [SPARC64]: Update defconfig.
     52 mmc: Merge branch fixes into next
     59 drm/i915: Convert wait_for(I915_READ(reg)) to intel_wait_for_regist=
er()
     62 batman-adv: Start new development cycle

Subjects repeat every now and then, and the entropy in some subjects is
actually quite low.

If you include the commit date in a Fixes tag, then you preclude the
entire possibility of a commit reference clash, because you won't have
two patches committed in the same date with the same subject and same
hash (unless you *really* try)


[Message-ID: <2025011115-energize-edge-c9c7@gregkh>]
Greg wrote (Sat, 11 Jan 2025 06:48:53 +0100):
> And if it isn't long enough, tools like:
>	https://lore.kernel.org/r/20241226220555.3540872-1-sashal@kernel.org
> can help figure it out as well.

That uses hash+subject.  This may be not enough in some cases (see how
much subjects repeat, in the logs above).  And importantly, a fixes tag
may become ambiguous *after* it has been written, so you can't predict
much.

By having a commit date in the Fixes tag, you could even simplify the
script to just do a binary search in case of ambiguity.  Let's say I
want to find the following commit (arbitrarily taken from the first
Fixes tag I've found in my copy of linux.git):

	a2e459555c5f (2023-08-09; "shmem: stable directory offsets")

We could find it, with a trivial command line.  We only even need two
characters of the hash:

	$ git log --oneline --after=3D'2023-08-08' --before=3D'2023-08-10' \
	| grep ^a2;
	a2e459555c5f shmem: stable directory offsets

No need for a huge script to disambiguate.  This is even typo-resistant,
as one could eventually find something that is similar enough, if one
had such a field with a typo (in any of the three fields).  You'd be
able to search by the other two fields, and two fields should be
_usually_ enough for disambiguating, and the third one could corroborate
the typo.

So, what would you think of having the commit date in commit references
such as Fixes tags?


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--zjji7kj23uvdbgtr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmeSJwACgkQ64mZXMKQ
wqlA3Q//UakHpzU9F5l8R3Yuw3OVYF2UrgFiF74wADDC2zSyFo4jakz+f4J8UZ8t
Y1DhRZ+RnEvfVnspb7aJlh8MUpqt6MSfi1vM8dSRopRn2N9+4nuzl03ExQw8/b25
aWgDk+88+ZnQJpHgfiYOu9jPVvPDgasKB5EwiTNBccJdxB7iZLuUJTAj6tBiKjZc
USUdYswcCLC4zhrGDOMBjphLoiEu42/+RQ8P4I1poFYrr1pmLndxnqNaHPB0VOTf
VdsND4MA2uPeJTi6y/5T3rh/uOhDtBgvL1JWedj+koNfLBfIYeaCv/wOg6zyhxpO
g1FTc2dlzwoL5IvRHwNaxgBIu0KZ8SWMgWvH6jSFclPgV5LMITcsQ3XmqwmOHD3Q
l5In7aKkv7fdsj1rXDclMpe5QMUApbQSJZyXtyu+As8MHbBID3yAkIAD/2qG6CmD
ccIvVQEopFMEMqS29cjaifr91PYHR94l3H3XBbkP0nJ36BFHQqTMet0YE1IJXM1v
aA2NOp3V84ule9xeAIAeGaSkN/BQA8Kh7xweJi2KEEP/DVdYGBZqGkRVGRhJmyek
pStsJAal2fSaQ2DV56g8+jNYD5JHR3bvGuhXqMNUzriDwbNFqnuVMIlE3ODoq14f
/WDfRHX0mVAO0IhYHug139+RsRiDCGfL2NL56QfFaqdxCXyLAw4=
=xRHM
-----END PGP SIGNATURE-----

--zjji7kj23uvdbgtr--
