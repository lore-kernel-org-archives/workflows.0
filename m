Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8602D7BF;
	Mon,  6 Apr 2026 19:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503352; cv=none; b=AtrOrB7FDSLFIN4BDVCSU5M4QZ7PX0ULnFqXJyzrFTUkZAZfEU7AOOWZWZrnv5XE1xVFlgefn0PLy6xbX/lDI3zavhIVj0CAC+BmWuHJ/YHs+KPFbwAR+QqPyg8w88pE53UEoJ7StvVT/ZxW6OVhcf/GiX3Y44vFdfmhwluKgzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503352; c=relaxed/simple;
	bh=S6KONb2vrH9UsMs6qAXjrfZbIM+QSl5j8cMNagy0i44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhO0Pz1lfCqR5hTizAYxvSjJM+ffaGRjhhX3zvT5pPN7Zfn5f8jJ2L9VBEM2X6y0cr31iyPsOWj09kw94JDhvCxQNzZIa37yruqHe4jKbX8XPzdcP2lakHmyXlEvu2RyO3wkWzKQq6tbbOn48fj9Z85Fq3q7I/TyFSeKMgmxUFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kh1eA99M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kh1eA99M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9D7C4CEF7;
	Mon,  6 Apr 2026 19:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775503352;
	bh=S6KONb2vrH9UsMs6qAXjrfZbIM+QSl5j8cMNagy0i44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kh1eA99MAAySQAccv9XXC1W7Q8LaF940pecKWbhb20VjQqtI0CvWogYeD+EQp8LBD
	 sPzwN4jX7p0T+l2yS07fHqNrpf4FxyX+lAszhE59JGJAB/ZmanaYiZ6gwA8Fj3Nqz2
	 R60oGYHH3C9MPk2lMI4Ob8/m0fw6/jcSK03whFO3zUKW8BwUE1TWIgEET3FeLfvWmg
	 ZpwbXmSTaWUZsLR3JgU+aeNqnEubt/NUS/3MYmrksvBpgdTBXoinbBslwC13e3Kjxq
	 sM4Dp48PmjNQ1RPqhkUsSqDRbTOMB7rNrJ9SXQNqzeWiZykxHHzPqUAbr6w8tkJPK0
	 7whsDeppY0JGQ==
Date: Mon, 6 Apr 2026 15:22:30 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, joe@perches.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, apw@canonical.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] checkpatch: add --json output mode
Message-ID: <20260406-futuristic-lilac-gerbil-6ef4a5@lemur>
References: <20260406170039.4034716-1-sashal@kernel.org>
 <20260406-true-whippet-of-luck-d3c2ba@lemur>
 <adQF8LoUf4YH7F98@laps>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adQF8LoUf4YH7F98@laps>

On Mon, Apr 06, 2026 at 03:13:52PM -0400, Sasha Levin wrote:
> > I see that it's writing json out manually, implementing its own escaping.
> > While there are upsides to not requiring a perl json library, I think it's
> > fair to expect that people who would want to get json output can probably make
> > sure that JSON::XS is installed.
> > 
> > Not a strong object, but seems cleaner that way.
> 
> No objection here, but from what I saw the checkpatch code only uses core perl
> packages so I wanted to keep it that way.

I saw that, too, but I think that stems from the expectation that we need to
make it easy to run checkpatch by any random person submitting patches, which
is why, by default, we'll output human-readable results.

JSON output, on the other hand, is mostly useful for specific setups that have
a lot more control over their environment and we don't have to stick to the
"pure perl only" guideline here.

Generating correct json is an exercise in corner cases, which is why I'd
rather this is done with a library that has addressed most of them already.

Regards,
-- 
KR
