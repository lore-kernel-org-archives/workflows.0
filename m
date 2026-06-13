Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7361A9FB7
	for <workflows@vger.kernel.org>; Sat, 13 Jun 2026 00:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781309816; cv=none; b=m/E1CNGU3iLTzHUNi3sEut8YugpIK0Q7gwSw49EuBt5rA9iFWaSRdnYBgGZJmY1w4tBgmzvn3egW5VYOlWls3xL0iHrZheDuLVGgYoCscXq5klbCZObsEkJqallqG7aaqvAMD9NH4C8PHnMB9EClbZf7iPESorHuLx4dS0EjvnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781309816; c=relaxed/simple;
	bh=RBSN0UlsBfrCs3ZKta21X4Qy6ml77QBdos/zlQ3V+Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZAgY977OV4oPE8gpV7YBzlZMvQqVSriI9B2hZaODE+6NPZHT/ejxv2+UZDuT6mn0i9Ci21TnK4V4I7i7iqZrfNVLctaZa/ODRqpnQLSHA8LkRZre2aTI8r3dVL4Z+IA9l/Fe73dCye1WL+wgNypBA7Ev7xgYxIy6o4lrKGdCNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PF7e5rND; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PF7e5rND"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1380104f31eso3247c88.0
        for <workflows@vger.kernel.org>; Fri, 12 Jun 2026 17:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781309815; x=1781914615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AWwT9TpVhYF/K0z+rdL3pthvZP+Xb5uL2Tmv/pNJ18E=;
        b=PF7e5rND9Y8uEDk9zB5Z8l6Fk8A0Ne/PrczwYRF149k7wbK3jG64t/4xQQAxb+5pJ8
         IC6yX7lJzZ6HUl5n2m1misAaWzWLaCz+AD0IYrOIlmybv/gWmTGQXJUA/9ou3GJxb9xx
         s+1RXSqsp/3LMRemKPZo3p7hE/qHfCXHu2ykhSoTri+Atc/msBqqnNfxcGIm9TDL6cEB
         nyfiWT5eME0FXMGlZNO9KFf5UuvSzW2Y5rECGrkURbK5EgYtezs/a4F0AEmvUForamm2
         dKKiu9BH5x/dl3mnYRhn6CjTOYb99hP/Tew0doKNSKjJc6UwlU7y2yOSqDlGdmQMp/Um
         Yiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781309815; x=1781914615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWwT9TpVhYF/K0z+rdL3pthvZP+Xb5uL2Tmv/pNJ18E=;
        b=fjPvuUQNGj+LvRP69esM8AjEarmclSwgXprqNSSOaDtdvYTvn2HrSKhNI1C3wH1rGm
         cwwEyjQQ6u+1WzedGHsu8YIrbqv1elxtACqGMvNAXgi1G1zakV5PRxoonNioCqd03qG7
         g9Jgk+RJpxq5YFeAwVY1iFCDV08lww2e4omPqG5vtjO7Tm2A1uF5+fvWJWAGTmraeWFu
         /WLShj+3bmhTPWGbw/Cb9q3WkwEFNRw7aP9vHBl7bX+rigLZAtaPvA4Tbn8VRyYhCbBW
         h+y9RrjHoqHSBOm9P7ap5GN9IOWRiFxr5m9couGudKyhyttdx/VVdsA9sgPEZNpqZLqI
         mEDw==
X-Forwarded-Encrypted: i=1; AFNElJ/7YXZdApOL3RBJZ8j92/oK6T7d/GVWTMJZ3eRigwsad/VDJqVpRqSNcm3UXE3vLF3Nnq1gTGENfZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnumu6OIQKM0Q2kRwj+QLjuE/r9T2s6EhGpTZkLZ/D5msbEr0U
	4+s7tDVI9G1XGSVsoNArvYMakJn/CZRAehnWBTQncvWBiARjzr6DW7pUjWXaoHLiwA==
X-Gm-Gg: Acq92OH1eRgF5mMjOJPCDqerBmrcUigBCh1w8Cv8fjiRK+w/+vVpHx3XCJRuGEae5fN
	np6f9Xd059Am//oY8GTN5C9sOYoWyFMgirp33rbx/2EM5i7NiVpLtTCdcBxzyukYmohl2JMargr
	/zgylkvF5JpZdqhUKT66HgHahDoUEXUgtcZ1SBDHFijQdkRkYfbyj4hws0f88tqp+03Zasu4i8l
	Wgw7lgPJlLndkmmAIE3fxuCjOhzuPoLyXKTBQ6BczW8qDLijV1XMVLmU01paf8xiMDQ9zaR8jHY
	GWTtkoJDseNLQ4l6ET3pxvqfAJTw2+/P1CsJEl1dPBIPYwswSJ4U2J++pE4vJOF+Em8bZffkpuq
	1nSCGe5mWnl1rSOrwVbVDDxZHCFHYZ8qERAMIFhUC+ekZ2JCGjkS813Y03LRxcIJThOlzL9MDOJ
	sDqrn0G2augP1LIv+f0shHuwcjZQTjETrfkuFbwLqqWMNvgd0QqsJjzrg9XFQ3bBg7GUbLOpvGn
	a0=
X-Received: by 2002:a05:7022:f8c:b0:138:888:32db with SMTP id a92af1059eb24-138fe5a1d90mr28525c88.27.1781309813946;
        Fri, 12 Jun 2026 17:16:53 -0700 (PDT)
Received: from google.com ([2a00:79e0:2e51:8:e362:1a25:b90f:e3ee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea43b80sm5190375eec.21.2026.06.12.17.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 17:16:53 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:16:47 -0700
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
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
Message-ID: <aiyhb2XwMMJE3st7@google.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612044425.763060-1-dev.jain@arm.com>

On Fri, Jun 12, 2026 at 04:44:22AM +0000, Dev Jain wrote:
> Introduce a boot option to tag only at allocation time of the objects. This
> reduces KASAN MTE overhead, the tradeoff being reduced ability of
> catching bugs.
> 
> Now, when a memory object will be freed, it will retain the random tag it
> had at allocation time. This compromises on catching UAF bugs, till the
> time the object is not reallocated, at which point it will have a new
> random tag.
> 
> Hence, not catching "use-after-free-before-reallocation" and not catching
> "double-free" will be the compromise for reduced KASAN overhead.
> 
> This is an RFC because we are not clear about the performance benefit.
> 
> Android folks, please help with testing!
> 
> ---
> Applies on Linus master (9716c086c8e8).
> 
> Dev Jain (2):
>   kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
>   kasan: hw_tags: Add boot option to elide free time poisoning
> 
>  Documentation/dev-tools/kasan.rst |  4 +++
>  mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++--
>  mm/kasan/kasan.h                  | 23 +++++++++++++++-
>  3 files changed, 69 insertions(+), 3 deletions(-)
> 
> -- 
> 2.43.0

I tested out this series on one of our devices that has MTE support,
and didn't see any functional issues.

One thing I did notice though, and it's independent of this patch, is
that the vmalloc_oob is failing, but that happens even if these patches
aren't present.

Thanks,
Isaac
