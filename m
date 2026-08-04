Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8325F42EEAB;
	Tue,  4 Aug 2026 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785831036; cv=none; b=DcdB1OACzvwfeM/4R6w3AUJBmSW5ML5XwaMqp0A4KdJ063EB6zGiFCEuFx0+vxf5XQawKSX0TR1fzWdsIFCqeeaU1gPFmbgFT+KgOEsmdFQf9DhivGCn0KOeYf++oiWQHJjhhXsNlepLLudh61LILLODYbPLAihAE5jVTyaMtho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785831036; c=relaxed/simple;
	bh=uesUY9Ab0BSbCCqnu5kCNHrVhWM/rUB/vhCzShLjhFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQg61QXbhGba+129YsbnHdi3or0O5OzGs3wJwDFJ/DPZ1cU8vgs2kXzNed8sQzbRee1rR2FcPJvlMCGNko+eMyAfNfwV41RBoG9N3dEK/AeLflYd38D4etJaDoXHFP0u7Js6/iNGMQBzB1+ytgb5+0qudm0CNJMVQRGr8jATvV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpPACFkN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpPACFkN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95111F000E9;
	Tue,  4 Aug 2026 08:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785831035;
	bh=75WUpcS9962StG48XtcTKK5kOFVuxo90uI9yV08SfzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fpPACFkNo9VgNsdzhWZd86E5Ccv52e9JUVHgeCRE2Rcp6p2rfflp6UKzQ+bFENMRg
	 krQqvgzrvFeoURn4bOzQYyrdW2/eEWhiDoIldxdr0w11hSgMYQBkxxwqLtteRb6BJK
	 8kEvvazXCnB5tNfaIVP2PnVtizLIyA+M9t2/e/kAG0Fv2SZIdtZHXY4mvjFVMepFqn
	 SmIxUy+IUNsnKPqX2CuL8PU4BgMnYckyve2TWRWpHGERzZaGxcBeOW3miRgC0HiGVa
	 7Oh3pLGf0ForBWtbclampY4fldfTbhI8CGKGuiPZZ4Vx4gAICdVPDW+SetWIkNlxUp
	 aCXFvSwO8iN8g==
Date: Tue, 4 Aug 2026 09:10:17 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Sasha Levin <sashal@kernel.org>, 
	tech-board@groups.linuxfoundation.org, Jakub Kicinski <kuba@kernel.org>, workflows@vger.kernel.org, 
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH] coding-assistants: simplify attribution
Message-ID: <anGCdTMRCA09cDKV@lucifer>
References: <87qzkuahlr.fsf@trenco.lwn.net>
 <20260722-accurate-defiant-puma-a7e23b@meerkat>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-accurate-defiant-puma-a7e23b@meerkat>

On Wed, Jul 22, 2026 at 04:48:03PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Jul 22, 2026 at 02:34:40PM -0600, Jonathan Corbet wrote:
> > -  Assisted-by: Claude:claude-3-opus coccinelle sparse
> > +  Assisted-by: LLM coccinelle sparse
>
> I've been playing with this a bit, and it's pretty easy to teach the agent to
> add a few tag-like notes as to how exactly it was used, e.g.:
>
>     https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=018b87444d32eb2ffee7cb25f0785e54aa35f7bf
>
> This has:
>
> | Assisted-by: LLM [design, codegen, tests]
>
> It tells us a bit more about *how* the LLM was used, without introducing the
> advertisement or pinning exact models.
>
> This format should allow for multiple tool usage:
>
> | Assisted-by: LLM [triage, tests], coccinelle
>
> I don't suggest this is included in this version, but it *is* fairly
> straightforward to add to AGENTS.md and tells reviewers just how exactly the
> LLM was used.

I think perhaps this should be a follow-up (this stuff is so fraught that I am
super-glad to see Christian's suggestion fly through and want to take gains
iteratively on this :), but completely agree.

David suggested something like:

Assisted-by: LLM # < what it actually did in the patch >

So I think we're kinda aligned on that?

Probably worth keeping the 'what it did' bit fuzzy.

>
> -K

--
Cheers, Lorenzo
