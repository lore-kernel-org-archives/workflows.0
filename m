Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46CC33E1;
	Thu, 26 Dec 2024 22:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252380; cv=none; b=EzaRKKB1wIcSnN7v+2L1eC2GsnvigvhJJxrj0uhuFPzT+PbKlQETePAVDO5YIusvxTy+c2mLqTMKT7oSWLekfALIMuiFZ2ddAgafEU6AQPX9CpFiWk6lpGEnn4B3YT8RFphcAQWlM179IKKNIksoBodGZjtKb74nABdkkE35AtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252380; c=relaxed/simple;
	bh=+KRJ6ggsiHBBNdMf5jL0TMjAeSd0qJHM9bQV9fbSBhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbmCbM6Qw/MCh8txpFtIzll6atNotPwMSz0CWvW+V+PQE81uxiFrzFyGsiTfL4idMAp5hDUKKObSKMAz0O4mnkGScYXqnndvo2JwvDq5y4XzVzTjlqwPJc+fmEpZZYhJe0+jo3l+xyaP7BrdZUWSWSNFmxaZN9Mgc67cVxpnp7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTh/PM0F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTh/PM0F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED3CC4CED1;
	Thu, 26 Dec 2024 22:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252379;
	bh=+KRJ6ggsiHBBNdMf5jL0TMjAeSd0qJHM9bQV9fbSBhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OTh/PM0FKVpRko1GQqPU1PXO0v4I6UgFPYGyFqtRm7r9nVEpQuIw5DfB5S1BICI75
	 nZV3dlZGmHBm8HrXqlVAAQe8KFrNLciGAExiaKTmVCuWMvviPqNXS53RAN2XHyquWC
	 5Rp3VjnZR/jtL7VyOBgQ8TtnZo9jZOJXXljLTol45ftRz94ENd7HjKlR2irAJZFODx
	 sTwbTsR8vB8uTn3kzoatHWK150fyMLlrjrt+XQqdeP7x0pikDP7BHG/3ezJ35srlvi
	 mmZeLyG9X3RoAoycsuEAEHDk8UBDhhfTm1TBllY9MlDQ2uU6A9gpBc+oRZWJnCQVMx
	 9wLYgMGMjaSBw==
Date: Thu, 26 Dec 2024 17:32:57 -0500
From: Sasha Levin <sashal@kernel.org>
To: torvalds@linux-foundation.org
Cc: apw@canonical.com, conor@kernel.org, corbet@lwn.net,
	dwaipayanray1@gmail.com, geert+renesas@glider.be, gitster@pobox.com,
	horms@kernel.org, joe@perches.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@leemhuis.info,
	lukas.bulwahn@gmail.com, miguel.ojeda.sandonis@gmail.com,
	niklas.soderlund@corigine.com, willy@infradead.org,
	workflows@vger.kernel.org, kees@kernel.org
Subject: Re: [PATCH] git-disambiguate: disambiguate shorthand git ids
Message-ID: <Z23ZmVwgS2ErX-dj@lappy>
References: <20241226220555.3540872-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241226220555.3540872-1-sashal@kernel.org>

On Thu, Dec 26, 2024 at 05:05:55PM -0500, Sasha Levin wrote:
>This also allows users to use shorter commit ID prefixes than normally
>required, since we can correctly identify the intended commit using the
>subject line as additional context.

With this script, and a git alias:

	git config --global alias.klog '!sh -c '"'"'last=""; next_to_last=""; args=""; for arg in "$@"; do [ -n "$next_to_last" ] && args="$args $next_to_last"; next_to_last="$last"; last="$arg"; done; hash=$(git-disambiguate.sh "$next_to_last" "$last") && git log $args "$hash"'"'"' -'

We can have (git-log compatible) git-klog find the right commit for us:

	$ git klog --oneline -1 cff8 '("net: phy: avoid ... *_led_polarity_set()")'
	cff865c70071 net: phy: avoid undefined behavior in *_led_polarity_set()

Which means that folks should be able to use a fairly short abbreviated
commit IDs in messages, specially for commits with a long subject line.

-- 
Thanks,
Sasha
