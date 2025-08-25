Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E675072627;
	Mon, 25 Aug 2025 05:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756098640; cv=none; b=EOWbHM1Ad5W9YhWbCaylJ29A73djH0QboBRJeW2trhgO4UmU+4DS1ttPNHb7KZAxoalx2SDNbJygqVa2MiW7zwDmF0BOs5kgd5p5mOTmoiWrjMkPQi5GOfrNKwy9b+9CS+lZklR4a/Vwg2GmniHPwcrFW5y67xDIqjCpbeLm+hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756098640; c=relaxed/simple;
	bh=Lsjhk9T8cV4gVBBVBD2lz4ttT3/LoiUhIZ0SJIr4vms=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ba5xeSuU9taR+spM4N1neJ8O2xsROu+EBAyUWwdgHk+ZXDIc4Txq/JhDiiD1KmXDN1rkWbfn4JHDG08iv3BuZzSJeBqGhXKgpm3OZCUBlwLIvj23Nh9hvQ+RuYa5cU5BMxSzB8/gsc9XDjw6uyCF2uuO0WmiLf93o+khZ0nAtPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sQ18hcSe; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sQ18hcSe"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1826240ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756098631; bh=6Sw1yYW0zL/72spSU8wSWHNj3CwEXvMx5At3t1+a5Ro=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sQ18hcSerCi8U2UeVULKFv17OKMcGVrFlEjVfc4+YsYQTQ23MMIedPF8smvXYKGsB
	 k5hDMSKRN7I48JRmjXUQzCGNx9UdYpOep169rJGVN/TfyLBUZkBm3VXypedDxc5xBc
	 yqS70rmWTfHJ+1E8zKgAKt3x3Ohv4+cNbb/b31wP0folQlL5t6RAklct67/mCQ5tgX
	 faa0Qf4K3ZJ7SKXgxFgmiUTzllZYUQxSZERKNMR9wgHiUlhOu9m+6jmzCpAU+S8+N2
	 WvPEziMZ0pcfIQM03lDgMtBE1vT2y7qQwK6DeemmvTct4b6fTsSe1SuZsvU1RvCerP
	 9Wc9WuGrmhZig==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1826240ADA;
	Mon, 25 Aug 2025 05:10:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: I Viswanath <viswanathiyyappan@gmail.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, I
 Viswanath <viswanathiyyappan@gmail.com>
Subject: Re: [PATCH] Documentation: process: Fix grammar errors in
 management-style.rst
In-Reply-To: <20250824185015.6312-1-viswanathiyyappan@gmail.com>
References: <20250824185015.6312-1-viswanathiyyappan@gmail.com>
Date: Sun, 24 Aug 2025 23:10:29 -0600
Message-ID: <87y0r8c7ga.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

I Viswanath <viswanathiyyappan@gmail.com> writes:

> Fix various grammatical errors in management-style.rst
>
> Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>

Thank you for working to improve our documentation...I don't think I can
apply this patch, though.

Your signoff should include your full name, please.

But more importantly...

> ---
>  Documentation/process/management-style.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/process/management-style.rst b/Documentation/process/management-style.rst
> index dfbc69bf49d4..4ae05a89950a 100644
> --- a/Documentation/process/management-style.rst
> +++ b/Documentation/process/management-style.rst
> @@ -15,8 +15,8 @@ to do with reality.  It started as a lark, but that doesn't mean that it
>  might not actually be true. You'll have to decide for yourself.
>  
>  Btw, when talking about "kernel manager", it's all about the technical
> -lead persons, not the people who do traditional management inside
> -companies.  If you sign purchase orders or you have any clue about the
> +leads, not those who do traditional management inside
> +companies.  If you sign purchase orders or have any clue about the

This change is OK, but what was there was OK too

>  budget of your group, you're almost certainly not a kernel manager.
>  These suggestions may or may not apply to you.
>  
> @@ -42,9 +42,9 @@ actually true.
>  The name of the game is to **avoid** having to make a decision.  In
>  particular, if somebody tells you "choose (a) or (b), we really need you
>  to decide on this", you're in trouble as a manager.  The people you
> -manage had better know the details better than you, so if they come to
> +manage better know the details better than you; if they come to

This one changes the meaning of the sentence

>  you for a technical decision, you're screwed.  You're clearly not
> -competent to make that decision for them.
> +competent enough to make that decision for them.

...and this one was fine as it was.

>  (Corollary:if the people you manage don't know the details better than
>  you, you're also screwed, although for a totally different reason.
> -- 

In general, this kind of playing with the wording for text that is not
actually wrong is not hugely helpful; I would encourage you to look
elsewhere for places to contribute to the documentation.

Thanks,

jon
