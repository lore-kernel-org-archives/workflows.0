Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBA9315777
	for <workflows@vger.kernel.org>; Wed, 22 Oct 2025 10:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761128443; cv=none; b=tvnSp7SF0zj/6aQh+9ZWWe5wYpio5V8XYMTstVPUmWY1/m1BmkjMNG9VxEZG27II5jh1VF3dYKf9UJGff6jCudLA5SdcaaVw7bCcqIa+23BuG1/l0C3pxSs8jkXa/a07UVyW3IUsSGYfUI60I9WOorhTuc20AdPpP/sUAJp6EVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761128443; c=relaxed/simple;
	bh=bsLcKTPJEYIr6iWd2hSD2/QqBkscjLQjYwtElmBwUuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppvFl6HLNeWwfJTD7YAovDoUbYDYKlBH0RPaqugLniS91KOQ2xLbl3WhNT/5AAwG1sfS5MeyywV2jfmvQ5ZR71YZR68jSB9UwlcHZkwKyHsw9ZqjYMxQdrvmD+Ks+ftCDuYKMnkvknaxIB7ZX2ZXdlmrGy1HGYquRr5muagcZW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q5eXYtvb; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q5eXYtvb"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-33e27a3b153so644446a91.3
        for <workflows@vger.kernel.org>; Wed, 22 Oct 2025 03:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761128441; x=1761733241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v+BERCfgvcR5X/QpiR51/cu4DL63bwSFg1M/A5GNtaI=;
        b=Q5eXYtvbRn1VEpYB+ckss1F1GCQzUuvuD/3fl40yNikmpxtheQ7sMn5qQvpyDoulT+
         NuvQXfh9fYXtofOxyEbl6d7RyO70TDEpg64rLRY8Z4vUP9uKQlEXiNkM1M+iM6F81x/F
         ua9PH5RaMRdzQEV2yy93eyH5PdcySO3Av4XbIIZheaM0qTCVtAjaw4K1QPiveyzwKtZk
         IHMzU7jBq7zstnoUb6xfZhwSbD/kOa0yLlP1eyBnchlHBEhyO1/otNkfaRLrm8zT1jgP
         a1tsraAlVachrcTJG4BJNiELwejevit8YN2V0suucIcaXRrV24RUpbMYkEFrEBAwVusc
         SddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761128441; x=1761733241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+BERCfgvcR5X/QpiR51/cu4DL63bwSFg1M/A5GNtaI=;
        b=OMxWL3ML3US8cDkCAG7HAcXw6315nIAWXSBGaK7VwSDJqKlMkOMUv41jbwVRtzG/vz
         GDnEGVszjWYxeIRgIe9T497RHCbLTG34F9WEt96bcM9wrDG/8SPGlIKSImR7y1RDkDYn
         n0FiiTzLsaLBsx6iLRRUxTJeSWXoo9S9N3s7H/3Et+dh4MnGaNkiMN7JLtKWuUC6BNcv
         FiWwGFCFkR1IFjrIu62aYjfh5MD42MWFCL36sO6S1Ebolw1aUeL2s4zOZzdOyUp8+qTB
         UyAKxOQ4gtBvQT1TnEAIXvfhkQO2t0DP+eiFJREva2fE7Tbbixmq93vSGI0eHVu+fdWk
         9HUg==
X-Forwarded-Encrypted: i=1; AJvYcCXdwQDdymCjrPdnP1U1ea2PdfISeM7034UbA0GeCKv9DDS2MJsnHlb5ShcSfdXm3/L9fnqGx8lAF5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbkW+xG/cLN/e8NtO8Ua9gwPpjTVX2kyhG/LdCPuJFEtCoAJrk
	YZwTwLSvc5L9/U1uYB8yfbsFM6wq5PdrX94TGtiFf1gRChVVFxvRat5GuqxYQU+Owvg=
X-Gm-Gg: ASbGnctQJE/GXfcIml0ICHSIYNtenl+XaVmDfQpMOm6hAZqYASDgmD2BcUwfExNxh68
	GpCwepcLYc7HrvZa7s895aVfV9mR2B6tqb0VXKXIes6i4LpiSn1BEXLchc8SzxEd4j2dGYQXTHc
	eSWPxxDrM3SKL/d1yozeh2OGJbDIi7Gm0SXjRWsYf0SpPPUcZOWMJSrlShthdZdWRl8Ukav7DcD
	hkI4k6UV5gR9WKNaqZX89iOAlZgCs8sj9ZmOaVSxHL7RCOM8w+1W6N7ZawSt70i8XW22ibzzpCP
	8leKUM6+KxkHVIenrQ9BJwV4he9E+8xiEspapyOXsT1wQe9rZalRVaYuKt+faXwrEHe9jcir5f6
	u1jyWnghYbYwwbJzls2hVgC67lrTF3kF99rbbForMd2nlPcLw+MhONFyNsapKSacEMBfejwX/PE
	Oku++w/Uuwvdaw
X-Google-Smtp-Source: AGHT+IEPudXWObjJLDv2XWqM26sgZsiKQXdb5QBSpUD/P+viWtBD0+IrqTmFx+e1SWZr7yyFfz4vMg==
X-Received: by 2002:a17:90b:5105:b0:32d:dc3e:5575 with SMTP id 98e67ed59e1d1-33bcf8625b0mr23541723a91.5.1761128440788;
        Wed, 22 Oct 2025 03:20:40 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223f0124sm2159272a91.11.2025.10.22.03.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 03:20:40 -0700 (PDT)
Date: Wed, 22 Oct 2025 15:50:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Joe Perches <joe@perches.com>
Cc: Ally Heev <allyheev@gmail.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, David Hunter <david.hunter.linux@gmail.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-pm <linux-pm@vger.kernel.org>
Subject: Re: [PATCH] checkpatch: add uninitialized pointer with __free
 attribute check
Message-ID: <a6yf3ms7smzjfcm54z7khg6g3zpepqwxcbhwzm74dk33famolr@s2at2tnyxoed>
References: <20251021-aheev-checkpatch-uninitialized-free-v1-1-18fb01bc6a7a@gmail.com>
 <5e11f1bacb6430e1331f02e3e0e326a78e5b0d12.camel@perches.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e11f1bacb6430e1331f02e3e0e326a78e5b0d12.camel@perches.com>

On 21-10-25, 10:06, Joe Perches wrote:
> There are many uses in drivers/opp/ that could be updated where
> the initialization is done after the definition like the below:
> (I've added the opp maintainers to the cc's)
> 
> drivers/opp/core.c-unsigned long dev_pm_opp_get_max_clock_latency(struct device *dev)
> drivers/opp/core.c-{
> drivers/opp/core.c:     struct opp_table *opp_table __free(put_opp_table);
> drivers/opp/core.c-
> drivers/opp/core.c-     opp_table = _find_opp_table(dev);

https://lore.kernel.org/all/45a64ff434a027c296d1d5c35f442e51378c9425.1761128347.git.viresh.kumar@linaro.org/

-- 
viresh
