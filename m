Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BD5128395;
	Sun, 10 May 2026 17:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778434289; cv=none; b=HKpAR8vtFNiXKGbJWLb7WiHc1VlE+eDhhkiFDS8FyYazsdTkJWTTCP2Fijn20zO7ZEIrKNacYDHMfHSnZ7tV1d1sO3urKAYhIdeBREmaypEGHgTDt7HxPIj4CRaFjOnOC38GPRDug1wIlRkojHfDHYuHfmy8C2B2jTzlZsWzCIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778434289; c=relaxed/simple;
	bh=EYz9iKA19s1NSbrUky05UN1WuZPSPxLRJGmlVtC/5mY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFcbU2Y2NWkHzMv+bhiro27LwqagiF1N/xhy+uFirYP0JRHYdddvOkEubvKseZ+9kAkJv12Q4s753P7m1qXB+QVCh08U63r2JyqzKJWtLIQWHPszeT1AiVBXSEtRToB48l7+vDrX9OhNVyzlMNnGFn/kDR+HRY3JIJJ5GKuOuMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=4vo4z0o7; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="4vo4z0o7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=GHwWmnS4gJ6IenFgK6UMJNjjXs3ZUO5adKF9kTgEA7c=; b=4vo4z0o7dKQo4q9rJkD2kmumMn
	sQUXrmrARKVfDZmC9jEvmzIafgTo6doGevken9U+iFN7jeQBBT93kyCjEsMVdNn0rq7pelrdm6dik
	3tYlhOT8Cy80yjZEug5MR+8eZvqd+AIdyjZCe4xmayt+0etu/17ljzghNqEyJjxM6YvdgXUd4Np8o
	ecXzV+T0QiVvqtlOP+UaM0TCRGDJtIO+uaYiey/LPiFRElYZG1W8dzpnq33T9IAyjeh95EzfjsGQA
	LKNsn8lrc33KTV8HIncxGwXwK54RYk5DDxMudDFn/JKDaRiROCcd14jioD9tbDmyjw0R4E8BRsM9V
	7uBklMWw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM7zv-0000000BGXU-1Eju;
	Sun, 10 May 2026 17:31:23 +0000
Message-ID: <6fb79ab0-e367-4da2-8e3a-edd0359b0bc8@infradead.org>
Date: Sun, 10 May 2026 10:31:21 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] scripts: checkpatch.pl: add warning for strlcat()
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: andy.shevchenko@gmail.com, apw@canonical.com, corbet@lwn.net,
 dwaipayanray1@gmail.com, joe@perches.com, kees@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 lukas.bulwahn@gmail.com, skhan@linuxfoundation.org, workflows@vger.kernel.org
References: <20260510164907.57176-2-manuelebner@mailbox.org>
 <20260510165649.57880-2-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260510165649.57880-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/10/26 9:56 AM, Manuel Ebner wrote:
> add a warning for strlcat()
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  scripts/checkpatch.pl | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 0492d6afc9a1..ca1a8e67d529 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -7085,6 +7085,12 @@ sub process {
>  			     "Prefer strscpy over strlcpy - see: https://github.com/KSPP/linux/issues/89\n" . $herecurr);
>  		}
>  
> +# strlcat uses that should likely be

should likely be what?

> +		if ($line =~ /\bstrlcat\s*\(/ && !is_userspace($realfile)) {
> +			WARN("STRLCAT",
> +			     "Prefer seq_buf_printf() over strlcat - see: https://github.com/KSPP/linux/issues/370\n" . $herecurr);
> +		}
> +
>  # strncpy uses that should likely be strscpy or strscpy_pad
>  		if ($line =~ /\bstrncpy\s*\(/ && !is_userspace($realfile)) {
>  			WARN("STRNCPY",

-- 
~Randy

