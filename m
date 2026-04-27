Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3AF2FFDE1;
	Mon, 27 Apr 2026 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777283501; cv=none; b=slrsSUX4oWYZ9k2b46HYIKRFF9VnQOuRZCCJC92awWu3j5z4N2QNaxyhhPEqE8g5Tpc7IiaM3eOesLCUu72CT+Bf7B0g7Bc6wp6kO2ZenI0qd8JTvqoyTrJzgs5tffzeu02HM6Ql1VsKKtqrBndwKDWUpuokZEo1JYWEdjDAdAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777283501; c=relaxed/simple;
	bh=Kj6PQx4RerOpWgc0G4nt/I29ZZ1s0Mnhgll4A9+2ZFM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cZsq+m6x/irLaf49jO2mn/Ou3jWGhEbuGnsx+uQZcphc9eHq9Pi/+Rmc+x0aE5TN5cxJ25XaU5JHXpG5tUwFmcdL9M+EjirRgtCkRXHqDOELZmUlMNG0u/AxxWH3dWjQaasEkkVFxS3KDqtBcI6dbkzA8IbpNahsrQCmchoMM3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=dJ5FQ6tW; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="dJ5FQ6tW"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D2FA542B3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777283499; bh=U24W61a/YNqgXNzTblTVizxNJMBlhwv2QrqYIkMe9VQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dJ5FQ6tWKgyAF6jjFtQ4OOOm4xXHPG9W6DpztzKlFulKnALB/vCJHqDaL6vYOEa6v
	 KoKEFzsJSm7fiDeXLA/0jqRZEEcgAKJyCz9IS1R0WDpTtWhOxYUWVq8oHMPHj9JgVw
	 UY/kP8z82suf68ewf3WON44ZRJ9WhRXgLd/pkLo9kjZvCLpIPjujNSmyk4jPAAQSSR
	 xUdmlsL8Z3tED1QPpjrTep5ax5O7hR77R+9QHlYUMBR7GTKUkd28hlevSrtwoxqRbz
	 3ThM6Sn+HELH9tMzOURezCwLo5TXZts0lYuNWDdudpymU47qsa1WQlE1hl43GbOnfK
	 EuxaekXVzq/cg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D2FA542B3D;
	Mon, 27 Apr 2026 09:51:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, Kees Cook
 <kees@kernel.org>, linux-kernel@vger.kernel.org
Cc: workflows@vger.kernel.org, linux-mm@kvack.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [PATCH v3 3/3] Documentation: deprecated.rst: kmalloc-family:
 mark argument as optional
In-Reply-To: <20260424175740.258522-2-manuelebner@mailbox.org>
References: <20260424174743.257951-2-manuelebner@mailbox.org>
 <20260424175740.258522-2-manuelebner@mailbox.org>
Date: Mon, 27 Apr 2026 03:51:35 -0600
Message-ID: <871pg0ras8.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> put the optional argument (gfp) in square brackets
> add whitespace for readability
>
> eg. ptr = kmalloc_obj(*ptr, gfp);
>  -> ptr = kmalloc_obj(*ptr [, gfp] );
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/process/deprecated.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index fed56864d036..b431993fd08e 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -392,12 +392,12 @@ allocations. For example, these open coded assignments::
>  
>  become, respectively::
>  
> -	ptr = kmalloc_obj(*ptr, gfp);
> -	ptr = kzalloc_obj(*ptr, gfp);
> -	ptr = kmalloc_objs(*ptr, count, gfp);
> -	ptr = kzalloc_objs(*ptr, count, gfp);
> -	ptr = kmalloc_flex(*ptr, flex_member, count, gfp);
> -	__auto_type ptr = kmalloc_obj(struct foo, gfp);
> +	ptr = kmalloc_obj(*ptr [, gfp] );
> +	ptr = kzalloc_obj(*ptr [, gfp] );
> +	ptr = kmalloc_objs(*ptr, count [, gfp] );
> +	ptr = kzalloc_objs(*ptr, count [, gfp] );
> +	ptr = kmalloc_flex(*ptr, flex_member, count [, gfp] );
> +	__auto_type ptr = kmalloc_obj(struct foo [, gfp] );
>  

Marking the GFP argument as optional is fine, but the documentation
should surely say what the default is.

There are, of course, other kmalloc()-related entries in that file that
could use an update, but that is a job for another time, I guess.

Thanks,

jon
