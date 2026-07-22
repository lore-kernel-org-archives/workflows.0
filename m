Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FEF470EAB;
	Wed, 22 Jul 2026 20:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784753286; cv=none; b=XLJN23Yrb6kGdEnhtghBwA7aAWru1FsSCTVeYFUev6sUM14DR3SgPdkHvWC5m/7QMR8Y1pCqLq+kq9hWYHjsc6Rj5vsqoxJiTgyQFSc2S3ot154PIntUPeYosqm9Gfl+icCxWWm+hOtGlYyWkWEIfgOPo3ulobzze5YhHAcahJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784753286; c=relaxed/simple;
	bh=vymP08tnWdguA9w/xP1V3kmmbRRD3nck1LbblyHe5dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPdjAXjbyEIqtzi+AXV6XLkQg3yzYC2ZoSKO7FyoKhvoullGP0PQtFBmtY5fOij7+b/dXDHQSwZnfIjYdRB52rmrdG77xsQ7iaG/ls/npZHS2L3ZWIaoXzvHsf9JNbKGRQQs1GsGGdtnR5G8aGWeOgTka3wZGQjzttQFY6w1yB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fO6KoKXe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fO6KoKXe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C55A1F000E9;
	Wed, 22 Jul 2026 20:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784753284;
	bh=c1PqhOqWr6GbkXk9zRaLgb7IwFJffrElrtvK4H0eR9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fO6KoKXedYr9f3N20p7zxH/PzLWm8mZwqamy5KyN9WLOZSUUWCCaFfV7AuYHuqyOP
	 D6RQ2L0RGYkJCSR3xwX7XmwACsh+u80emGmKHQwQJ5d3GMdDQaS7emvxqWixZ0gh9G
	 2zwz3mzwrMMmGpkZd6KUe941mFkxBXE3qze/8Jthoq8CLx51X4HwCIeq3ovfYrttQl
	 SYNZXng2ljWO+ExEXXhboV4j5wFqwjDIei+3HSBhUGEHF+W91iWlsuPEXNeOzL9nNK
	 6aVPRqfgNnxosI8jCOU75ZLMRgF47+hPITSXSi7H3K8n5Rm3VrAbUDtHAMkQxVkfFR
	 nd0JXXmYwGzNw==
Date: Wed, 22 Jul 2026 16:48:03 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Sasha Levin <sashal@kernel.org>, 
	tech-board@groups.linuxfoundation.org, Jakub Kicinski <kuba@kernel.org>, workflows@vger.kernel.org
Subject: Re: [PATCH] coding-assistants: simplify attribution
Message-ID: <20260722-accurate-defiant-puma-a7e23b@meerkat>
References: <87qzkuahlr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87qzkuahlr.fsf@trenco.lwn.net>

On Wed, Jul 22, 2026 at 02:34:40PM -0600, Jonathan Corbet wrote:
> -  Assisted-by: Claude:claude-3-opus coccinelle sparse
> +  Assisted-by: LLM coccinelle sparse

I've been playing with this a bit, and it's pretty easy to teach the agent to
add a few tag-like notes as to how exactly it was used, e.g.:

    https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=018b87444d32eb2ffee7cb25f0785e54aa35f7bf

This has:

| Assisted-by: LLM [design, codegen, tests]

It tells us a bit more about *how* the LLM was used, without introducing the
advertisement or pinning exact models.

This format should allow for multiple tool usage:

| Assisted-by: LLM [triage, tests], coccinelle

I don't suggest this is included in this version, but it *is* fairly
straightforward to add to AGENTS.md and tells reviewers just how exactly the
LLM was used.

-K
