Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C24822425B;
	Thu, 30 Apr 2026 01:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777511020; cv=none; b=CxBxQvOm16MK7Ssemj4W8xl+tA49QpvTensR0Qk29mZBl1IzrqKPdR+P9XPFP9z+JrVNme5yyhVYnRhlpEFTgYsQLrGdFxpHVfUWIPaisiuLjKFy8CIJO8RyP4ivLIqoUVAXc53Gx1WvUZEDs6IzQ7TvahEo//A7QXhpBF4McaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777511020; c=relaxed/simple;
	bh=6tv8sKnaOedjleOJpNkqRGOfecG2JG8qeIXOpU9VwVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AS4oQWSEqpJPkG7JmNjLJxBi7F7h4GsSsYXfL/Ldkt6bkQOj3AnYvAg9eQgzq06evvp2Qcz3RRuWQx2394e7hB9fjgOBqRKUhEHSDGQaHwrP650SqRdB8bhnKg5lWbeaNimRPkjuNtKeuAahszlW0dS58n4hnQcTC1FNjj8vBjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1h6EGEa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1h6EGEa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD1AC19425;
	Thu, 30 Apr 2026 01:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777511019;
	bh=6tv8sKnaOedjleOJpNkqRGOfecG2JG8qeIXOpU9VwVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B1h6EGEaVDT7ULvhJRLe1vkELBRXpUhhBEnR6orlJ4zVndEeRaZvhYyQS2Y0WNM9a
	 8dsnAFsSXGo5bdA6tHWpsgNaCEn8eROVpTtz7z6O3Hs2OuryAeo32JJpOGTkz6VlOH
	 noEurSGE7vRjLKbbFKWCeVDb9aV3KQqZqM5OWYamlocO2ByLIxQ8AFApUDUY8cWBXl
	 yEvQUxR66573S6eooZTz7/wXY7A/nu96m8GMsBw6oLYWNT7nrBqYEAg7TvXMVXBKjl
	 Q/0dnMCin0uc9pp1L38f9kYPlJQrokXeRiyUCM3jHk95L1HxBm+dUbdEzbA1CrDx52
	 wogvKy9OQQ5oA==
From: SeongJae Park <sj@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: SeongJae Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-mm@kvack.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 3/3] Documentation: deprecated.rst: kmalloc-family: mark argument as optional
Date: Wed, 29 Apr 2026 18:03:32 -0700
Message-ID: <20260430010332.114100-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260429072704.311603-2-manuelebner@mailbox.org>
References: 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 29 Apr 2026 09:27:04 +0200 Manuel Ebner <manuelebner@mailbox.org> wrote:

> put the optional argument (gfp) in square brackets
> add default value = GFP_KERNEL
> 
> eg. ptr = kmalloc_obj(*ptr, gfp);
>  -> ptr = kmalloc_obj(*ptr [, gfp] );
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

I have a trivial question below, but because it is trivial,

Acked-by: SeongJae Park <sj@kernel.org>

> ---
>  Documentation/process/deprecated.rst | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index fed56864d036..ac75b7ecac47 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -392,13 +392,14 @@ allocations. For example, these open coded assignments::
>  
>  become, respectively::
>  
> -	ptr = kmalloc_obj(*ptr, gfp);
> -	ptr = kzalloc_obj(*ptr, gfp);
> -	ptr = kmalloc_objs(*ptr, count, gfp);
> -	ptr = kzalloc_objs(*ptr, count, gfp);
> -	ptr = kmalloc_flex(*ptr, flex_member, count, gfp);
> -	__auto_type ptr = kmalloc_obj(struct foo, gfp);
> -
> +	ptr = kmalloc_obj(*ptr [, gfp] );
> +	ptr = kzalloc_obj(*ptr [, gfp] );
> +	ptr = kmalloc_objs(*ptr, count [, gfp] );
> +	ptr = kzalloc_objs(*ptr, count [, gfp] );
> +	ptr = kmalloc_flex(*ptr, flex_member, count [, gfp] );
> +	__auto_type ptr = kmalloc_obj(struct foo [, gfp] );
> +
> +The argument gfp is optional, the default value is GFP_KERNEL.
>  If `ptr->flex_member` is annotated with __counted_by(), the allocation
>  will automatically fail if `count` is larger than the maximum
>  representable value that can be stored in the counter member associated

Like 'ptr->flex_member' and 'count', why don't you enclose 'gfp' and
'GFP_KERNEL' with backticks ('`')?


Thanks,
SJ

[...]
