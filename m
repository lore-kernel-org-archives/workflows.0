Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB41F1448D5;
	Tue, 12 May 2026 00:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778546512; cv=none; b=rjpYEV4r4K8zYCyKviPOjYyk361FBKP6oDOxSs1ItYeNkEWXukD6VkY8blc19G597EMLOQBOS35lfD3dpvqw3Pl496/napnNc93T1SnmXp50Z5McsH3a/t6YrrDhhTO1L9SmWMKIkkjb+6XQSJtwr7dwL3n7VYCW2R/J9FjucpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778546512; c=relaxed/simple;
	bh=0hrtRatEghju+sqm+8Dm+/qxqz1yrj9zD2HDt7M5Q34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gaiSdMqQucPuYAWOQTDf1v28bv2YI+w19lQQV4lsh9rnQezIagRlGMg4tPOy8N0Ry1aOfDUrrAbXwTTqb7w9epAV/o0g5FACN2T25Qj0sHHSGPhftqMhigG83FBJQ7r4KFNi7bjfUinZDEXhd36rrx1mr/oSuiFWzZCQMPgG3wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wCT2lK0q; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wCT2lK0q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=rTjHniORfsxQ/3vdtbZ0N++LXk2AYxoCF4rHr4yn62E=; b=wCT2lK0qPXpmjHbW56ARFkJL85
	BZnk7a/UYQ22dQ62OEZfG9dD8A3Kj+RbDDFUD7inymTjNUKre6jRI6EcF9V5Wri26qbnB3AFM0e3r
	5XYF1Rke3YWm3uMDnh//vM7B8N7p+NdzGW/IJmNusRsxTFKG9dxb+z5FbYbUmP1FZMKfq5SpXAl8C
	dIZkqAsclvYATPcz6a5u4RWdDALbLRmUrh7NlIByU5OpnbSGSx6sU2aSeOcxaVrvRV7cxfn8G1rmF
	hTktg39GpY16iohJTdH2qV3cgoJwYW/dwTCDhUPOPAqmREa6BWC9ivcBJx2kdIf/Hwn8HaJ8bOR72
	KGo9BDsQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbBy-0000000F6Z2-1nAH;
	Tue, 12 May 2026 00:41:46 +0000
Message-ID: <7db90c80-aa91-4643-8cea-45b7f8284c7d@infradead.org>
Date: Mon, 11 May 2026 17:41:44 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix spelling of Shepherd in howto
To: Chen-Shi-Hong <eric039eric@gmail.com>, corbet@lwn.net
Cc: skhan@linuxfoundation.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512000946.3234-1-eric039eric@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260512000946.3234-1-eric039eric@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/11/26 5:09 PM, Chen-Shi-Hong wrote:
> Correct the spelling of "Shepherd" in the acknowledgements section of
> Documentation/process/howto.rst.

How do you know that the last name is misspelled?

I found email from "Alex Shepard" on lore.kernel.org/all/ but none from
Alex Shepherd.

https://lore.kernel.org/all/1137702713.3205.43.camel@athena.sea.amer.gettywan.com/

Names can often be spelled many ways.

> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
> ---
>  Documentation/process/howto.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
> index 9438e03d6f50..edf4412de112 100644
> --- a/Documentation/process/howto.rst
> +++ b/Documentation/process/howto.rst
> @@ -616,7 +616,7 @@ Huizenga for some of the list of things you should and should not say.
>  Also thanks to Pat Mochel, Hanna Linder, Randy Dunlap, Kay Sievers,
>  Vojtech Pavlik, Jan Kara, Josh Boyer, Kees Cook, Andrew Morton, Andi
>  Kleen, Vadim Lobanov, Jesper Juhl, Adrian Bunk, Keri Harris, Frans Pop,
> -David A. Wheeler, Junio Hamano, Michael Kerrisk, and Alex Shepard for
> +David A. Wheeler, Junio Hamano, Michael Kerrisk, and Alex Shepherd for
>  their review, comments, and contributions.  Without their help, this
>  document would not have been possible.
>  
> 
> base-commit: 5d6919055dec134de3c40167a490f33c74c12581

-- 
~Randy

