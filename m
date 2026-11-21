Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280008;
	b=4Pxlm0A1CiEmGEgnjDEK7j4gzYwk2X8QXASGXo8ELgVUheShoA8RLFfYgufRcb4CPC6j
	 653bDx8vVIgI48oVZOqyVDncGuNldbz1q39FF57/aWkdSVD4/bXRAgud7e5hWLYQpiyPp
	 7mlyJEK2nyHA050R8WQAEQ5iwhz+2wnrkepZNw49ID5ASgUq5YCG208nhqT0GjHg91XIv
	 nPbGaq1llOWGoVkioFWt4cZhNhuLA0SYxJTKjEvX1cMGbpefUx75I2QLsBStABPZdv0w9
	 vnQdJiPAaSk1Ctzarxjcu6b6lAsy7lJSejPIVXkhs5+xDWFlUBF+T1dZcndGg1beY2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280008;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=DZVQZqKXqbRKF2KM4ZF2ZgwvQAofmplM9n83pr5oX+I=;
	b=DblS9aTaVsaW2GSBMQbfKXwrWRiz260pLJQjd4GPYFHZzfy+FujNPfTUOaipRI3ldnNm
	 khZXAH/3ki4HiV+XVzDWTV/yxOhkIDKEQG47nltE/OXwNVGc6JNHfxrAuGLnsQHf2Ym+l
	 m/yCDx0KEADgsFr/puyjGFE1DzjLu9b/P2hMrOHY5VDVM6kR6X0uHQdFuTlI18c1zV/1G
	 20XkWwQQWr1/a3fn1+Ny9aqeCpQN7OrJE1P0OBUUP6baDyxz9IXBKre3DNiPEBTGhmA0o
	 SRBCBC9KO1rwZ/R7rVestAO46cSfu+ymIEo9RC2O5a6l/RPHJpg9tkNARWGZl0Ew90g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eQU1oKAi;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A705B606A320;
	Sat, 21 Nov 2026 16:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A705B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eQU1oKAi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=DZVQZqKXqbRKF2KM4ZF2ZgwvQAofmplM9n83pr5oX+I=; b=eQU1oKAiHYli3YMbUqLz9sX05H
	5uIURQ1KOSbadCLL1lyaxXKQMYJvuvgC7T7PPVL0uptP1lmCFWnSfU6+DJm+PbjLSfYvjeNQWgVen
	JINKX23PNAszcl5pjIyOLld27cKMF8nr0lRFt+sRexNaw4Z5zt8JzA+wVwQZjv7bffEiQrl6C71tf
	zF+jzMGAA4cD7OcD5IIl81bajHHRgCEnWp9sjh2fSqme3Eu7NufYmQNGjuN3Zg8AFrtHunN35sL2W
	a4YMckrI9J2hp+LmGtNevEHaacAV+C7reNASGQMzLjBO/5oq7eNv0o7EAr4E7fgfgCoOEZVf3Bvs0
	muSltCKQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUoL3-0000000HWMn-04p3;
	Sat, 21 Nov 2026 16:53:21 +0000
Message-ID: <bd50aa92-fffe-4176-ba63-4812c68565f8@infradead.org>
Date: Sat, 21 Nov 2026 08:53:20 -0800
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
Subject: Re: [PATCH v2] Docs/process/changes: add comment referring to
 ver_linux
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261121115203.1444513-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261121115203.1444513-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/21/26 3:52 AM, Manuel Ebner wrote:
> Add comment to keep ver_linux up to date. This comment does not show up
> in the output of sphinx.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
> [v2]
>  fix typos in diff and subject
> 
> [v1]
>  https://lore.kernel.org/all/20261121113221.1442278-2-manuelebnerli@mailbox.org/
> 
>  Documentation/process/changes.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 13093c5c26..ffeaa3dce3 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -27,6 +27,10 @@ running a Linux kernel.  Also, not all tools are necessary on all
>  systems; obviously, if you don't have any PC Card hardware, for example,
>  you probably do not need to concern yourself with pcmciautils.
>  
> +..
> +   When changing anything in the following table, make sure to update
> +   scripts/ver_linux aswell.

                        as well.

> +
>  ====================== ===============  ========================================
>          Program        Minimal version       Command to check the version
>  ====================== ===============  ========================================

-- 
~Randy

