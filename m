Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456142;
	b=eU9ZPeNtN1SrmQTCyJsxNGCjL4/ibNJh+Jc5y7kEaPUCbHb37Six48zmnpOVArHYq3Ho
	 csan3FsR2FhfNWG4SmIy7RtXr7XFgL/jYoYqeJK4FQ10+ULDOG6B/OVeK1F8ayBqUwgFS
	 7YDc9DrrKLRqxG9tq2cvdsKZXUr4OwQIHJEwbVd73uHiykIuaeR8Ki5C2/xT1nlXx1hVl
	 rGJ1s21vw0ToVUzMoepWhOCj04Np6P1Kv0cYocPf6KYqiNIhcgU3kUrxrqMS8Dq9A0QgY
	 z2wo5U+g08vn4+IwVpjXqS9zKlHZgNrt67WfOZ53YDb8KlXVgqFHwPP2hugsUfbmhFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456142;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=aLmnnnAOGo4iOMHkgiEOkhD4uv93DlGUvs9MnxD+3v4=;
	b=p6P5X6yv0/uaT/zZUvsa+2rv2IdA/qQLQDA78yKVinI66+G2EFi9k3moQZUiAnMbORKc
	 nixJEkAb9TdVFDSr+1PvTey5bbJQooLBHz8GCnlwcv+kTelK8h3M6+2z5giwbZN1JMC+P
	 OKs8CtojymRt6/kpMx6kwhHPtXD+bPrjXMbKCuIdyVF04zkLo/eQqiiDneX1dftptKuQi
	 hL6OnEVpI9NABjjbz+525U2Dv22ycDiJV8E+IMGiiHGWUaK+27KJgHMnCW9sMbIv18cZg
	 a+LRs8BR0hTyLhYBpEopt704tSQZ4bvp91lH9RbPaKxfNQDDiYnZE1yUOIMaTSiFn9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tK0GtuXy;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589EB606A31E;
	Mon, 23 Nov 2026 17:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 589EB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tK0GtuXy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=aLmnnnAOGo4iOMHkgiEOkhD4uv93DlGUvs9MnxD+3v4=; b=tK0GtuXycY+DyBoFUzL3aU2hVT
	eNdHtTVHLCYOfZ9UANmYJFwT8hDWm0U29nwfwPlKm7FC7UO+PgzQuRut6IwfpxVSmWxgMTw5Bb52c
	FiGZTKo4bdqFR/u1xwbJZe53tSGQPlZEVpdRJmBxTbvRHNx9PR8hrYF3x0ob5Cz9kPDl8Fk9ngKDe
	LeIWsw/fhR4Ed2szotcOEN+/5kjHBrI2dUKwXaM49ww7X1hHL95Kbh4NiEquopL4BIRecLkr1QyxJ
	UVWQ/uSjgzlCjV7tkb+qWjt7vexO/xaQm+Xo5rGtuzFSPLD4LRZKe9QNcKu58a2Qvo3AmQZc2dHqj
	bMVcU5NQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYA1-00000004QG3-24fa;
	Mon, 23 Nov 2026 17:49:01 +0000
Message-ID: <1968cf9c-59d1-488b-8fb2-077f420f600f@infradead.org>
Date: Mon, 23 Nov 2026 09:49:01 -0800
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: submitting-patches: use :ref: links and remove
 unused anchor
To: Zenghui Yu <zenghui.yu@linux.dev>, linux-doc@vger.kernel.org,
 workflows@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org
References: <20261121163923.73026-1-zenghui.yu@linux.dev>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261121163923.73026-1-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/21/26 8:39 AM, Zenghui Yu wrote:
> Convert three plain-text references to the "Tagging people requires
> permission" section into proper :ref: links using the existing
> tagging_people anchor. Remove the explicit_in_reply_to anchor, which is not
> referenced anywhere.
> 
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/process/submitting-patches.rst | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index f271d7413f72..7126f25e2ac4 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -496,8 +496,9 @@ If a person has had the opportunity to comment on a patch, but has not
>  provided such comments, you may optionally add a ``Cc:`` tag to the patch.
>  This tag documents that potentially interested parties have been included in
>  the discussion. Note, this is one of only three tags you might be able to use
> -without explicit permission of the person named (see 'Tagging people requires
> -permission' below for details).
> +without explicit permission of the person named (see
> +:ref:`Tagging people requires permission <tagging_people>` below for
> +details).
>  
>  Co-developed-by: states that the patch was co-created by multiple developers;
>  it is used to give attribution to co-authors (in addition to the author
> @@ -545,7 +546,8 @@ followed by a Closes: tag pointing to the report, unless the report is not
>  available on the web. The Link: tag can be used instead of Closes: if the patch
>  fixes a part of the issue(s) being reported. Note, the Reported-by tag is one
>  of only three tags you might be able to use without explicit permission of the
> -person named (see 'Tagging people requires permission' below for details).
> +person named (see :ref:`Tagging people requires permission <tagging_people>`
> +below for details).
>  
>  A Tested-by: tag indicates that the patch has been successfully tested (in
>  some environment) by the person named.  This tag informs maintainers that
> @@ -598,8 +600,9 @@ A Suggested-by: tag indicates that the patch idea is suggested by the person
>  named and ensures credit to the person for the idea: if we diligently credit
>  our idea reporters, they will, hopefully, be inspired to help us again in the
>  future. Note, this is one of only three tags you might be able to use without
> -explicit permission of the person named (see 'Tagging people requires
> -permission' below for details).
> +explicit permission of the person named (see
> +:ref:`Tagging people requires permission <tagging_people>` below for
> +details).
>  
>  A Fixes: tag indicates that the patch fixes a bug in a previous commit. It
>  is used to make it easy to determine where an issue originated, which can help
> @@ -822,8 +825,6 @@ lore.kernel.org archive link) is recommended to help reviewers::
>  See more details on the proper patch format in the following
>  references.
>  
> -.. _explicit_in_reply_to:
> -
>  Explicit In-Reply-To headers
>  ----------------------------
>  

-- 
~Randy
