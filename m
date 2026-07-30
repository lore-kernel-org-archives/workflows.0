Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24893793A9;
	Thu, 30 Jul 2026 14:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423136; cv=none; b=NTVs+VGp0337OfCFi48YGFdTqCLR7nEVlkMzzF5NyTyK3rBVXBPSQLBgOTMPdRxKv1lfdvkXsXHId4e1esMZ9TU9pmcprwzdadeNgO/U7td5etXVaMB7ZeIk1CeHXx2remPyx/w1qDBk6MDm8/kCaRPUH0NyzkncMQL5vOXsH30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423136; c=relaxed/simple;
	bh=09H7qVAjqco1yWKS7tSSyS36x/TyJRNJoar0RmF7piY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AY1ryjWJO4VJlce+UMvZsKLV0hdQHAnmmlK0w7j2mLadu6cE1jfsSBQSmNEiBgSBRv5kKIB1KW5I+EdzSUlLcEy5JAKmvNPjq9ZfIaLWrzKStzKMExvSj4pmgkPG3xTKno4cArLm6kl7SSVKo7lA34H7/+pGR9r2R/4+/UaAo4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egBQrzGZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egBQrzGZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738751F00A3D;
	Thu, 30 Jul 2026 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785423134;
	bh=09H7qVAjqco1yWKS7tSSyS36x/TyJRNJoar0RmF7piY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=egBQrzGZhOQC5iC9LBMT9WELk1TGJHYRLpTcZ1T2MN2NWYnc1roBUxW6skGyIU3wk
	 faEbB14W8UhPKdKjcNJfo6vQ5LaKV7o+jXcyF7COedgGPcSB30LokI8q0xgtx6RHNC
	 hQUOxVOf+1IGqsdw9w8WUGl/biy3UjJhDEtAK2JXQez/kSNnbiIlh1ZmB6R+cij782
	 hspIEurkWPdZBlTMbzr67LZlCze1DfoNz0xc/RlYyjbd4lvNvEnTY3CkdKW410Ehfo
	 Zb8bPZ6PdKXwV9J4ssPmhnJG2jzGtypUOUrDuBd+NMn39YGmek7OYoG6YvOrYEeN+5
	 HEmfQGFE0++Fg==
Date: Thu, 30 Jul 2026 07:52:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Cihan Karadag <cihan.cihan@gmail.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] checkpatch: warn about possible missing gitignore
 coverage in selftests
Message-ID: <20260730075213.09bb0f87@kernel.org>
In-Reply-To: <CA+JfJhbda3VbLcAO9KEPgJVH-3WwVvJjdgh0MQUH=Fhnsp28iw@mail.gmail.com>
References: <20260728052442.626076-1-cihan.cihan@gmail.com>
	<20260728073143.0e665e36@kernel.org>
	<CA+JfJhbda3VbLcAO9KEPgJVH-3WwVvJjdgh0MQUH=Fhnsp28iw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 29 Jul 2026 02:01:48 -0600 Cihan Karadag wrote:
> On Tue, Jul 28, 2026 at 8:31=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> =
wrote:
> > On Mon, 27 Jul 2026 23:24:41 -0600 Cihan Karadag wrote: =20
> > > Per selftests documentation [1], every generated test binary must be
> > > added to gitignore to prevent leaving untracked files in the kernel
> > > tree.
> > >
> > > This is an easy mistake to make when adding a new test. In fact, a
> > > search of selftests history turns up dozens of standalone follow-up
> > > patches with titles like "add missing gitignore for <binary>", each
> > > needed only because the original patch adding a new test
> > > didn't also update gitignore.
> > >
> > > Add a SELFTESTS_GITIGNORE check that warns about gitignore coverage
> > > whenever a patch adds a new file under tools/testing/selftests/, the
> > > same way FILE_PATH_CHANGES warns about MAINTAINERS on any added,
> > > moved, or deleted file. =20
> >
> > What percentage of changes to selftests from last 2 releases will
> > false-positive trigger this? Would be good to know, checkpatch has
> > a tendency of generating false positives which is quite counter
> > productive. =20
>=20
> It will trigger whenever a new file is added to selftests, which has
> a chance of introducing a test artifact into the tree. I checked the
> last 20 commits touching selftests and only 6 of them were new file
> additions, so this warning would have fired 6 times. Actually, one of
> those 6 had a missing gitignore entry that this check is supposed to
> warn about (fuse_acl_cache_test, 9acb102522b9).
>=20
> Comparing to other WARNINGs that checkpatch generates, such as
> FILE_PATH_CHANGES which has existed since 2014, this seems like a
> reasonable and already accepted way for checkpatch to operate.
>=20
> For comparison, I checked the last 20 commits that triggered
> FILE_PATH_CHANGES in the tree, and none of them actually needed a
> MAINTAINERS update.

Exactly, we have some experience with these useless checks.
Let's not add more low effort stuff.

> > In netdev CI at least we build the selftests and check
> > if there are any untracked files after. =20
>=20
> That is a good practice. But as evidenced by commits already in the
> tree, this type of coverage does not exist in all places.

Could you explain your involvement in kernel development?
It would help us understand where you're coming from.

> Since this is a mistake that is frequently made, I think it deserves
> a warning on its own. In the end I think it is acceptable that this
> warning fires more than necessary, the same way FILE_PATH_CHANGES
> does, because the cost of an extra check is low and the mistakes it
> warns about are easy to miss.

You assume people who don't bother testing the code they merge=20
(or write) will bother to run checkpatch. Not sure that's true.

The problems I see are that - (1) adding false positives makes
people accustomed to ignoring checkpatch warnings in general.

(2) We'd make life harder for people who do automated code
validation (by adding false positives they have to track /=20
add exceptions for). We should be moving more towards automation
as a community. Time for questionable pattern matching with
Perl has passed.
