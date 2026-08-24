Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AA834A76F;
	Mon, 24 Aug 2026 17:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787590940; cv=none; b=AQZHBfqNpuTHCpZ5EPRFFbsMdduwbheUMb7dVVHH2ML7+z6DsM7xOlqmN4USzylzkazYKD8ArjKGGyfhCvLcfY6v/I2FdJ9SEBBQfgzPMDsE+cPp5SPOJkqjJ2DpwRQYZv0NkJOAmg3rOz6EWSxzGjPU33mFfAX3kD0dM0UAJzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787590940; c=relaxed/simple;
	bh=bzVB9F2ZuoUq4pX1rwU4Jq5Ddjr2AnmJmQpxlvTdPCw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LHuDrSH28OBD0/Q8lGn6abTfWd279TQPapPrl3iU3WhZt/cgb+T1GPfQmgrMLrH9fRosuX8F4/hXJJeghxSJnBe/BaxFgGKsr4MpIkPHlyHd239eItBTew5+Clr5KnPvoc1UBd1trMbHjNYHgBp4XE6fqP1VwLoBamuRkr+z8R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=JxIcWQ+J; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="JxIcWQ+J"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7B1A8408F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1787590937; bh=H0ssycFUMOpRKtMOFOI3ylSiakYkGHuMJ52hynUKfrU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JxIcWQ+JgxxZ7rnzAy4i4Lz5T8WlbDJ3GFCQRNh2YcXLCgSZjmjSY6dgM/ozMvYlG
	 H9PCwrSVhFkFThBUL1amZq1JPEgUvbh0Ab56cMelIz2yUhbqd5RtsQBB4k5e1DEUM0
	 c73A5A+lQM7uNIeYKCaUw+jtMk06+WPCvW0VbXXp99ETfpwbLrJPdGC3oot9J6pTxN
	 9gYzxH1l/5YnZPueLdYYi89VTP8W65zaIaJiMYFTdtbj5VdQDtvNiLn2PdQf/UInv8
	 oJ8MVRviwi6lYvue7nSkYONtRn3TW5i5NZqPK1D9F85I7UGvCbdNV33j62oFxYk8RO
	 QQDXJGeizzDUw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7B1A8408F8;
	Mon, 24 Aug 2026 17:02:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Johan Hovold <johan@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Willy Tarreau <w@1wt.eu>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] docs: threat-model: fix /dev/kmsg reference
In-Reply-To: <20260819134039.286793-1-johan@kernel.org>
References: <20260819134039.286793-1-johan@kernel.org>
Date: Mon, 24 Aug 2026 11:02:16 -0600
Message-ID: <8733w3zc2v.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Johan Hovold <johan@kernel.org> writes:

> Fix a '/dev/kmsg' reference which got replaced with '/proc/kmsg' (which
> is not accessible to regular users).
>
> Fixes: a03ef333fbd6 ("Documentation: security-bugs: explain what is and is not a security bug")
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  Documentation/process/threat-model.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/process/threat-model.rst b/Documentation/process/threat-model.rst
> index a68be888ce8e..04e5df6a6f78 100644
> --- a/Documentation/process/threat-model.rst
> +++ b/Documentation/process/threat-model.rst
> @@ -84,7 +84,7 @@ possibilities of user namespaces are not covered in this document.
>  The kernel also offers a lot of troubleshooting and debugging facilities, which
>  can constitute attack vectors when placed in wrong hands. While some of them
>  are designed to be accessible to regular local users with a low risk (e.g.
> -kernel logs via ``/proc/kmsg``), some would expose enough information to
> +kernel logs via ``/dev/kmsg``), some would expose enough information to
>  represent a risk in most places and the decision to expose them is under the

Applied, thanks.

jon
