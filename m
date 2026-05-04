Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992D83D9DBB;
	Mon,  4 May 2026 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905573; cv=none; b=jSQt157USn7lQ+wAXT8WyP8P9rvlIMjA7vf2rhT0Nr3vBP2CCKJSIefg+KEFiybLG9dryK3a+UygL0DQaI48SFk1VjTBcMNww8J41REnq/ZXqlAVed8+2tGV6/QgBbqsLvmuToeFW+/QoVHE74nXRUSCqSZ4lflzBYAbWCJOhO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905573; c=relaxed/simple;
	bh=FxoWnitM8sq1qmvGum3hMvfTjjYC12V36P8W0yTzW30=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xmh+odWdRAXIECz6q+iMMpfewusADvwXcCiSy5Kt966h7Vyb1dsUX080fLtEFYSc8v4gPcEYe7KqDkqEVg1QBaq6mf8mfekgjE32rMoucKg9Zqhz7y1d2NHOQA9rN/QIeInjYFjncrjEWtDtWyIGQ4DIy4yqbK8OZrPp79GpGKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8JnDe6E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8JnDe6E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9E5C2BCB8;
	Mon,  4 May 2026 14:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777905573;
	bh=FxoWnitM8sq1qmvGum3hMvfTjjYC12V36P8W0yTzW30=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I8JnDe6EUtn6YHetNFJEcZa2PNfrak+g1eIYd5Np8ZtMa8mHvCfiqaUMRMwn672Zf
	 qehRu31K4AO9YapQPUdJ5QOLjr4SqL0Pdov/OWdK1OZY/C+Sjl/svLmKRZuwHqt8mN
	 uAXgq71OSFK3U9bpCUWXDuS5zQi4iAThTdNV63saKaI+yxgNkS7Vcs+5shg9VZ8nAN
	 dGnOSCLFHMvsPVt1auoJjkVVGrEmNDNYBU2P7HNoVoOQbsvN3Pd0Mo9sZvkTo31XCX
	 PnsE1dWihKOzNX9myapNngb2M3XyFo+tcNukl6zsBI2V9Q/5pScjwZbQJVEpQcrGxK
	 EHtrRh3Ab/krQ==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wJuSJ-0000000EoSy-02WM;
	Mon, 04 May 2026 16:39:31 +0200
Date: Mon, 4 May 2026 16:39:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <pjw@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Alexandre Ghiti
 <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Dan Williams <djbw@kernel.org>
Subject: Re: [PATCH v4 00/10] Auto-generate maintainer profile entries
Message-ID: <20260504163930.6114320b@localhost>
In-Reply-To: <20260504090041.243520a8@foz.lan>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
	<87lde0bii2.fsf@trenco.lwn.net>
	<20260504090041.243520a8@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 4 May 2026 09:00:41 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> On Sun, 03 May 2026 09:49:41 -0600
> Jonathan Corbet <corbet@lwn.net> wrote:
> 
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> > 
> > > Hi Jon,
> > >
> > > This is basically the same patch series I sent during the merge
> > > window, rebased on the top of post 7.1-rc1 docs-next branch.
> > > It is tested both with and without O=DOCS.
> > >
> > > It contains just one extra trivial patch adding a missing SPDX
> > > header, and, on v4, I dropped two patches touching MAINTAINERS,
> > > as those aren't needed anymore.
> > >
> > > This patch series change the way maintainer entry profile links
> > > are added to the documentation. Instead of having an entry for
> > > each of them at an ReST file, get them from MAINTAINERS content.
> > >
> > > That should likely make easier to maintain, as there will be a single
> > > point to place all such profiles.
> > >
> > > The output is a per-subsystem sorted (*) series of links shown as a
> > > list like this:
> > >
> > >     - Arm And Arm64 Soc Sub-Architectures (Common Parts)
> > >     - Arm/Samsung S3C, S5P And Exynos Arm Architectures
> > >     - Arm/Tesla Fsd Soc Support
> > >     ...
> > >     - Xfs Filesystem
> > >
> > > Please notice that the series is doing one logical change per patch.
> > > I could have merged some changes altogether, but I opted doing it
> > > in small steps to help reviews. If you prefer, feel free to merge
> > > maintainers_include changes on merge.
> > >
> > > There is one interesting side effect of this series: there is no
> > > need to add rst files containing profiles inside a TOC tree: Just
> > > creating the file anywhere inside Documentation and adding a P entry
> > > is enough. Adding them to a TOC won't hurt.  
> > 
> > One thing I kind of dislike about these magic mechanisms is that we end
> > up with a single, essentially unsorted list of stuff that readers have
> > to go digging their way through. 

Heh, perhaps you're referring to the TOC tree. You'll see it
unsorted on diffs because the TOC tree there is hidden. As it is
a set, currently it will output a different result on each run.

Not a problem for users, but it makes harder to check differences
after patches, so I'm planning to submit a patch to keep it sorted
just for the sake of doing:

	diff -u before/ after/

Thanks,
Mauro
