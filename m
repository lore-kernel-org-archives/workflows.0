Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935082D9ECB;
	Mon,  1 Jun 2026 18:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339860; cv=none; b=cCtYKnY9e5aZanGSrClwC3X0SHpyxDouuS6ljGERGZfKeBojkyX5AGj+KLCNWEe8PehGteFVbN9YTvo8ucP7razGO6TYIX4sdowtiqL7v3DgUT9cnD0NNxiD0jvErq3Xy2Y4pbseuvDbLnsHlIWzTDO9h5Wv6JHaB3YU4A0PNpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339860; c=relaxed/simple;
	bh=sjhMWLY2X66jnkBpJNbsKMlSNOyMgDfLFmXx+GoclsU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cIPuunt8ZdUppuVVvpXkB8FDU7wM+s5X/ASssysYQ9JbRAd4ZHcLOJr/u17SrS/QbPJoPZ8yihzrhYjzHUdPBJsxG1MwpdPFKegTmcivQYIFU7VJI2yrgRHt9n09V6oAWmY0zywO4A3X0gpnkijemYeg66rpGV3MQZpsvPiD4bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KfZ+S+kH; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KfZ+S+kH"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 232C540E49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780339859; bh=WkUfDl5bKWbgs3ZFEXav/OdjRJMGss+XTylmXnNWa0Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KfZ+S+kH3M3e3st+61r1DfEoC4GRjq2sAuBKpL2GzQOOXjK7E/gFbzisFKtsQBJkk
	 O6gW9Qi8o2XsULJvvaMbmRh0U5wVVW1eYkpGS1y5rh+5E7yPCL/GSfqcNoTo7X492o
	 fbtnX3V1piSJxjWgKBqi1nyES/FNZBDoxdJbFSxSmBlYrRQRdsArBKbI9Umea7/SrP
	 GSQoSzwmwKhE3kQTJnTUI/xiRXoVYs8JEeDOXcNeTl7mIHSHQN819jHq/4gupIgVji
	 zKVe8UUMAxJw0gB1Gg9J7v4YUfST0RCfpnwRhD63MIYRoxtsBtECTMoYbB0soDtdSD
	 KxqnxTHDALVyA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 232C540E49;
	Mon,  1 Jun 2026 18:50:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Zhan Xusheng
 <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH] docs: changes.rst: restore pahole 1.26 minimum
 (regressed by sort)
In-Reply-To: <20260526022033.1301884-1-zhanxusheng@xiaomi.com>
References: <20260526022033.1301884-1-zhanxusheng@xiaomi.com>
Date: Mon, 01 Jun 2026 12:50:58 -0600
Message-ID: <87bjdu9jsd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Zhan Xusheng <zhanxusheng1024@gmail.com> writes:

> Commit 9edd04c4189e ("docs: Raise minimum pahole version to 1.26 for
> KF_IMPLICIT_ARGS kfuncs") raised the minimum required pahole version
> from 1.22 to 1.26 in the requirements table and added a paragraph
> explaining the failure mode for distributions still shipping pahole
> v1.25 (e.g. Ubuntu 24.04 LTS).
>
> The next day, commit ece7e57afd51 ("docs: changes.rst and ver_linux:
> sort the lists") came through a different tree (docs vs sched_ext) and
> re-flowed the table alphabetically, but its base did not include
> 9edd04c4189e.  When the two commits met in mainline, the textual rewrite
> of the table won and the version bump was lost.  The added "Since Linux
> 7.0..." paragraph also disappeared.
>
> The result is that changes.rst on master (v7.1-rc5) lists pahole 1.22
> again, even though sched_ext kfuncs annotated with KF_IMPLICIT_ARGS
> genuinely require v1.26 to produce a correct vmlinux BTF.  Users on
> distributions with pahole v1.25 hit "func_proto incompatible with
> vmlinux" when loading any sched_ext BPF program (scx_simple,
> scx_qmap, ...) and have no documentation pointing them at the version
> gap.
>
> Restore both changes from 9edd04c4189e.
>
> Fixes: ece7e57afd51 ("docs: changes.rst and ver_linux: sort the lists")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>  Documentation/process/changes.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Oops, that is not good.  Thanks for catching that; fix applied.

jon
