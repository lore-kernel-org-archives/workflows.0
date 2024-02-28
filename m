Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE23136132
	for <workflows@vger.kernel.org>; Wed, 28 Feb 2024 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709129015; cv=none; b=szLC3hQgB8wFeHM3qmrfGGvoB9hX3qUSNd56hIYKi2FI6yTjfuDASvxk8hNon6OwT69Gn5WPR1ZKOfcc92rMZGMSW18w9LKcAVfhcJWVHgRwZychT57geUskbQqTQnYbJEgBhs4IfLKulb+xQMWzX/0P8wIBmmIEScCK+g8EtY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709129015; c=relaxed/simple;
	bh=pAIbBI2ep4c6hgMVwKhImdA1GSR3M4muEMqxmaDF1Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKcFBhwaqBI2vIx6YF2/87XJ4ZeF+eJyoQnQ3XHfJRICqNaSZwvJJsjI+rloXXJk1Ka4ooDQsTY2rWeSwNyCz08hVlmRg8Of9AOIcQc/t9bbP969SNosp1JEJADb8jf/UcLs75YbQX8AVSJ0J59FJ/dck/SGhBjYb3TXA50oZA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9fkz/CJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9fkz/CJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47088C433F1;
	Wed, 28 Feb 2024 14:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709129015;
	bh=pAIbBI2ep4c6hgMVwKhImdA1GSR3M4muEMqxmaDF1Fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9fkz/CJ+bqLlWBWwFlFoRyBXCIaF+gCwkWVH9v3XAiLLUO/DUXrpWiXgHHVVL8Yi
	 mlFT7xLawJI/AfBzg7weThOV8IKNzxIgRs7L0ZQ6tDMdobYamxZJxFkI0Q3DbPQA9h
	 fGcTnjZ4d/aSGuaxC8saXHFUUFwrQuS6Z/U6ErfCNidP1BsM0zs4Xxrh6UYGsspSuQ
	 64RkU7K+Z3icDOl4lds5oT81gXyzpYaAsXXRa3I8M5WJZJfP5E8hh4Dq/QGPXxpa+W
	 BQujs/RtzFNNsl17gKuZ+RAMK8suKVjwBOfb9G7GC7Xj54k/aQkpPzDICj55tCjGZW
	 jgTZKReqUF/sg==
Date: Wed, 28 Feb 2024 14:03:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
	tools@kernel.org, workflows@vger.kernel.org
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Message-ID: <701aad76-2706-4e33-b8ba-9c76282e26d1@sirena.org.uk>
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <20240228050007.GB18047@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PqAWuXfFyEony8zJ"
Content-Disposition: inline
In-Reply-To: <20240228050007.GB18047@1wt.eu>
X-Cookie: Function reject.


--PqAWuXfFyEony8zJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 28, 2024 at 06:00:07AM +0100, Willy Tarreau wrote:
> On Tue, Feb 27, 2024 at 05:32:34PM -0500, Konstantin Ryabitsev wrote:

> > So, the question is -- is this useful at all? Am I wasting time poking in this
> > direction, or is this something that would be of benefit to any of you? If the
> > latter, I will document how to set this up and commit the thread minimization
> > code I hacked together to make it cheaper.

> I figured a number of shortcomings about this: I suspect that those
> most interested in such output are either, a bit like me, not much
> active on kernel development, or focus on a specific area and mostly
> want to stay aware of ongoing changes in other areas they're really
> not familiar with.

I can imagine using this sort of thing for the case where I get to my
inbox in the morning and there's some enormous thread appeared overnight
with people arguing and I'm trying to get a handle on what the various
subthreads are all about.  The demo didn't cover exactly that case but
it looked like it might be able to give some sort of useful steer.

> And because of this I didn't find on what boundaries to cut the analysis,
> If it's "since last time I read my email", it can only be done locally
> and will be per-user. If it's a summary of a final thread, it's not
> super interesting and it's better explained (IMHO) on LWN where the
> hot topics are summarized and developed. If it's the list of threads
> of the day, I've suspected that there are so many that it's unlikely
> I'd read all of them every evening or every morning. I've been wondering
> if an interesting approach would be to only summarize long threads,
> since most short ones are a patch, a review and an ACK and do not need
> to be summarized, but I think that most of us seeing a subject repeat
> over many e-mails will just look at a few exchanges there to get an
> idea of what's going on.

For the above case it'd be an on demand thing which I'd look for
occasionally.

> Also regarding processing costs, I've had extremely good results using
> the Mixtral-8x7B LLM in instruct mode running locally. It has a 32k context
> like GPT4. And if not enough, given that most of a long thread's contents
> is in fact quoted text, it could be sufficient to drop multiple indents
> to preserve a response and its context while dropping most of the repeat
> (it cuts your example thread in roughly half). But this still takes quite
> a bit of processing time: processing the 14 mails from the thread above
> took 13 minutes on a 80-core Ampere Altra system (no GPU involved here).
> This roughly costs 1 minute per e-mail, that's a lot per day, not counting
> the time needed to tune the prompt to get the best results!

That actually sounds potentially viable for my case, at least while I'm
at home.

--PqAWuXfFyEony8zJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXfPTIACgkQJNaLcl1U
h9D3Jgf/abmqSjS+iYBN9yrHXW/RFkQbUBAL9yHB6wU+lU4tiMJhkN4R37x8vRkM
vX+BZUTvi/MRrih2At8HdC7X651HizbOxz6oAhGcB/qaxMihod5kN7EpQY4fERPL
o7IvaN66+FALsL3tp21bJLPqhMPaPU7iTNAaKCEoB9sLb7wEIKUgY4C2z0Wic1pD
l5OY61QzwZWmHvdWSy/N1TPn7okLNeBsC0B2BUo2PIksmDSMn0Df3A8BZoNYhnPU
bRZG65DfBBs18IMZ34HkceQZNKs8tJsnDo4HDHunIyl5arF/Hx2dllQuyWECdszA
q6b9UlsaHQcu1Y8nClaxccS1raNj5A==
=vYb3
-----END PGP SIGNATURE-----

--PqAWuXfFyEony8zJ--
