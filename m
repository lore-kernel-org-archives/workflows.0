Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177F53A3E95
	for <workflows@vger.kernel.org>; Wed, 29 Apr 2026 08:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449688; cv=none; b=qUTMP8PmZVmtRA6GWeHyLSUU3XS/7WHISY9iDuVrgA87FUg33B3minkcs3qB01YMjiPqSFqZ9iM0D2zyKdl5GB2mtT+9fCAT9uG1wrjwadn8eHgA9Mu+6SaclLBBB7kUWOtucR9zWRSKkacC1dV9mChd0EK2HyX2kFhFUMXOLD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449688; c=relaxed/simple;
	bh=cCTmLs5IIowad/djOAK+5VNMZbIbVtoboSLsS4fSv1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r7YPJlUOLDdvtDfIf+CUTdh/TIo0TPglbHwrgNVWFX0sp4eX2R6AbFHXZv02eaqHr2DM3wZ6YqLBxZGwPITCWM6KPTl7o3wZ3ndvXDSKT6EYq73ZHqkA4K7Xuq0TuDZAtdQI//3KJ3D2P9hedorOnvK0dGVOQacbw0JWyfw0p0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NR93f+Ai; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NR93f+Ai"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891b02a0acso9617215e9.3
        for <workflows@vger.kernel.org>; Wed, 29 Apr 2026 01:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777449685; x=1778054485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZgTX+gVOkVV7nUMiKXD4ocpW5cTuBnrdpljyNN6o5Eg=;
        b=NR93f+AiUmaejAOC0A5edNkxWHvbAqdFEvdX4zdITz6IzcYlBe0SRnmNRLCfwd/xgV
         14kgd7UtIx6IAJJAlCo1wyQ7zFUM2N/BezMBlamR7bKteI/lMtX+HYU2lEvCSUGrgdEG
         Z6XHrwqqld6FsN5r1bDhr6W85fGlWR+aYdV6msBKZYnKSV3lSMwUYi3XWDwitv64xl4a
         aU8fIqRgxvreeUS5tnh5whq0TtJ+1hTEraVZBn2xWl2q8uw579fFTAbLRFErrDiJtifx
         4injMrFgYzGsese8EW37H+Ou4f4GyMdP7LpXAs7lcwSDoq1JVq3a5wak07g/JhVMg+Zm
         kMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449685; x=1778054485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgTX+gVOkVV7nUMiKXD4ocpW5cTuBnrdpljyNN6o5Eg=;
        b=Fq0mMtOZYyq5Kac+4Bt9ChIHMq9OHBfeUI3PNioc2we2bo5KMmGr9UacNQTO+MV9t7
         p+eMk0ovakEAklehNX/IQRjQ9J5Lv2nSenC8E96cDFUDhpjklltSvFXdjSc72ZGLSb9i
         SIt4uQupr8ttwO/VfNZ0iJm9pVYbO6p0UHuqFUkUxcC0GErH8erGHH1SxXpLt39s/qU0
         IiajRETpk0/CWo8hYjQQ9NzroXZLZsDFSiiOsNU4jsHvo+xcD5oPD3cD2GgRbXJuZqLu
         bCSCrE5seYpyOw1etnHxEuycDEShwuQ4uev2EUud1KBhSFhXZDixIQ2W+HFYk39twlJi
         QAyg==
X-Gm-Message-State: AOJu0Ywj1XlF0AzxEFXgj4c+nkwkagcmrfsG+1PIybvIedllH4C4ZX+P
	P9NeCgkkQAP4DzEHSECET1nikFuJOeMNfcxDFtYHvBg3FCLvjWHqoWnQR5MYNj9ODtM=
X-Gm-Gg: AeBDieudKf/pYlC4Yl5AhShicWUx4sqc9TLDrR83464HQ12642yA2fyGt/G05K0oROR
	F0THwJJH10ZC6L3dOWZDfyUUhbvsXm/DLksLvuFTJ1HvitYbAMUd9avSifEAiYyP9/sqUFLSM29
	UbQe9l8Glx+hNegVq60ZGu9xeBFlpJFZq6D7MIm7/6dJdyF2S4vLENFvNmEC+0EI1KXgdecnnTc
	Mgd3pdNsoVed6W1WLC3HzmWftpfMjxk35jqw4gFo/9I0RBtAWEVthKEKz3CLaFRQhZr55WE6TqL
	CmGRC/17UzHINzWlFU7zl2AvGL7cLDJIb+1ooIOrx36sobE65KXPuGXpFPw2v642noaCmtdeBbz
	xEu7Bg1kEmyCYB2Qt/ry3WkENEvaI+W1N+rmM3BxJtc1Ndy1fD+iUxLeoXRv+udDpJRzHhV3FU4
	xGW3BA3D2f5Mir3Z8tC0sO2ghMtQb+DDwiuC/UtJIbFNgEPr+srYTVDriKE2Y4QE0M9UqX
X-Received: by 2002:a05:600d:8448:b0:488:a797:f099 with SMTP id 5b1f17b1804b1-48a76f7a55dmr48377525e9.3.1777449685427;
        Wed, 29 Apr 2026 01:01:25 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc12bcbsm63364245e9.1.2026.04.29.01.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:01:24 -0700 (PDT)
Message-ID: <e85450b4-def1-41f5-98ff-e88b18d5201b@suse.com>
Date: Wed, 29 Apr 2026 10:01:24 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] Documentation: deprecated.rst: kmalloc-family:
 mark argument as optional
Content-Language: en-US
To: Manuel Ebner <manuelebner@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org
Cc: workflows@vger.kernel.org, linux-mm@kvack.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20260429070759.309110-3-manuelebner@mailbox.org>
 <20260429072704.311603-2-manuelebner@mailbox.org>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <20260429072704.311603-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/26 09:27, Manuel Ebner wrote:
> put the optional argument (gfp) in square brackets
> add default value = GFP_KERNEL
> 
> eg. ptr = kmalloc_obj(*ptr, gfp);
>  -> ptr = kmalloc_obj(*ptr [, gfp] );
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

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

