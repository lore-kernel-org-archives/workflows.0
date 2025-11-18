Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764943A1CF7;
	Tue, 18 Nov 2025 16:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483732; cv=none; b=TSiW3C7PggtnR3M38F2Fj88XrwToPj/sc1lxVBVlT3LX4SdzcWxwxdzBmmZK+5Cxc6GFRehIw+ZZbz8mNI0nTjGahHt6lMUlISAHQ6koHzg1uVD+GqKYAevYdPa4anyXNGWAnnMYo3tDHFZjTYf0m9XwViy3TurWEKoV3TGHYm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483732; c=relaxed/simple;
	bh=XG2/0NHbz5h1NeW5vRPlEIFWpPEF81/RkJA/MakjhaY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=u+dqG0G2ieVUw6R4CSM/hbZhvg5hUjHZzcprBq4pxyucTg7XWdPAv7TP6MrCaJg8DjB3NPuWibxWJzw7EukZythxA8qiDS8O7VHTVCHBUwE8O9HME5qtreZ4dEIOTfe0q9oAqEZ+KH5FSGlNy9v+KL1Hbt+Tf0Q/9WJL0vPpoSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EUJpjVZH; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EUJpjVZH"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AC5A240C48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763483730; bh=c6E0Cc8VknrY5JDkYvyrX0Q8/d43A/ouaT2Kw+6iT/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EUJpjVZHN5yrIYX1IIMojhIJ+H8CZ3HnpULEoGm178vsXU4X4463JLMgVF2Qnvb5v
	 9N8xEtGIeSd5AEQpdVxdjA9CGK0Z32eQ5MRwnVgeem2Aiqwm+SiJVbKDMcD0vgF0r2
	 ucNe0ETSdp9VTdW3ooBROYs9OheGS/y2xOygao4hkbKUUmGeK1iyIE6aWepAc0XEBy
	 uD/uNmIq2b9F+Ehgqtc4eccrVAhbLv8ZMFrRzEOBNg+Iuz+ja/c1XnvV0PvEczxIgq
	 l7OQZppjIjrSbbczTb5dTsrrZDn2SMLANAanFAkQQxaWUEZDk8+O27PLnC87vCnmUN
	 rm26LiubopQsQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AC5A240C48;
	Tue, 18 Nov 2025 16:35:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sasha Levin <sashal@kernel.org>, linux-doc@vger.kernel.org
Cc: josh@joshtriplett.org, kees@kernel.org, konstantin@linuxfoundation.org,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 workflows@vger.kernel.org, joe@perches.com, rdunlap@infradead.org, Sasha
 Levin <sashal@kernel.org>
Subject: Re: [PATCH v3] README: restructure with role-based documentation
 and guidelines
In-Reply-To: <20251117213801.4077535-1-sashal@kernel.org>
References: <20251117213801.4077535-1-sashal@kernel.org>
Date: Tue, 18 Nov 2025 09:35:29 -0700
Message-ID: <87wm3n47u6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sasha Levin <sashal@kernel.org> writes:

> Reorganize README to provide targeted documentation paths for different user
> roles including developers, researchers, security experts, maintainers, and AI
> coding assistants. Add quick start section and essential docs links.
>
> Include proper attribution requirements for AI-assisted contributions using
> Assisted-by tags with agent details and tools used.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Changes in v3:
> - Replace "Agentic Coding" terminology with clearer "AI Coding Assistants"
> - Add concrete examples of proper Assisted-by tag usage with multiple formats
> - Add "Bad examples" section showing anti-patterns to avoid
> - Add detailed tool categorization distinguishing specialized vs basic tools
> - Add explicit format specification: $AGENT_NAME:$MODEL_VERSION [$TOOL1] ...
> - Expand section description to clarify it applies to both AI tools and
>   developers using AI tools
>
>  README                | 212 +++++++++++++++++++++++++++++++++++++++---
>  scripts/checkpatch.pl |   1 +
>  2 files changed, 202 insertions(+), 11 deletions(-)

Overall I really like this change.  We could quibble forever about the
details, but that's probably not worthwhile.

That said, I have one quibble :)

> +Examples of Proper Attribution:
> +
> +Good examples:
> +  Assisted-by: AI-Tool:model-version-1.0 coccinelle
> +  Assisted-by: AI-Assistant:v2.5.0
> +  Assisted-by: Code-Helper:model-2024-04-09 sparse smatch
> +  Assisted-by: ML-Agent:version-2024-11
> +
> +Bad examples (DO NOT USE):
> +  Assisted-by: AI                          # Too vague
> +  Assisted-by: AI-Tool coccinelle git      # Don't list basic tools
> +  Signed-off-by: AI Assistant <ai@...>     # NEVER - AI cannot sign off

I don't think this belongs here - we don't have examples of good SOB
lines - or of anything else.  What this needs, instead, is a link to
Dave's tools document once that goes in.

(We also, in truth, do not yet have a consensus on what the attribution
tags should be, and here isn't the place to try to form one.)

Thanks,

jon
