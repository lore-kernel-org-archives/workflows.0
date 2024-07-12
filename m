Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2E213210F;
	Fri, 12 Jul 2024 23:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720827905; cv=none; b=uzGU1RWslvqIbgKaspkCrKcULLf8IMe+9L6vE0C/5JegCK7fhb7hMUuJ2ZvfSfuTgQw3hHVnwt9gzt9uHfaWanPQuDtZUVsUCxnwYGZdB+VssD/lUkzr/dhV8FkiqAZdDssyh3w8HiaGLmASEj48GIdnngMIB58OEOhnHXA8Es0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720827905; c=relaxed/simple;
	bh=fqIvSonSHdMXAKQGYjkItrt+JXEqwINfNKm6KOf0yxM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L90/WxiLr6Xb/ucz+EI0psyet07xjbnspLHySyFw9F9uCzu5KmyPyFDNyCGWRb5RB/jEttxM/0i36tfiRd2nfy39TYO71HwZezLET4ClVQ1K+ZwNWO8zgAk6MVEqy2cfhjSfqfaEF4tw2I9Hc5Pg8WOqq3D6oP+5dWtQmCCjNfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kobRnPvg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kobRnPvg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DC0C32782;
	Fri, 12 Jul 2024 23:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720827905;
	bh=fqIvSonSHdMXAKQGYjkItrt+JXEqwINfNKm6KOf0yxM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kobRnPvgZnBj6/lVlKX8eOPuBCQ1jSl0EN7+BHHwcFSKkp1+Rg2LNPGPVe5ShpIMR
	 q0+J+Sld0GkXvuaVtRywhyf+6phS85XUGRrRhsa2kqIP6UPUUpoMCXJNKPLd7/LtDh
	 LPM37u+8XQ/uNLGEnV8r9eR5j7zHrMwsJD7TYMpID+xK+qYMdwsvsPG+0CmEBZ0/pr
	 KMKQYFwF+UfX4jiHTJ1Rwchjvwo9oXwPkxv0sWQCxDwmBflx4as6gCbys3rUKQ2yB3
	 t3WbGrRI5KuqsE/QfwG9dAyFCyJHc0ax4uy6i9G4v72yCXC76SYKjq64Fhg/wLkDQV
	 uKHHtJ3QpAdog==
Date: Fri, 12 Jul 2024 16:45:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>,
 corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <20240712164504.76b15e31@kernel.org>
In-Reply-To: <20240712201156.1413e80e@foz.lan>
References: <20240712144903.392284-1-kuba@kernel.org>
	<7570937c-ead6-40bc-b17f-4ade34a2acf6@sirena.org.uk>
	<1a30aea2-e8e4-487d-81e4-dda5c1e8665e@linuxfoundation.org>
	<20240712201156.1413e80e@foz.lan>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 12 Jul 2024 20:11:56 +0200 Mauro Carvalho Chehab wrote:
> Not sure what this somewhat obscure message wants to accomplish.
> 
> It is quite common to have developers and maintainers discussing 
> outside public forums and internally at the companies they're working 
> for. There are lots of reasonable exceptions besides security. On my
> years of experience, the reasons I've seen more often are:
> 
> 1. language and/or cultural barriers;
> 2. teaching and mentoring new developers to start contributing upstream;
> 3. need to have internal discussions in the light of some IP protected
>    material.
> 
> (1) and (2) are very common for non-native English speakers
> and for newbies, and we do want to have more contributions from
> them. (3) is unavoidable, as discussions related to protected
> IP can't be disclosed due to legal reasons.

Those are valid points but I don't know how to weave them in without
losing clarity. The goal is also to call out such behavior to
_contributors_, so that they know they can reach out to more senior
maintainers if it happens to them. We don't know when discussion is
taken private (by definition). Otherwise contributors get mistreated 
by some corpo-maintainer and they turn away from Linux :(

> Also, if you take it to the letter, have discussions on LPC, 
> summits BoFs, other events handled by the open source community 
> and wall conversations are "closed forums/private conversations".
> I've seen a lot of good results produced on such private
> conversations that solved relevant conflicts and got
> materialized as great contributions.
> 
> There's nothing wrong with that, provided that the outcoming of
> such internal discussions are reflected publicly as patches,
> summit minutes, LWN articles, etc.

Would it help if we speak of "open forums" instead of mailing list?
I think LPC including "hallway track" fall squarely under "conducted 
in a manner typical for the larger subsystem." Here's slightly edited 
version:

  Open development
  ----------------

  Discussions about user reported issues, and development of new code
  should be conducted in a manner typical for the larger subsystem.
  It is common for development within a single company to be conducted
  behind closed doors. However, development and discussions initiated
  by community members must not be redirected from public to closed forums
  or to private email conversations. Reasonable exceptions to this guidance
  include discussions about security related issues.

> The only issues I see with such talks is that the work when
> co-authored should be properly marked as such and that 
> reviewews/acks taken behind doors don't have the same meaning
> as an upstream review, as they may be due to some internal 
> formalities.
> 
> IMO, the best would instead to give a positive message. E. g.
> something like:
> 
> 	Maintainers must encourage discussions and reviews to happen
> 	at public mailing lists, avoiding whenever possible to have
> 	internal discussions.

That's not the message, tho. If someone emails a company privately 
that's fine. If company has internal processes for its development -
also fine (as explicitly called out). I'm trying to set the baseline,
not describe the ideal world.

I am specifically calling out that if someone submits a patch, or
reports a regression the correct response is to review it on the list.
Like a normal person.
Not reply privately that "it's on the company roadmap, just wait" :|
Or reply with a patch company has "forgotten to upstream"..

Maybe it's a cultural thing, but to me this is where the relentless
positivity is counter-productive. I don't want to encourage people
to be angles. I want them not to do the shitty thing.
