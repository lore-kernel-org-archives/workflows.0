Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355A5211A14;
	Tue,  4 Aug 2026 11:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844184; cv=none; b=Yh0UN1NF6/68BcsN/KBx3fludIGYEBmtkmZIGzsoe+e4rkVVJe/yaqx6RB+eKWeLJqu7k8ikn7gSVHFwsRJh+qZo1IUPszTLeGYY7JGizOhlXTPMVJCUmzhwPF0zENfuOuH2wsjFdBOA66V7sbHM1CyM5VdAMDn8p3R+AvsRnrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844184; c=relaxed/simple;
	bh=S+SVcoNnMHR2XRZnn0KcYkKbIRf+OvVulnpBLWnYKSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5akJwJo73yLEw/2VruoIp06qTA6LiisQDxKeqGrtWnyt95iyaqF1DyDKnO1COZ0sXfQrEYXWtNKrzZ0ousFq8Q9cTGnmLF1odOl6rQNsAuk5ijHW10O3JoSu9sZ2ujYLoUbAN504CQw/sRcmlYzD6FPnvPQMFtL8iWKfgOHjWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyBygSLd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyBygSLd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FBB1F000E9;
	Tue,  4 Aug 2026 11:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785844182;
	bh=DiYfTq9eyPOKZXhsLWl6mUtAMuwyP7fS48qDMnzuV4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jyBygSLdciyDsGuhfq3cwHKEwctJ93zaLnWew3TbgYkrtJiQqflpCT7XOLDvjV6ad
	 ihfu+wTdmezM3FI4f0grHnc7aPcoguVMicYykgcMg0WvvR/Ve6LOgt7M8GXPJ+uyo3
	 fLdiLBtYagbfU5ZaySuxo56wKC3q5vY+rY8SAtkAk+TFNFYG5Pl9BL1NOyWNDeuzFa
	 LM+c8FYaAWzUq7mE/GhDBkdHynKcDO0U8X+CzKJ6W/ZJvoFXYLz6JK6i1hMMngPfX4
	 gfg3RJdv40wof5RqflXyCJgY9kza6tnFagOQGAEzNRAKL0UgMYmLgOpdKeGZ3pWC9S
	 v3y5s2YsAafbA==
Date: Tue, 4 Aug 2026 12:49:25 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Konstantin Ryabitsev <mricon@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Sasha Levin <sashal@kernel.org>, tech-board@groups.linuxfoundation.org, 
	Jakub Kicinski <kuba@kernel.org>, workflows@vger.kernel.org, 
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH] coding-assistants: simplify attribution
Message-ID: <anHRqIWowGehpfb_@lucifer>
References: <87qzkuahlr.fsf@trenco.lwn.net>
 <20260722-accurate-defiant-puma-a7e23b@meerkat>
 <anGCdTMRCA09cDKV@lucifer>
 <1135422962.153066.1785841763574@kpc.webmail.kpnmail.nl>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1135422962.153066.1785841763574@kpc.webmail.kpnmail.nl>

On Tue, Aug 04, 2026 at 01:09:23PM +0200, Jori Koolstra wrote:
>
> > Op 04-08-2026 10:10 CEST schreef Lorenzo Stoakes (ARM) <ljs@kernel.org>:
> >
> >
> > On Wed, Jul 22, 2026 at 04:48:03PM -0400, Konstantin Ryabitsev wrote:
> > > On Wed, Jul 22, 2026 at 02:34:40PM -0600, Jonathan Corbet wrote:
> > > > -  Assisted-by: Claude:claude-3-opus coccinelle sparse
> > > > +  Assisted-by: LLM coccinelle sparse
> > >
> > > I've been playing with this a bit, and it's pretty easy to teach the agent to
> > > add a few tag-like notes as to how exactly it was used, e.g.:
> > >
> > >     https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=018b87444d32eb2ffee7cb25f0785e54aa35f7bf
> > >
> > > This has:
> > >
> > > | Assisted-by: LLM [design, codegen, tests]
> > >
> > > It tells us a bit more about *how* the LLM was used, without introducing the
> > > advertisement or pinning exact models.
> > >
> > > This format should allow for multiple tool usage:
> > >
> > > | Assisted-by: LLM [triage, tests], coccinelle
> > >
> > > I don't suggest this is included in this version, but it *is* fairly
> > > straightforward to add to AGENTS.md and tells reviewers just how exactly the
> > > LLM was used.
> >
> > I think perhaps this should be a follow-up (this stuff is so fraught that I am
> > super-glad to see Christian's suggestion fly through and want to take gains
> > iteratively on this :), but completely agree.
> >
> > David suggested something like:
> >
> > Assisted-by: LLM # < what it actually did in the patch >
> >
>
> We should have some format to explain what the assistant was used for,
> but not sure if a single line after the tag is going to cut it. I agree
> it is the most simple, but I have personally used an LLM for a patch where
> the explanation of what exactly it was put to do would have been very
> hard to fit in a format like this without significant loss of information.
>
> So, maybe below the ---? I guess that most maintainers don't want this kind
> of explanation to be part of the commit message (or maybe they do?)

I think best to keep discussion of this to the follow up patch to avoid the
usual combinatorial thread explosion on this topic :)

>
> Best,
> Jori.

--
Cheers, Lorenzo
