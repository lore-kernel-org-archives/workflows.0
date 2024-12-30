Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1CDEAD0;
	Mon, 30 Dec 2024 18:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735584221; cv=none; b=NumVuAFdyv7ubPRnNuC7SYuFrSVgAyyhNM+yQA58JeKDmK9ev22g4DtugwFl2CJN+h8pBmWKvdmtx85lpmxbTbOeGzFbSyxYFXS/LE69cWWyIgfGIb7dJEnD2PEGLv01Pjx6NiQNddv/T2ddy9OUzRwKdaPiUIW3OnGVs55XwPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735584221; c=relaxed/simple;
	bh=Are0vYEs7wt/pMB5GHUqTxitsZRF+9fSy3nbp6/VI6A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FRUnhSifK8dIscOLX3g57TIKm1ONMzVF2ZdoOudU6bAyiU+LF8sORRJY+ENAsELaNDBHdKStth7lymA651CX/o/eMdYpLGjUo5J6t7l928oqunor2gwmkJy4+z38KetNLP/O+qoMEgoOLn5d99PlKFCcplgk986lRwROmuXTiZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=flnJP/SD; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="flnJP/SD"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CA833404EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1735584219; bh=VgeiIkZFH7IwsgLy59oFNWjYw6Iz4wAMcSAfEkw8z/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=flnJP/SDqVmvCvN5NB7Td5fuLKxbre9fJRcOpQuayWKfPYlqOS5fJyRjdx35Cbi4o
	 YHeBA0zKWWmbYTBoMyfRCxHLxTQW9ZX4OJKdY4EiVdW5H+fGT8r7ZANfH6xXPsuJjv
	 x5KaVsOgpnD2hhrZ5DFIkQL/Ka+SVAggFNtqkN+8r+/Ka2DFWfIXkE4Hj7r9/FL31E
	 6f6Ru7gOoesBijYh96xkGLnWrd0ACZRFgwSVVUcyr1ApEZbBWJ7JpysXvsP8rPS3p/
	 gTLYTavH5MT0HEzCENBTA9KYxc44KOG19bQSWceu0ktHeFCLpNB0HTd1Y+lvwQbPws
	 bX+i30qrNZfYg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CA833404EF;
	Mon, 30 Dec 2024 18:43:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe
 Perches <joe@perches.com>, Thorsten Leemhuis <linux@leemhuis.info>, Andy
 Whitcroft <apw@canonical.com>, Niklas =?utf-8?Q?S=C3=B6derlund?=
 <niklas.soderlund@corigine.com>, Simon Horman <horms@kernel.org>, Conor
 Dooley <conor@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Junio C Hamano <gitster@pobox.com>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert
 Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 1/2] Align git commit ID abbreviation guidelines and
 checks
In-Reply-To: <1c244040bf6ce304656e31036e5178b4b9dfb719.1733421037.git.geert+renesas@glider.be>
References: <cover.1733421037.git.geert+renesas@glider.be>
 <1c244040bf6ce304656e31036e5178b4b9dfb719.1733421037.git.geert+renesas@glider.be>
Date: Mon, 30 Dec 2024 11:43:37 -0700
Message-ID: <87msgd106e.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> The guidelines for git commit ID abbreviation are inconsistent: some
> places state to use 12 characters exactly, while other places recommend
> 12 characters or more.  The same issue is present in the checkpatch.pl
> script.
>
> E.g. Documentation/dev-tools/checkpatch.rst says:
>
>   **GIT_COMMIT_ID**
>     The proper way to reference a commit id is:
>     commit <12+ chars of sha1> ("<title line>")
>
> However, scripts/checkpatch.pl has two different checks: one warning
> check accepting 12 characters exactly:
>
>     # Check Fixes: styles is correct
>     Please use correct Fixes: style 'Fixes: <12 chars of sha1> (\"<title line>\")'
>
> and a second error check accepting 12-40 characters:
>
>     # Check for git id commit length and improperly formed commit descriptions
>     # A correctly formed commit description is:
>     #    commit <SHA-1 hash length 12+ chars> ("Complete commit subject")
>     Please use git commit description style 'commit <12+ chars of sha1>
>
> Hence patches containing commit IDs with more than 12 characters are
> flagged by checkpatch, and sometimes rejected by maintainers or
> reviewers.  This is becoming more important with the growth of the
> repository, as git may decide to use more characters in case of local
> conflicts.
>
> Fix this by settling on at least 12 characters, in both the
> documentation and in the checkpatch.pl script.
>
> Fixes: bd17e036b495bebb ("checkpatch: warn for non-standard fixes tag style")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Rebase on top of commit 2f07b652384969f5 ("checkpatch: always parse
>     orig_commit in fixes tag") in v6.13-rc1,
>   - Update documentation, too.
> ---
>  Documentation/process/maintainer-tip.rst     | 2 +-
>  Documentation/process/submitting-patches.rst | 8 ++++----
>  scripts/checkpatch.pl                        | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)

So, while the other patch in this series raised some eyebrows, nobody
has complained about this one.  Consistency and clarity are good, so
I've applied this one, thanks.

jon
