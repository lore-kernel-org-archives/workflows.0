Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0B4346E70;
	Thu, 22 Jan 2026 18:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769106554; cv=none; b=FFDUvMr5LfTSAWpk2N9zr9LeZkTUzB4AzS7TPElo8794PUgt2k4TxRvwMdr8dSMvUVAQ4KOHkHaSqBL7VdKn4mctWI9uX5UOj5vtGOOPCKstLWaZHXEb6NeTPA9AXZZZ9eaoSPOFcud7qOigDSDY0PehtYUrMUyYa7m4R8LStmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769106554; c=relaxed/simple;
	bh=ZUSvl05bK2wDQdhoH51krrPfZTVgqCoCo65mT6q4jZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+yhaKKC05cQCUGAvhlTXKcNptKeJN7K7geUMgQpTARFPDpJepeAvxpNX1lm9yxUsH0EFr0A+/7u+e+NbVKJRhPoXiWaZDarAHjylDwkMXZf/C8B4QSv6dvtH1MZ8LWP+9njizVNzMXQ0m/V3WUmOn6urRaMSTE1GxjgRrfkZ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OaoXckYO; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OaoXckYO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=yKKw+rB7Lag7BUDagtiVwP8Kf4vv0TdM2e/79p7B5aM=; b=OaoXckYOXZGQxb0fp32TyaquS4
	2HtV5OLuV0YxYrs8XsaURNYyTjDRnzh8uCgg7aHb8mE0dYkeAlL4Jj83HFJQX85sgLUx+XfhVSUAx
	jJnMyIMsPwpT+MCGN4XpytBGAnOm0g6JyeycusJMfV++vxBNmErBTChnDZuUY1oPkgNHcyocdlmyn
	rgTPV5uV+BH9yDU1mK02560P2sCMRnNlnfNM2TX+fKBF8U+kcFsCltgMQPkCCN04ysem6e75DGUCN
	DzDyU82A0xc1HPko8AWWZ+zWhpGk8zQiBQa3G2Ey3L9wweORr5vSV3nELoDevI3guc23RqXTYHjSP
	QEhKQPSQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizQM-00000007dPw-2F4G;
	Thu, 22 Jan 2026 18:28:54 +0000
Message-ID: <658caf3b-aeb6-49c7-9e5a-1eab175dd1b3@infradead.org>
Date: Thu, 22 Jan 2026 10:28:54 -0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] doc: development-process: add notice on testing
To: Dmitry Antipov <dmantipov@yandex.ru>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260122111525.1112145-1-dmantipov@yandex.ru>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260122111525.1112145-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/22/26 3:15 AM, Dmitry Antipov wrote:
> Add testing notice to "Before creating patches" section.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>  Documentation/process/5.Posting.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
> index 9999bcbdccc9..0271a4dc525e 100644
> --- a/Documentation/process/5.Posting.rst
> +++ b/Documentation/process/5.Posting.rst
> @@ -40,7 +40,12 @@ sending patches to the development community.  These include:
>   - Test the code to the extent that you can.  Make use of the kernel's
>     debugging tools, ensure that the kernel will build with all reasonable
>     combinations of configuration options, use cross-compilers to build for
> -   different architectures, etc.
> +   different architectures, etc. Add tests, likely using an existing
> +   testing frameworks like KUnit, and include them as a separate member

              framework

> +   of your series (see the next section on what about the series is).

                     (see the next section for more about patch series).

> +   Note that this may be mandatory when affecting some subsystems. For
> +   example, library functions (resides under lib/) are extensively used
> +   almost everywhere and expected to be tested appropriately.
>  
>   - Make sure your code is compliant with the kernel coding style
>     guidelines.

-- 
~Randy

