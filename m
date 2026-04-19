Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4FC1E5724;
	Sun, 19 Apr 2026 19:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776625505; cv=none; b=tiJdRdhH77WmXjVDsy++meUcO7PU/uKhn0UNTb6Q/q5Uid1F6E795JdbY61vqQp4eXszpt++PRh3AE908zdWbu9tlqw9QAzfIfWbobdsPxOsqGkfMey5v+xF8GmAmKtAf8mwyBmJO3kxoD8iiXU2oZnpO07ygAmDKuWBvJPlxWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776625505; c=relaxed/simple;
	bh=0o6iXnNdqdajO9sJAzsWeXyZ6igvpK08RjfL8VZgRvc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pX2ARztFG0o9u+bW2RVgGpdd9QcaUBoQJyInZAmiv8nI2ycl16+4+if0rhYsrC3Qx383SC509gBoVI6NW4zirNJc3HIeoVvvYOjD9AHr/+5O003I9mKveRJ/plvhbeRE+iWLku7wdSGBgFh/meP2ZEmCfpT3xsCpQ1KTgDeEGOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVChCz/D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVChCz/D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7D3C2BCAF;
	Sun, 19 Apr 2026 19:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776625504;
	bh=0o6iXnNdqdajO9sJAzsWeXyZ6igvpK08RjfL8VZgRvc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DVChCz/DdGfBg9+KCUerv/hol4dJ8KH4nuQxdYFJA5hBJm/2t3v3xJz92Dwlpt+3J
	 MZDAWfNYlyvPc4Q/7CpFyUYWZYJ1XI9VPu9l7W6hmIsPSIB4D5zsUvALa+CYeyDmNf
	 KTULdMz1jgGTsejlNu2ULnMFCbeignRNcWbteuheL5FMKDpxlXFzSkRYmWj7TVsdI4
	 6Jb+oqfSIuB2bWyKc+zSCUl+pZ1fh27qdEfe1t5/d6xb9CHEcn//fLCcfleSZN+X9o
	 MAmIwoucwj0DRcqMq6C1gqji25KN8dSMYGkUaV69vYfuUxZXE8kCYKEKReydlJKaQr
	 XzgCcV+GCSd+w==
Date: Sun, 19 Apr 2026 21:04:56 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Alexandre Ghiti
 <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>, Dan Williams
 <djbw@kernel.org>, Benno Lossin <lossin@kernel.org>
Subject: Re: [PATCH v2 00/11] Auto-generate maintainer profile entries
Message-ID: <20260419210456.1f3911a0@foz.lan>
In-Reply-To: <9bcb8053-2eb6-4327-ae3f-2a23321c4c3e@infradead.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
	<9bcb8053-2eb6-4327-ae3f-2a23321c4c3e@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 18 Apr 2026 17:05:56 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 4/16/26 11:11 PM, Mauro Carvalho Chehab wrote:
> > Hi Jon,
> > 
> > This patch series change the way maintainer entry profile links
> > are added to the documentation. Instead of having an entry for
> > each of them at an ReST file, get them from MAINTAINERS content.
> > 
> > That should likely make easier to maintain, as there will be a single
> > point to place all such profiles.
> > 
> > The output is a per-subsystem sorted (*) series of links shown as a
> > list like this:
> > 
> >     - Arm And Arm64 Soc Sub-Architectures (Common Parts)
> >     - Arm/Samsung S3C, S5P And Exynos Arm Architectures
> >     - Arm/Tesla Fsd Soc Support
> >     ...
> >     - Xfs Filesystem
> > 
> > Please notice that the series is doing one logical change per patch.
> > I could have merged some changes altogether, but I opted doing it
> > in small steps to help reviews. If you prefer, feel free to merge
> > maintainers_include changes on merge.
> > 
> > There is one interesting side effect of this series: there is no
> > need to add rst files containing profiles inside a TOC tree: Just
> > creating the file anywhere inside Documentation and adding a P entry
> > is enough. Adding them to a TOC won't hurt.
> > 
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Suggested-by: Dan Williams <djbw@kernel.org>
> > Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/
> > 
> > (*) At the end, I opted to use sorted(), just to ensure it, even
> >     knowing that MAINTAINER entries are supposed to be sorted, as
> >     the cost of sorting ~20 already-sorted entries is negligible.
> > 
> > ---
> > 
> > v2:
> >   - I placed the to MAINTAINERS changes at the beginning.
> >   - fix a bug when O=DOCS is used;
> >   - proper handle glob "P" entries (just in case, no profiles use it ATM);
> >   - when SPHINXDIRS=process, instead of producing warnings, point to
> >     entries at https://docs.kernel.org;
> >   - MAINTAINERS parsing now happens just once;
> >   - The output won't be numered for entries inside numered TOC trees;
> >   - TOC tree is now hidden;
> >   - instead of display a TOC tree, it shows a list of profiles,
> >     ordered and named after file system name taken from MAINTAINERS file;
> >   - At the output list, both https and file profiles are shown the same
> >     way.
> > 
> > Mauro Carvalho Chehab (11):
> >   MAINTAINERS: add an entry for media maintainers profile
> >   MAINTAINERS: add maintainer-tip.rst to X86
> >   docs: maintainers_include: auto-generate maintainer profile TOC
> >   docs: auto-generate maintainer entry profile links
> >   docs: maintainers_include: use a better title for profiles
> >   docs: maintainers_include: add external profile URLs
> >   docs: maintainers_include: preserve names for files under process/
> >   docs: maintainers_include: Only show main entry for profiles
> >   docs: maintainers_include: improve its output
> >   docs: maintainers_include: fix support for O=dir
> >   docs: maintainers_include: parse MAINTAINERS just once
> > 
> >  .../maintainer/maintainer-entry-profile.rst   |  24 +--
> >  .../process/maintainer-handbooks.rst          |  17 +-
> >  Documentation/sphinx/maintainers_include.py   | 161 +++++++++++++++---
> >  MAINTAINERS                                   |   2 +
> >  4 files changed, 150 insertions(+), 54 deletions(-)
> >   
> 
> Just a note, not asking for a change or fix:
> 
> AFAICT, all P: entries are now listed nicely except for:
> 
> P:	rust/pin-init/CONTRIBUTING.md

That's because it doesn't follow what's expected for "P":
either a file that Sphinx can read (rst files), placed inside
Documentation/ and added to Sphinx toctree or an external html URL. 

The way it is, the subsystem profile regex won't get it.

While it is not hard to add an exception, IMO the best would be
to do:

	$ pandoc -fgfm -trst rust/pin-init/CONTRIBUTING.md > Documentation/process/pin-init.rst
	$ sed -i s,rust/pin-init/CONTRIBUTING.md,Documentation/process/pin-init.rst, MAINTAINERS 
	$ git rm rust/pin-init/CONTRIBUTING.md
	$ git add Documentation/process/pin-init.rst
	$ git commit -as

> 
> so for the series:
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks!

Mauro
