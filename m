Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9935923EAA5;
	Wed, 25 Feb 2026 00:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771981034; cv=none; b=ClYpRXtwotXAC7xkJkdodMs5jj+/42aDSNjORinH3WKTb+QEbVPCgy+XHIljHu3/73YWs4c2RseAkP4wnBwMShZWcd9AtW0wFlTK9GhkyB3h+XoFsoT9hc2sfRcXhUcPUvzE/PtEY6TEOk7hw6srI3AYqrOWFB0flpt+ogv5nP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771981034; c=relaxed/simple;
	bh=g2WPkjZdelwWAPvdii6l/FmuqHYAH21n3dSr7zNle/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqqDoUSHDlkRppPQ1VsszSPPVvYdRR2tt01GMK1kCCFOh7otXZLVQ29fL6HdopD79lfnuVV5+cqMmey/V7BRfa3KpsDhsCXrZJBQ7/eDegrv5BHuybu6geAyVYKbHs1LO/LCFzFaldc5C126boBC3D7b4TDCLaoPi5+a9aZqrYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMgvlxGF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMgvlxGF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E361C116D0;
	Wed, 25 Feb 2026 00:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771981034;
	bh=g2WPkjZdelwWAPvdii6l/FmuqHYAH21n3dSr7zNle/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BMgvlxGFy3plHm0xMEBJh3I/vJ1MS4AhSg/1D375bOd5tjzCWLOy1fQDKiWqP1wjD
	 Grw6K0fpcunq+qVJCH7UYbaiNdrsj6mrYStNJWT0gOd2B/94zxHU6PYcFSzUjt7Bye
	 PqcjIil7q2QtO7XzGZ3lxozpVRZJkQM6XMZjNd9+eLnhg9PexcBC6B9gpyhdlytiD5
	 VouUjfUQIn08J46FitGKGCftCUJ75fxDHfzdRvrWS9oJDpuxCd2rU83PuLiLs1vsH0
	 2MRiDofsgX3fXA+/YCIkthNMkeh9elE3x75t5AO/9Nx4RDUcuZMuercS4iZbWeP8ej
	 TGZ11Q9Yuilwg==
Date: Wed, 25 Feb 2026 01:57:08 +0100
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
Message-ID: <aZ5Ir0eHPMjK7xyv@devuan>
References: <aZ4_sBIy8rOUL59Q@devuan>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xmkszrd4vfwcbleq"
Content-Disposition: inline
In-Reply-To: <aZ4_sBIy8rOUL59Q@devuan>


--xmkszrd4vfwcbleq
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
Message-ID: <aZ5Ir0eHPMjK7xyv@devuan>
References: <aZ4_sBIy8rOUL59Q@devuan>
MIME-Version: 1.0
In-Reply-To: <aZ4_sBIy8rOUL59Q@devuan>

D'oh!  I forgot to add the In-Reply-To tag.

I meant to reply to
<https://lore.kernel.org/all/52541f79-ba1c-49c9-a576-45c3472d1c79@intel.com=
/T/#mf183db5f382b4a39cf52a4a1d2ca8f96697c312e>


