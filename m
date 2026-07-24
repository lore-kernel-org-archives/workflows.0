Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC232439F6E;
	Fri, 24 Jul 2026 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917034; cv=none; b=AWGjDp1bi+gFJrHR04/Ab1WPgDiyXklQnYwU9BCmNWYeyR/kS/syyYReUcqLz5v6/k3IlAH+IcwOIg7YNZRseqIbLF+rXq1KQZecq8gqF48pvhM9HOM+90NiYrY87qOmTybO3McT2h1NviYWvCKwiboCFN2UUVn8cxCaW7eUJAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917034; c=relaxed/simple;
	bh=DWR+d2TlYMH3PmMtQTIbXTYT3NT/AwWXWCAyv6SiudA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z3nRgTU9fub2cjU0hq8Wr8oEyo3s6UYmFAY+Ess9PJxIdC/lroboeaKjDmaEhjeowfczp+ib+/+8gyLkEdNHgUofPpxDQbHXLS6CcYBzmi9AzMbRkPFMrwFxhOGc+4qCk+VvN0ybZS/wfj6CtRo/mpFYJH2WS7wTZm2edFik9EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fotqM9yK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fotqM9yK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E271F000E9;
	Fri, 24 Jul 2026 18:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784917032;
	bh=KedyfgiW+oWj2aCOTXnOip1Bi081qgvKxlB2v/C4lEI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fotqM9yKFArJVi4zx1Nlz3ITwVjRazXmY5PI7F3ivPDJH1eDdbBzQ+OTYApVy4y9z
	 Dcvl2aIgwptRiN1y8Qri5qlpJtv/UxC/Q9xNZLaLsbh2mO7EhElhamMff72eErcl1W
	 JtetGgzIH212QOhLQLmIFPcI8b7ZWaDymkphQxIrNPhfMDtc6AqksvoUS5poNRLPj+
	 ECcdGN36yYpv0Fm/yWTY3GmrXagcPDuYHMaeUBR5XrDWYnmlx2cqEwbjyOo+cHHWvD
	 7bTYytAI1RRNHvDqPTpw5JRm4qRfRQfOV/czccZzS2i5Gzw1GW5Oq/wCVT3CdrU+8O
	 egE7w32rTmWUQ==
Date: Fri, 24 Jul 2026 20:17:07 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
 Sasha Levin <sashal@kernel.org>, tech-board@groups.linuxfoundation.org,
 Jakub Kicinski <kuba@kernel.org>, workflows@vger.kernel.org
Subject: Re: [PATCH] coding-assistants: simplify attribution
Message-ID: <20260724201707.54ea4778@foz.lan>
In-Reply-To: <20260722-accurate-defiant-puma-a7e23b@meerkat>
References: <87qzkuahlr.fsf@trenco.lwn.net>
	<20260722-accurate-defiant-puma-a7e23b@meerkat>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Jul 2026 16:48:03 -0400
Konstantin Ryabitsev <mricon@kernel.org> wrote:

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

I'm fine with either way.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Regards,
Mauro
