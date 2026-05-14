Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8AC315793;
	Thu, 14 May 2026 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778776307; cv=none; b=MMEyIhk4MVJAH23Oz4cOjqE/x3bNSolq//XPyXk/Hvwu5E8xfjCZRuNSVGi8Wx1jM7giquCryhYzAg5ob1fHal9UsxSzxBf2ylxrpvnXbqMJZ+TPbpkXhW3x9Lac8CmCidfITOa5bK6gWL/e6q5VzrOTtaPAS6xjQ54lCIktyXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778776307; c=relaxed/simple;
	bh=Uf2qbL9yqSqQ+XzxVsI/hBvglaLl10AOtP7afIb1D9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0n2TcIGvjrA+KZW6gFqs6J+PdJuLRYIWCVOEe5PbY4XHdT+DvUYneE2dyYD3pDSZXqA7K5bQO/OYs/12SnPRwlWvRrQxh3N7ZbXolV+dSfRkcMCYLimmkoAQzPI66/KMYZljzIFZVf5/4vs9zHFZQeC6hnPuHHE9e7J0ltFA7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etAgPwba; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etAgPwba"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05DDC2BCB7;
	Thu, 14 May 2026 16:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778776306;
	bh=Uf2qbL9yqSqQ+XzxVsI/hBvglaLl10AOtP7afIb1D9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=etAgPwbaHfQHR6gq6jG/oDFMxffhTFSUpHcjXWKN+Rakw/ksifC+HnxOyeFEoJoP2
	 HKcG6Y/9lbbDyE24TWfifOSshy57LF/vb8gr7AKwOJC9G8j9i3TasF/RAvxCiqcRYS
	 Ofjaslj+yiJGfBTGgd8fu3LAtwUSrkQMqv5KHhDmRviUAuumZxCnQPYhjkHRmOh5yf
	 uUtp2AelwQSimH+kn26rb+GjiAxldaNy/bJs7WjI5dwChBm8stifkOOMMwTqJaUPgx
	 +DhEDf64tzzrwwECU8vupoKjcqqNFabLDZEG7qW3or+UoEqjmatRjZ+N6sWLB7tBiE
	 NbkrdAFrM0Q0w==
Date: Thu, 14 May 2026 09:31:46 -0700
From: Kees Cook <kees@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	David Laight <david.laight.linux@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] Doc: deprecated.rst: add strlcat()
Message-ID: <202605140931.913048A68B@keescook>
References: <20260514160719.105084-3-manuelebner@mailbox.org>
 <20260514162652.107714-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514162652.107714-2-manuelebner@mailbox.org>

On Thu, May 14, 2026 at 06:26:53PM +0200, Manuel Ebner wrote:
> add strlcat and alternatives
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/process/deprecated.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index fed56864d036..06e802f4bbfd 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -153,6 +153,13 @@ used, and the destinations should be marked with the `__nonstring
>  attribute to avoid future compiler warnings. For cases still needing
>  NUL-padding, strtomem_pad() can be used.
>  
> +strlcat()
> +---------
> +strlcat() must re-scan the destination string from the beginning on each
> +call (O(n^2) behavior). Alternatives are seq_buf_puts() and seq_buf_printf().
> +snprintf(), scnprintf() and sysfs_emit() are possible aswell, but the adoption
> +of the arguments needs to be taken care off.
> +

How about just:

strlcat() must re-scan the destination string from the beginning on each
call (O(n^2) behavior). Use the seq_buf API or similar instead.


>  strlcpy()
>  ---------
>  strlcpy() reads the entire source buffer first (since the return value
> -- 
> 2.54.0
> 

-- 
Kees Cook
