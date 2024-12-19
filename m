Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB51019F13B;
	Thu, 19 Dec 2024 20:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734640538; cv=none; b=hiqH9saUMn45JDwYpxCSUjBPAZLfvHv5g4VoadxZBgQON37xV0SjOZSwCZ3808l5TtJkqhdB6EM+IxkCDkr4x5Vl/h+0bMU2IQZWltGChb5Y1lBqKjqbkG4vn46dwWt77P8p6WJ5Tsx86NeO4k9rm5FkwyfwgLMuM9Lpuu2F+pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734640538; c=relaxed/simple;
	bh=nsChvgsBvN5PC9wB5iyc+9GEU9Dq/vGvGTgheNyhyS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jsHHLXISbYaB5uNKpCNjWGrQByZl82wRo63m6gAZpTcSbV3J6+NKMLa28rCFTvVnuJa7Estbs4XTZ9/0g4ZDnnXVtlmqq7D+yaCNrqQ6Yzg3bmLLJFvsYaLMCF7c9HtCebD5GMKh/gsz26kr8av2dBq1AWzJZf+7AbsrmsFAqSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvRNMeht; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvRNMeht"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DADC4CED0;
	Thu, 19 Dec 2024 20:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734640537;
	bh=nsChvgsBvN5PC9wB5iyc+9GEU9Dq/vGvGTgheNyhyS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dvRNMehtn0Sgs7wNk38il/udSjkYlgaNr7gKA4d1JFXgWr1lwogFsJOJZnD71+8gv
	 E1hsmvjMz5QCXcBAmn/z5WkGz6zUXLGHcsmbrWVS5W7B/VCoUQ9uJ9XQozq7ZcYpy8
	 8l+/NkyEyLqUcR+vbrv8cg33amWkv15rKj+K9FNep6o+B30F7Nry6WhwZpLbVGz/D/
	 bqjbqISwUd3EZDZWi6Jkw/sBDAnlJFo7DhAziZD3tyqLZLV6tyjfpgrNeYnykxv/yS
	 /7XN9d20gxGGVBl/q2y1eJhJa4uW2lRqqqBIO1QgCTm/AyWbt4rQT/SAy8RR9jtokM
	 ZpiHQt62hovqQ==
Date: Thu, 19 Dec 2024 15:35:35 -0500
From: Sasha Levin <sashal@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: torvalds@linux-foundation.org, apw@canonical.com, conor@kernel.org,
	corbet@lwn.net, dwaipayanray1@gmail.com, geert+renesas@glider.be,
	gitster@pobox.com, horms@kernel.org, joe@perches.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@leemhuis.info, lukas.bulwahn@gmail.com,
	miguel.ojeda.sandonis@gmail.com, niklas.soderlund@corigine.com,
	workflows@vger.kernel.org
Subject: Re: [RFC] git-disambiguate: disambiguate shorthand git ids
Message-ID: <Z2SDl423NkL1QCIS@lappy>
References: <CAHk-=wiwAz3UgPOWK3RdGXDnTRHcwVbxpuxCQt_0SoAJC-oGXQ@mail.gmail.com>
 <20241218233613.219345-1-sashal@kernel.org>
 <202412181739.0170E86E58@keescook>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <202412181739.0170E86E58@keescook>

On Wed, Dec 18, 2024 at 05:41:58PM -0800, Kees Cook wrote:
>On Wed, Dec 18, 2024 at 06:36:13PM -0500, Sasha Levin wrote:
>> Sometimes long commit hashes can be ambiguous even when providing
>> several digits from its abbreviation.
>
>For testing, please see:
>https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=dev/collide/v6.13-rc2/12-char
>
>>  scripts/git-disambiguate.sh | 163 ++++++++++++++++++++++++++++++++++++
>
>sfr has a bunch of logic in his "check_fixes" script that we might want
>to consolidate into here. I have an updated copy here:
>https://github.com/kees/kernel-tools/blob/trunk/helpers/check_fixes

Thanks! I'll look into it.

-- 
Thanks,
Sasha
