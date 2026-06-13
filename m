Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD971DDC1B
	for <workflows@vger.kernel.org>; Sat, 13 Jun 2026 00:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781310190; cv=none; b=qFlSH4HC7sxxA6HZ6QfpbRXNAE0eSz0Pm+RvhrAsjOmFAl+2+mQuVOvRr/BdV+p+1lDSn6VyMuuUJqQzRvzHe4MpY1dNik5FMo97/i1XniGPNqA+V/YvBR6HpKEoOTL+s9gQLTuTflhaOjlYfF7vUy/K+Cab3YvMuRgzZTz4jRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781310190; c=relaxed/simple;
	bh=gGURmQ38JebTziLuKXD+s+29dgdWcr/VmctNb2MC550=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZW8QUYgvzS3/ZpzmXO5YIfIjoK67SNhjUNev/U3NRPYqz0d30wuhWbQ+c9NQ4Ah+/jo2ESz+K/ymVmnH3G5JR04chmXU2XYYwo43bPwRX/Ya/SeVbODbdrQksGS2zN+TowcpyHs61Wr16O3YxuC6OrTHsi6ONHY7cjg+UkkThc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q0Jq5piY; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q0Jq5piY"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1380104f31eso3267c88.0
        for <workflows@vger.kernel.org>; Fri, 12 Jun 2026 17:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310188; x=1781914988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gQuTjrXkDdFV2QV/Z7GUPJ6mtkFqvtbAqj6efLfB6Xc=;
        b=q0Jq5piYMOKhsf8b0w1EVhI4lkvSrVRdsdEK2dVgjfqWEl0GW3cOeHOsj78/qtgDOd
         p0oIBqkGGYSIYAby2L7FU3ZympeYqsGtrMACIDItDVD/S2Lg6tfbWf7INkiAPKUWTnvY
         sNBI5lou9LSzUHb0Mt1WWGXsojokh9k0bucJceNGGAV9qd0fJ/SA1Nor+GUSq3ZNWU7K
         BNFufwmdKrIqAA1f4N+/GLsR7g2Av/SpaCEa0dYI/qptl+TmpAuIvFBilPhZVQbRDfsl
         Z7RkcFryJh6laBxZUeggmb6dEX/YO5wUwF1pvxfse+k8zkZnt4CXfw7rW629XGhHB2BN
         j2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310188; x=1781914988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQuTjrXkDdFV2QV/Z7GUPJ6mtkFqvtbAqj6efLfB6Xc=;
        b=YCkFQwGops49xotR8h8GK3x9gX8ygtsx38S7GX/nuuszd89fM1AQ8JxFjt2mItEZLV
         NEKt09i/vAdF3btqu2IOelGC6Qia2xCzz2hRC354/jftUzgeGep0KB8/x0uVRVZmRy33
         uFv0+re6cQtSX+RVMHTjITjdNgmjaw3Ykmf8Yy7K11KGobLFqG9y5mo0VHovRLhLgfqd
         MeJAWLGvgxzhYXvfWkgfoOLrD9aB80z6nJ8T21iNaWV8KfkbZn7DdwaFM7ASpi+ICxgW
         UZ0Mnrc9yBx1SzOCo/cML+DmItWfax8NYE9NplOfao3yuSFVhD2AYXAKOtR5acveY7h1
         0xLA==
X-Forwarded-Encrypted: i=1; AFNElJ9u2LxDdPyc2HxWKsV7Jg1iv6Swxo7IwE3T6vn6DgnGwYEIYNWp1dxZZfCB033j0nZ6AVJgGNSx11M=@vger.kernel.org
X-Gm-Message-State: AOJu0YytL/7OF6/psP2WXTncnlzSQfp/nLuGR7UCAs+6eqjJ/yMF4oAh
	wXc3DefdCXz6ti7WRjHFjhjFWDLQwKF8A0FEUozxQqgEiz9uLA/ocYLC/4Q4w0V0Vw==
X-Gm-Gg: Acq92OHOJy7liJMKWSJKY7jWpCIm1TWEkgJCGLqtiwGnOt2ZbhDxqHnufWluGn5IRGB
	hhCPpbizI21suRDCxG5mGIxBsbdYvgN6L85IZPAwresM13FxTjnmNGQ6J9bLhqP0oLT7nqd0kNe
	iRMqurqe4jodM/lO8XLLMbOvsAtD45M5Rzsv/M2QtxDaJLCO+SEmndWFqTwEJZnd70wfuNgfyQF
	Dz5dKggysfJf9Ff8Xbj228Ear2D0NX/Fi0KBLavFE4q/4gO9t8cUoIJDfMEKPUWvPKnHNwaYf75
	nf5NVii8W1x1DAVQKmj0FPMwe2PwfOUhSuYK6Qrqqrj1hFeqXjtFXo/vsJiTH1iunXHCcT/OUHX
	bfwLzUR3Iyk64208qx4SOhPuMtN49Cj84Pqh9X2XURNeIr7JrmyVytELWHgrJUqEwVc45XdUiI+
	UDVMOhTDF86HaqTcNsw6j/n7aKNdpK+Q44RE/texTBHmOxRqruZ2MS0UxawIgUljKo
X-Received: by 2002:a05:7022:98f:b0:136:fcda:bd43 with SMTP id a92af1059eb24-138f3b6d806mr40653c88.5.1781310187835;
        Fri, 12 Jun 2026 17:23:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2e51:8:e362:1a25:b90f:e3ee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e489621sm5610188eec.6.2026.06.12.17.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 17:23:07 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:23:01 -0700
From: Isaac Manjarres <isaacmanjarres@google.com>
To: Dev Jain <dev.jain@arm.com>
Cc: ryabinin.a.a@gmail.com, akpm@linux-foundation.org, corbet@lwn.net,
	glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
	vincenzo.frascino@arm.com, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com, anshuman.khandual@arm.com,
	kaleshsingh@google.com, 21cnbao@gmail.com, david@kernel.org,
	will@kernel.org, catalin.marinas@arm.com
Subject: Re: [RFC PATCH 2/2] kasan: hw_tags: Add boot option to elide free
 time poisoning
Message-ID: <aiyi5flNkNNm0pSR@google.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
 <20260612044425.763060-3-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612044425.763060-3-dev.jain@arm.com>

On Fri, Jun 12, 2026 at 04:44:24AM +0000, Dev Jain wrote:
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index fc9169a547662..4fa8abb312faa 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
>  #ifdef CONFIG_KASAN_GENERIC
> @@ -478,6 +489,16 @@ static inline u8 kasan_random_tag(void) { return 0; }
>  
>  static inline void kasan_poison(const void *addr, size_t size, u8 value, bool init)
>  {
> +	if (kasan_tag_only_on_alloc_enabled()) {
> +		if ((value != KASAN_SLAB_REDZONE) && (value != KASAN_PAGE_REDZONE)) {
> +			if (init)
> +				memset((void *)kasan_reset_tag(addr), 0, size);
> +			return;
> +		}
> +	}
> +
> +	value |= 0xF0;
> +

I wonder if it would make more sense to have this as:

if (kasan_tag_only_on_alloc_enabled() && (value == KASAN_SLAB_FREE ||
    value == KASAN_PAGE_FREE)) {
	if (init)
		memset((void *)kasan_reset_tag(addr), 0, size);
	return;
}

That seems a bit clearer to me as to what it is that you're doing, and
also makes it so that you don't have to do any bit manipulation
on the value when you're filling in the redzones.

Thanks,
Isaac
