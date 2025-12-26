Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E26E201113;
	Fri, 26 Dec 2025 02:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766715121; cv=none; b=OfTXtEeIOFGZSVqGE3HaMEMXq7UgOZkEwyAAjAEKNZ5bEkQ46yNV+AYfXQ7NFR6Cn+NsZHVm4ns7YW2ILwI44LnEPnudsKgeGmzdCALmNR/Y4qhQ6H6QNSiQ4TEE1A6iLm+cb3CDldYNIUbgy9TzNPYO+RIBc6fdRCqXh3PtVuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766715121; c=relaxed/simple;
	bh=9hMFuGmi7tZldbPCzp7RCgzyZe+46Fsl35gNR+Ppbsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srz2MalvDdCKoS7rEKDkpCWoXdcOfdGASvaugvtemFq+5QolQlnOgWAZgMauPI0ZATn6Uuy+9oTUJBFw4ZuU6iRTRrX+DwlIzM/GKruSQlFSDZjfssJxeAoq0tpySfA3glzc92lkFvp0D3xn5STst5hwW+6QWVq4H0Hu31d6brc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fml40m5K; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fml40m5K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=eAX4Eb1ytMUluaM0OGHgfcmq3Z0qoQCPoxhCovB94iA=; b=fml40m5K/5ozpQCl7k4I6TqFum
	JzEOXieegjMsjNtunTB601WFLH2QniK4j9feICkXDVyNf7+HDGlnvTSb/8omkEL8Dp/lXVJxAysy4
	Q/Adz5HX/vPMVPEA3bAkhorwfZ4Q0ZbTFusvGBJ5NZs6aV1MOQhqpcz3c5BlOlaiQ8SBMvcleD3GW
	vCPUSUaVgphhwJ/wSZsIGkwIRHpvuG7q1jcUem69C4zALWwXYUz2mQsVlrwHouL3JAKT8tFGOd5f2
	0B9mnSgGxvc8Ml2GRXqCtVWKANuIW0fRKFmNFbIbz4dPcLNSDwLKN/OKlQ+/Gr3TD92uhLECqFYXu
	x8R4fY5g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYxJ4-00000000pAO-2TOc;
	Fri, 26 Dec 2025 02:11:54 +0000
Message-ID: <bc045260-68a9-4c8d-8bfb-94a3921273a3@infradead.org>
Date: Thu, 25 Dec 2025 18:11:53 -0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: process: email-client: add Thunderbird "Toggle
 Line Wrap" extension
To: Vincent Mailhol <mailhol@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sotir Danailov <sndanailov@gmail.com>,
 =?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>,
 Paul McQuade <paulmcquad@gmail.com>, Jan Kiszka <jan.kiszka@web.de>
References: <20251226-docs_thunderbird-toggle-line-wrap-v2-1-aebb8c60025d@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251226-docs_thunderbird-toggle-line-wrap-v2-1-aebb8c60025d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/25/25 3:46 PM, Vincent Mailhol wrote:
> While reading the git-format-patch manpages [1], I discovered the existence
> of the "Toggle Line Wrap" extension for Thunderbird which I found rather
> convenient.
> 
> Looking at the history, the ancestor of this extension was added to the
> documentation in commit e0e34e977a7c ("Documentation/email-clients.txt:
> update Thunderbird docs with wordwrap plugin") but then removed in commit
> f9a0974d3f70 ("Documentation: update thunderbird email client settings").
> 
> Extend the paragraph on Thunderbird's mailnews.wraplength register to
> mention the existence of the "Toggle Line Wrap" extension. The goal is not
> to create a war on what is the best option so make it clear that this is
> just an alternative.
> 
> [1] man git-format-patch -- §Thunderbird
> Link: https://git-scm.com/docs/git-format-patch#_thunderbird
> 
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> Changes in v2:
> 
>   - Use the international URL (remove "fr/")
> 
> Link to v1: https://lore.kernel.org/r/20251225-docs_thunderbird-toggle-line-wrap-v1-1-24794afa4abf@kernel.org
> ---
>  Documentation/process/email-clients.rst | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/email-clients.rst b/Documentation/process/email-clients.rst
> index 84a2450bb6ec..b5377630a648 100644
> --- a/Documentation/process/email-clients.rst
> +++ b/Documentation/process/email-clients.rst
> @@ -324,7 +324,14 @@ To beat some sense out of the internal editor, do this:
>  
>    - Set ``mailnews.send_plaintext_flowed`` to ``false``
>  
> -  - Set ``mailnews.wraplength`` from ``72`` to ``0``
> +  - Set ``mailnews.wraplength`` from ``72`` to ``0`` **or** install the
> +    "Toggle Line Wrap" extension
> +
> +    https://github.com/jan-kiszka/togglelinewrap
> +
> +    https://addons.thunderbird.net/thunderbird/addon/toggle-line-wrap
> +
> +    to control this registry on the fly.
>  
>  - Don't write HTML messages! Go to the main window
>    :menuselection:`Main Menu-->Account Settings-->youracc@server.something-->Composition & Addressing`!
> 
> ---
> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
> change-id: 20251225-docs_thunderbird-toggle-line-wrap-dbe39bcb650b
> 
> Best regards,

-- 
~Randy
