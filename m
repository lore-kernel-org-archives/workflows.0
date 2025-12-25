Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF042765FF;
	Thu, 25 Dec 2025 20:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766695300; cv=none; b=rtk1x9l8t7IpUDuz9CATIo56xkmg09pGkG4R4nBaMLhmIjGHWtIKieLyKl1qfhNnvKHsWINd2qRvNPIWoQ1xroX5Y/mS8KmrKVZ5dYEILKSxK2Brh6fWHszPtdiQOe1fzMQhxT/tK5LFlSDHelIOrG/disiulBp9QcnBN6qTYRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766695300; c=relaxed/simple;
	bh=XFl2TPmrr3leEnScio/DtUIp1dXpFdsWFkUDO7kYzc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kWx+ijk7WvIYW8L3vmcqmiktnoXip9KN/+FlglH8RN4CIUKEp/+hVdE8JRghjktFr1cfAKEUCsROmR5G+NXLItZnkc67NrVJWz/EXUsGtBpzSbwUxB0lpfjCcAUZXCerWe9hDftdgQ/Ya8hr/d++04SNuhW8gXjN1iUCeCMTcwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MiayWGjz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MiayWGjz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=dCv1udCQdIVRTSnhYb635YCMCKCHohAU56S9+iwTx+w=; b=MiayWGjz60vSx2VDpmzm9Omu4+
	MyvF1Tiq/vfWbdMiOkVTuSklB8udCNWHlErLggTtcbDLYZI2bPhMA0BmH8INgYN70OAHMVxAJ0plF
	XlYT+JJCF3WqYu4qySwwPFuLdHmlZ60mycrwnB3I6No6PRLG8aaUaKKae7Zwx6YiYLzNFOYb4pKVv
	y62MCVQJOFAk/079DkSN0S+LZ6JJQ1cunP4bP2GhlDVy4XIHF6Rg5uUf6NNnfkqm/QrzL8myof7oi
	pycGqn2lni3RbjS1PrFwVGBtAm9O3z5O7NkMVlFjtf/tcLeJrr8DEAyk5xCiDopUvE/ntFkg0LdV3
	FJxO/p6g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYs9J-00000000gK4-2Nbs;
	Thu, 25 Dec 2025 20:41:29 +0000
Message-ID: <1aba733a-b29a-4931-b1c9-7df35774db38@infradead.org>
Date: Thu, 25 Dec 2025 12:41:28 -0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: process: email-client: add Thunderbird "Toggle Line
 Wrap" extension
To: Vincent Mailhol <mailhol@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Landley <rlandley@parallels.com>,
 Sotir Danailov <sndanailov@gmail.com>,
 =?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>,
 Paul McQuade <paulmcquad@gmail.com>
References: <20251225-docs_thunderbird-toggle-line-wrap-v1-1-24794afa4abf@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251225-docs_thunderbird-toggle-line-wrap-v1-1-24794afa4abf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/25/25 4:32 AM, Vincent Mailhol wrote:
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
> to create a war on what is the best option so make it clear that this is an
> alternative.
> 
> [1] man git-format-patch -- §Thunderbird
> Link: https://git-scm.com/docs/git-format-patch#_thunderbird
> 
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> ---
> and Merry Christmas!
> ---
>  Documentation/process/email-clients.rst | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/email-clients.rst b/Documentation/process/email-clients.rst
> index 84a2450bb6ec..27cd43b185dd 100644
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
> +    https://addons.thunderbird.net/fr/thunderbird/addon/toggle-line-wrap/

Please use the URL from the git-scm.com web page (i.e., without "fr/").

https://addons.thunderbird.net/thunderbird/addon/toggle-line-wrap

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