On 2026-02-25T01:56:08+0100, Alejandro Colomar wrote:
> Hi Steven, Greg,
>=20
> [I'll reply to several sub-threads at once.]
>=20
>=20
> [Message-ID: <20250113095101.4e0fff91@gandalf.local.home>]
> On Mon, Jan 13, 2025 at 09:51:01AM -0500, Steven Rostedt wrote:
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>=20
> > > $ git help fixes
> > > 'fixes' is aliased to 'show --format=3D'Fixes: %h ("%s")' -s'
> >
> > Hmm, I've just been manually adding the Fixes tags ;-) That's because w=
hen
> > I add a fixes tag, I also do a more in depth analysis to make sure the
> > commit being tagged is really the cause of the problem. A lot of my fix=
es
> > tags are due to very subtle bugs, and a lot of times its a combination =
of
> > event that happened.
>=20
> I also precede the generation of the fixes tag with an in-depth
> analysis.  However, that doesn't conflict with using a git alias to
> generate it, once I've reached a conclusion.  I use this alias to
> generate them, and it's quite handy:
> <https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/CONTRIB=
UTING.d/git#n46>
>=20
> >
> > That said, maybe one day I'll use a script or alias in the future.
>=20
>=20
> [Message-ID: <20250111120935.769ab9a3@gandalf.local.home>]
> On Sat, Jan 11, 2025 at 6:08=E2=80=AFPM Steven Rostedt <rostedt@goodmis.o=
rg> wrote:
> > On Fri, 10 Jan 2025 16:21:35 -0800
> > Jacob Keller <jacob.e.keller@intel.com> wrote:
> >
> > > I personally find the date helpful as it can help place a commit with=
out
> > > needing to take the extra time to do a lookup.
> >
> > I've never found dates to be meaningful. I'm always more concerned about
> > when a commit was added to mainline. Thus the version where the commit =
was
> > added is very important for me.
>=20
> Indeed.  I agree with this, and it's a quite important difference.
> The commit dates are strictly increasing, which means you can use the
> date to perform a search of a commit, if there's a collision in the
> hash (and possibly in the subject).
>=20
> I documented this in the man-pages project, where I require the commit
> date to appear in Fixes tags.
> <https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/CONTRIB=
UTING.d/patches/trailer#n16>
>=20
> > This is why I keep a bare clone of Linus's
> > tree and commonly do:
> >
> >  $ git describe --contains fd3040b9394c
> > v5.19-rc1~159^2~154^2
> >  $ git describe --contains a76053707dbf
> > v5.15-rc1~157^2~376^2~4
> >
> > I can easily see that a76053707dbf was added in 5.15 and fd3040b9394c w=
as
> > added in 5.19. The amount of work needed to add dates to Fixes tags wou=
ld
> > greatly exceed the amount of added work someone would need to do to do =
the
> > above operations if they wanted to know the order of commits.
>=20
>=20
> [Message-ID: <2025011032-gargle-showing-7500@gregkh>]
> Greg wrote (Fri, 10 Jan 2025 13:32:22 +0100):
> > Please no, you will break all of our tooling and scripts that parse
> > these types of fields.  The git commit id and commit header is all we
> > need to properly determine this type of information, no need to add a
> > date in here at all.
> >=20
> [...]
> >=20
> > So I don't think you need to add a date here.  Dates also really do not
> > mean much with commits, what matters is what release a commit is in, not
> > when it was originally made.  We have commits that take years to show up
> > in a release, so if you only look at a date, you will be mistaken many
> > times as it's not showing what came before what many times (i.e. we
> > apply commits out-of-date-order all the time.)
>=20
> As I said above, I agree that the commit date is the right choice.
> Author dates can be out-of-date-order by years.  Commit dates are
> necessarily in order, though.
>=20
>=20
> [Message-ID: <20250110080331.04645768@gandalf.local.home>]
> Steven wrote (Fri, 10 Jan 2025 08:03:31 -0500):
> > How can it lead to misjudgment? If you have two or more hashes matching=
, do
> > you really think they'll have the same subjects?
>=20
> The possibility isn't zero.  Statistically, it's quite low.  However,
> it's non-zero.
>=20
> $ git log --format=3Dtformat:'%s' | sort | uniq -c | sort | tail
>     248 Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/=
scm/linux/kernel/git/tip/tip
>     263 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-2.6
>     275 Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/tip/tip
>     293 Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/arm64/linux
>     314 Merge branch 'akpm' (patches from Andrew)
>     315 Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
>     318 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kern=
el/git/jejb/scsi
>     324 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/ke=
rnel/git/dtor/input
>     369 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
>     670 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
> $ git log --format=3Dtformat:'%s' | grep -v ^Merge | sort | uniq -c | sor=
t | tail
> grep: (standard input): binary file matches
>      22 drm/amd/display: Clean up some inconsistent indenting
>      25 Auto-update from upstream
>      26 [ARM] Update mach-types
>      26 pmdomain: Merge branch fixes into next
>      30 s390: update defconfigs
>      32 tools arch x86: Sync the msr-index.h copy with the kernel sources
>      38 [SPARC64]: Update defconfig.
>      52 mmc: Merge branch fixes into next
>      59 drm/i915: Convert wait_for(I915_READ(reg)) to intel_wait_for_regi=
ster()
>      62 batman-adv: Start new development cycle
>=20
> Subjects repeat every now and then, and the entropy in some subjects is
> actually quite low.
>=20
> If you include the commit date in a Fixes tag, then you preclude the
> entire possibility of a commit reference clash, because you won't have
> two patches committed in the same date with the same subject and same
> hash (unless you *really* try)
>=20
>=20
> [Message-ID: <2025011115-energize-edge-c9c7@gregkh>]
> Greg wrote (Sat, 11 Jan 2025 06:48:53 +0100):
> > And if it isn't long enough, tools like:
> >	https://lore.kernel.org/r/20241226220555.3540872-1-sashal@kernel.org
> > can help figure it out as well.
>=20
> That uses hash+subject.  This may be not enough in some cases (see how
> much subjects repeat, in the logs above).  And importantly, a fixes tag
> may become ambiguous *after* it has been written, so you can't predict
> much.
>=20
> By having a commit date in the Fixes tag, you could even simplify the
> script to just do a binary search in case of ambiguity.  Let's say I
> want to find the following commit (arbitrarily taken from the first
> Fixes tag I've found in my copy of linux.git):
>=20
> 	a2e459555c5f (2023-08-09; "shmem: stable directory offsets")
>=20
> We could find it, with a trivial command line.  We only even need two
> characters of the hash:
>=20
> 	$ git log --oneline --after=3D'2023-08-08' --before=3D'2023-08-10' \
> 	| grep ^a2;
> 	a2e459555c5f shmem: stable directory offsets
>=20
> No need for a huge script to disambiguate.  This is even typo-resistant,
> as one could eventually find something that is similar enough, if one
> had such a field with a typo (in any of the three fields).  You'd be
> able to search by the other two fields, and two fields should be
> _usually_ enough for disambiguating, and the third one could corroborate
> the typo.
>=20
> So, what would you think of having the commit date in commit references
> such as Fixes tags?
>=20
>=20
> Have a lovely night!
> Alex
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--xmkszrd4vfwcbleq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmeSOMACgkQ64mZXMKQ
wqnIcQ//cQXTp1zq9+8k4pViOjXwd8GGsZ9MFbi5v4ij5mH6KDUdYgavEM/K6DCw
0wMrHcnojawMSo71wOYoHDPsZj/UbJF5OhT4scdjeDKeQiNzs2AddWvsQtL4IMmW
pfW8+ofVLLY2g97rDyjoi/dT8N8GwAREQposAPGSM+rdoyVjInchihEaOMxN8mx/
v/vT27ttupoDYk6icvLhIM93BlaqwuSAwkNqnrtP1A/cJzNpCu2jsUHXW+/wU3tP
HiJHL7/YgXBMC4gGZX332m+7rMElzsr/G2AwCI46pt+cIUuqlS9PxXK7f/I9ZO/J
67LcGSbWKDFnwZZ6PKSpnwBgS5NjE+fgr5WfBMWBOXSu8s1GAqcSCS5xc53WCI9n
LAEIEUaasyT2TtCip2xJFN+lcxEHgvfSKK3bhR8A6YBv0Tpj6zXEv2S97WRPMlSo
QwX3FoKsvZpmCp92YuIdBNyEyzQQpuXC6bWvLiXeNKbnFp3lwMNNnwG1QR0MTDLl
R1cqgH70BLI+ndPN9bpwvZVhrpqj7GIr4zP/s2y4207aDS//vT5IAU0GIDLPE7JB
YuerhODHA88qhV8rkHJfgDP9ZOfAW65LcDwtU1iZtq9IyPahrFdDvjLSnLvWr/r3
+53RmNbn2PdjTC60kk/HmPtBvOTkDjGfZcO3wpzK03SHlzZvOpE=
=fMjW
-----END PGP SIGNATURE-----

--xmkszrd4vfwcbleq--
