Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5073002C6;
	Tue, 18 Nov 2025 16:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484556; cv=none; b=j5+m9aram5tsjIaIo8oEpvznrQ06Ila5I8e3rqiZ/iVqxqoRzlHPxt80vEpB4zh+syTgcbgVBk7YZ4N73FfRIa2F9ECD8tWVLgrTA/0msZZ223Syl5n+aSicvyYuUiFjCdB3Vkv7bQeqILrIxgilZ4maecmGwDcvcCm9Ts0wqYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484556; c=relaxed/simple;
	bh=QSba0GChagr/PZU9fAUadbaWeTmnY6lPHivMegNemIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kw990mSw/P/MVYqz3Q4s/Zvoo8yNar9jrvTC2/zvYzffIRO/0bmoDfOI0Fa7ownooRAV/JVVKy4cB6zW3a5wIRX91WkEVkL1Ifa4LRDauNw2kTHr5ece1IeMzt9HVH/afGGsTL87zTI40CYSL0XGLPvq8KKOFVSmMl0WzCrIwyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+1DB5Yr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+1DB5Yr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1852BC4CEFB;
	Tue, 18 Nov 2025 16:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763484555;
	bh=QSba0GChagr/PZU9fAUadbaWeTmnY6lPHivMegNemIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N+1DB5Yr+qICAxQK28yuurTxo2AhMEHibqOIn+3fXJWz5C+rXT7kqH8LV2KpEoZkI
	 mwFt6bfisub8MIDF/s0pGx6IWpX7juruBtlD3CcdEPvOK6nNCjk7SwwgJFHGZVbmoa
	 6MRy70biO1bQ5woauhntvv8EDFCF21Dpp+h1qz3lrChLQjYte2x3wKIxnlTMS0jN94
	 9BeiLc/TaYW5oPTXoLN5ejm4RKtw2gWvSEzicDOFw416y5CAUBWojnlcBre0HZMT69
	 kiLMmVw4i3H50moLer0t6F0Mk229tnNZh1WSD3njCh12h904S/+zzrawbKcZLz894D
	 GvY8N71RkcqNA==
Date: Tue, 18 Nov 2025 08:49:13 -0800
From: Kees Cook <kees@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Sasha Levin <sashal@kernel.org>, linux-doc@vger.kernel.org,
	josh@joshtriplett.org, konstantin@linuxfoundation.org,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	workflows@vger.kernel.org, joe@perches.com, rdunlap@infradead.org
Subject: Re: [PATCH v3] README: restructure with role-based documentation and
 guidelines
Message-ID: <202511180848.8A660DDB@keescook>
References: <20251117213801.4077535-1-sashal@kernel.org>
 <87wm3n47u6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wm3n47u6.fsf@trenco.lwn.net>

On Tue, Nov 18, 2025 at 09:35:29AM -0700, Jonathan Corbet wrote:
> That said, I have one quibble :)
> 
> > +Examples of Proper Attribution:
> > +
> > +Good examples:
> > +  Assisted-by: AI-Tool:model-version-1.0 coccinelle
> > +  Assisted-by: AI-Assistant:v2.5.0
> > +  Assisted-by: Code-Helper:model-2024-04-09 sparse smatch
> > +  Assisted-by: ML-Agent:version-2024-11
> > +
> > +Bad examples (DO NOT USE):
> > +  Assisted-by: AI                          # Too vague
> > +  Assisted-by: AI-Tool coccinelle git      # Don't list basic tools
> > +  Signed-off-by: AI Assistant <ai@...>     # NEVER - AI cannot sign off
> 
> I don't think this belongs here - we don't have examples of good SOB
> lines - or of anything else.  What this needs, instead, is a link to
> Dave's tools document once that goes in.
> 
> (We also, in truth, do not yet have a consensus on what the attribution
> tags should be, and here isn't the place to try to form one.)

Agreed -- I love the new sections, but we need to drop the Assisted-by
portion until we've had the in-person discussions at Maintainers/LPC.

-Kees

-- 
Kees Cook
