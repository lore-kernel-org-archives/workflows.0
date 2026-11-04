Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759506;
	b=4vk3DMK6XzcVT7LzxJ3demLOQZuOY39KoDyIjyBNZyGiyFfScf6GVYT2uorZscxMv0Zw
	 cw9lZHWpquKQ5EiDTJI1OUSAY4vPgqu4tcMeEVY8WyQqPkRSuW6TNeS0QDy25NQOmhozi
	 D/POXfOuhWYojjlg0BVxOI6wvEVb+9/H/pUFpxEcI7k9HNmBP4OAB1RkJ087o+woPmB5U
	 fAYXTkg2A7noPKfZ7Eqfx9UzPPyGr1YjVOPPVt9W6iiOEJZj30/aK1Tjwkukl42rP32kN
	 MKN/X7JenxLASOhv3Hq1mFLvCLUferO8EbAil6oZ6xpf3iTbGmVbf2k3nXSzjXTRGVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759506;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KpIailOT6zTz1ZDOWVRUyepJuCxKy7Kcrt65ylPjS+s=;
	b=UuglTHDS7MxgBaOq74jApRtXg96ODO0F5w75k9ZPzB2ago5VRQUOb2vppZA+u381FpR0
	 hQELhswdJxwGbcyu9BJJuXhzKwvWuXqGkWXsGdrGfxVkH8ELEI7TaOla4EcRs9Q9fZl3D
	 zJQuG65K81/3hLxs26dqGuogmZO5OfzzXd7UCuyNFMRAZ+kaFp2nptdSTvSeHfe6uN4vf
	 hmwzBv5fJvY+QXurXvDCa9v1bQM4QjgtiIYjGkbdGIxrxLOwg8qK0SoRAzv5BvzYR2BqG
	 RdMlTz0IKPT13VZTQkQ9pzGT0DGkVmK+Q1X16Rdut0WgxPYifLLzgrYS7f46I0Qcpig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=jgwYbQXA;
	arc=none smtp.remote-ip=95.215.58.166
Received: from mta1.migadu.com (out-166.mta1.migadu.com [95.215.58.166])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1A8606A331
	for <workflows@vger.kernel.org>; Wed,  4 Nov 2026 02:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A1A8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=jgwYbQXA
X-Envelope-To: workflows@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KW0TeR7Ixk8cNAO1ivyvwa7MNW21jOj+tAZvidZp44c=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793759501; v=1; x=1794364301;
 b=jgwYbQXAXLbxmOSrpOepTXcYjyFyPffS7XkQBHtiqK90teaF++xFyFm5ed1iNC6u4w0aOdZQ
 y+heNAds2YjbfPXy3LLs/1RruLkFFcBe5ed3ACyCmmiBht1agzUHxptjYNi1Fo/k72rBPq5hQ4b
 JifbHDl7c8lLP4SpRBB0x3hUjdODVnBG4NWW7C8YusBHc9aKSPdSPaE8ffzPROcpfW/uzi77Lfx
 auCINhuJF5yqfnQio/uhPVNZoWDvubGB38+cakutUiqvESJghqbSvY4f+hPk3CYs6Gscw6pdSSX
 ZpRtj5vZJVU0zinTxPf9dwB0gqAsg8EwS6sT0TAXnBRxQ==
X-Envelope-To: workflows@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 36fd9caadc958bcc;
	Wed, 04 Nov 2026 02:31:41 +0000
X-Mizu-Trace-ID: 36fd9caadc958bcc
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 10:31:33 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Weijie Yuan <kernel@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: use git switch to create
 branches
Message-ID: <auqZBQbcfn7mMRIN@wyuan.org>
References: <ardqGdjnd7kC1B-E@wyuan.org>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ardqGdjnd7kC1B-E@wyuan.org>

Weijie Yuan <kernel@wyuan.org> writes:

> From: Weijie Yuan <wy@wyuan.org>
> 
> Git has been promoting "git switch" since git.git commit 328c6cb853d7
> (doc: promote "git switch"), and the command is no longer experimental
> as of Git 2.51.0.
> 
> Suggested-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
> Signed-off-by: Weijie Yuan <wy@wyuan.org>
> ---
>  Documentation/process/submitting-patches.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 4c28a239e8cb..63a5550bd490 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -866,7 +866,7 @@ automatically include the base tree information in your submission by
>  using the ``--base`` flag. The easiest and most convenient way to use
>  this option is with topical branches::
>  
> -    $ git checkout -t -b my-topical-branch master
> +    $ git switch -t -c my-topical-branch master
>      Branch 'my-topical-branch' set up to track local branch 'master'.
>      Switched to a new branch 'my-topical-branch'
>  
> @@ -882,7 +882,7 @@ notice that it will have the ``base-commit:`` trailer at the very
>  bottom, which provides the reviewer and the CI tools enough information
>  to properly perform ``git am`` without worrying about conflicts::
>  
> -    $ git checkout -b patch-review [base-commit-id]
> +    $ git switch -c patch-review [base-commit-id]
>      Switched to a new branch 'patch-review'
>      $ git am patches.mbox
>      Applying: First Commit
> -- 
> 2.55.0.1055.g20c0e7c0fb.dirty

Junio's <xmqqwlqt4lwj.fsf@gitster.g> reminds me of this patch.  It seems
to have got lost in the flood of patches.  Any feedback would be much
appreciated, while this is only a minor cleanup. :-)

Thanks.
