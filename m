Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4315CA5A;
	Mon,  4 May 2026 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777878049; cv=none; b=LYlCVOw9OislOjq2zwtkRB5a3yVmMVM8DrB9UnYkYp8x1xNU+dR2bt600BF0PWoDvh86P1a5n0fsogiXcJ1Z/uZrzK4WZ3oXzI7tnlvCSIfOsC9yzmOS9us8wE4/ID+jkwoaW6C00/Y/m4aAMcadqcy9fW5cE5u4aqq1yrbLBs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777878049; c=relaxed/simple;
	bh=O/IjjvqcY6T4mHKxT7aqn7RJ8sDV+fNCJ2tJTa/lzkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GTicQh47uiiawOWqcONX3HbtrUlJOSAqEiZLFLezon1T8AM8gQMIx3TW3vuP5AEepQ2OB7JOFLEWvK0Sq4g62m4Lg8SJMMlczDlONjWK/AAAOYGcNd23sTrKjhQ8mBMalZ3E+pQ85t8HMe+JNuI2qz1UvtcdMOVLNUIVDPbsHmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEq4HUcf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEq4HUcf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB74FC2BCC9;
	Mon,  4 May 2026 07:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777878049;
	bh=O/IjjvqcY6T4mHKxT7aqn7RJ8sDV+fNCJ2tJTa/lzkQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VEq4HUcf3QNgYsZ7GMLg83m0pOxdUX9O7Y8j03YlhQBitf91Vdnr63V2+j+0HE3S4
	 feXCh8vjB9auwL9Bao0bll0iph31TaHrOxHWhs42nk9Ae3PFuy+MLSSZk0yACnA5n2
	 408SIW5r8x74ZUmrxXu1zjFUWz0dJpiysSRzxeWFE0LtMdYlq9fZNb1kzuSJ+Bpuxw
	 icKSJt1AdQaIxxfYwmj+YqF/eUc24tQFV+Czmb3SpNSisxXtVadc0ovb/TM6Eti26e
	 BlTmOgKw8xwMhQS3qOQg7pLSA6pH3wqbK+OU1nPXxxv+YPnyj4wmVPYJNq6RU0Uqx5
	 7vbxOzL115vMg==
Date: Mon, 4 May 2026 09:00:41 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <pjw@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Alexandre Ghiti
 <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Dan Williams <djbw@kernel.org>
Subject: Re: [PATCH v4 00/10] Auto-generate maintainer profile entries
Message-ID: <20260504090041.243520a8@foz.lan>
In-Reply-To: <87lde0bii2.fsf@trenco.lwn.net>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
	<87lde0bii2.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 03 May 2026 09:49:41 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Hi Jon,
> >
> > This is basically the same patch series I sent during the merge
> > window, rebased on the top of post 7.1-rc1 docs-next branch.
> > It is tested both with and without O=DOCS.
> >
> > It contains just one extra trivial patch adding a missing SPDX
> > header, and, on v4, I dropped two patches touching MAINTAINERS,
> > as those aren't needed anymore.
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
> 
> One thing I kind of dislike about these magic mechanisms is that we end
> up with a single, essentially unsorted list of stuff that readers have
> to go digging their way through.  It would be nice if we could somehow
> apply a bit of structure; as the number of these handbooks grows, our
> readers would appreciate it.

The output is sorted by subsystem's name:

	for profile, entry in sorted(maint.profile_entries.items()):
	    if entry.startswith("http"):
		output += f"- `{profile} <{entry}>`_\n"
            else:
		output += f"- :doc:`{profile} <{entry}>`\n"

But yeah, as this grows, We can apply some struct there later on.

I expect that this would be good enough for "P" entries: as such entries 
are used only by the biggest subsystems, I won't expect that the profiles 
list would be too big. 

If I'm wrong, though, changing its output is easy, as all the parsing
were done in separate: all we have to do would be to change this part.

-

Now, for the full MAINTAINERS content, I agree with you. I have
a patch series here which splits the parsing from the output,
which allows placing its contents inside a table and with a
filter javascript [1]. On my view, the output is a lot more
interesting for readers this way [2].
 
> Oh well, one can always hope.  Meanwhile, this seems useful, I've
> applied it.

Thanks!

---

[1] On such series, I'm creating a table with two rows:

        output += ".. _maintainers_table:\n\n"
        output += ".. flat-table::\n"
        output += "  :header-rows: 1\n\n"
        output += "  * - Subsystem\n"
        output += "    - Properties\n\n"

        self.state.document['maintainers_included'] = True

        for name, fields in maint_parser.maint_entries.items():
            output += f"  * - {name}\n"

            tag = "-"
            for field, lines in fields.items():
                field_name = maint_parser.fields.get(field, field)

                output += f"    {tag} :{field_name}:\n        "
                output += ",\n        ".join(lines) + "\n"
                tag = " "

            output += "\n"

   Which is a lot easier to read than the current output, and adding
   a small javascript that allows filtering entries, based at the
   contents of either subsystem or properties. That should help
   readers to seek for things they're interested.

   I considered ordering it by subsystems, and did some tests with that,
   but at the final version I ended removing.

   The main issue is that MAINTAINERS entries aren't grouped by
   subsystems. Also, we don't have any field to identify to what 
   subsystem each entry belongs.

   Using the mailing list field helps to have something close enough,
   while being fast. Even so, some caveats are needed, as:

   1) several entries contain multiple ML entries, which may include:
      - subsystem ML;
      - LKML;
      - driver-specific ML;
      - vendor-specific ML.

   2) several entries have only LKML.

   For the purpose of grouping such entries, even after filtering out LKML,
   due to (1), hints are needed to try to pick subsystem ML. Perhaps the
   best hint is to check if the entry is @kernel.org, which works reasonably
   well. Yet, not all subsystems have its ML there.

   I also considered sorting them by the number of files, using iglob 
   to calculate it. That would help to place the subsystem first, followed
   by subsystem drivers, and this is fast enough with my nvme disks but 
   this could slow kernel builds on mechanical HDs.

   So, I suspect that, if we want to have something more structured,
   the first step would be to do some rework at the MAINTAINERS file.

[2] I need some time to check if are there any regressions
    on the patch that splits the logic.

Regards,
Mauro
