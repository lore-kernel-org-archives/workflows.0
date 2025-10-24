Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2514B303C8A
	for <workflows@vger.kernel.org>; Fri, 24 Oct 2025 18:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761329314; cv=none; b=Gk3JwYgJTT+wMJM01pAHHjyJHgxr2yCgjavAe9tExfT09SDtbJRL5gAVV3jzI0hs9CFAvYzF1BYtFUP4iLBsA80X8R/kAZ7oChFefp43QGakW6BGW/qE5qOuBcVVwy0UpXit8B3ylI61w+PNnqskaUZMYmcf2xyjW/f7EplqkJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761329314; c=relaxed/simple;
	bh=fs4CyyLRT6dkUGXO5Q+u/hfzegd+QrcsOC6QOosSMeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5n+FmfC77ZRRU3FyfRsA21dhSJyoQw31ritBE7sBslDvOdSojarp/kvUNLBQpZzivnXMUh/L6gLGw9wK345Al0xB+CNs1Eq37ogHZbYsexaFi9kErbBgvPeM0GC9zr1ghdH18h4gJUpIXqEeCr0O22Rzm0Bmwv8JRVL/g8nR+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BrOCGwZm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BrOCGwZm"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-426fc536b5dso1710812f8f.3
        for <workflows@vger.kernel.org>; Fri, 24 Oct 2025 11:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761329311; x=1761934111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Vk2OMU5f1IjfJGz1tZfU6V+rEtX5ueWDjCoO5ODmWg=;
        b=BrOCGwZmsgvu3f9zdrIVgXYDTOq+Byno1eFHrVSrrVHNRvVFsndTGeN19A7fDA7saQ
         wgGujljhrVX10uWXcmDCt/RkM73MpOHPmjWQNzcnx/DiN3zUaZHqK9YPyquTosMDWIFb
         oZ8xcf1338kr5W38SdBanK7Ar4scefIYFENlts9wKB4d51UXhB3+2b8vNTDpr370K5AH
         w5EQH73EDamXDlPaPv8L0u2WQ8Q+sf0Yp3r4ExIRw6sfGdzJ/LYqEqNckKxtUe25BfS/
         OiwWhSpRNWaRaWhSvnyowoSXUB3YGMaFu74w2cBggmu+7O6JLrs+U7S/cAezfKfTRCbX
         00Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761329311; x=1761934111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Vk2OMU5f1IjfJGz1tZfU6V+rEtX5ueWDjCoO5ODmWg=;
        b=bGmpiexlMxMCgcM4OYSxG1nArVP7TD4I0w2UFp/n3SW2s/b1A1eUYa8mN5DfQw5+Py
         CAuhYPnmI99NNYw1D01nboLQDoGLjS7DFZbh6D1KzJI7wcmDPvIy9snSFkuyOcpxkZYO
         0K9UTn8HWJ8bjwz0iWziJXlOWsEbeZjV6XCHA6nucMU96XtxVpK36JjKaedlYd3EDVFk
         /NK1qLJwqRKMDKTMlfKd+crulHSo+r1ALlPte+n5a02Bm2RzS1RNkNBKoVVj5wwyjeTY
         CjlX0Yt4FjHgxRk5U60Wq+irdAAnb+UKBKe5VTM3OUUAs9f9Y+N9hzroxKDdkLIODhc7
         Eeaw==
X-Forwarded-Encrypted: i=1; AJvYcCUbMqV3l3tajo+kKNmSMMUCSyLXvbgCckrg+Zg5FbZc3Txq01rSgzNldl5h0go2KHrERe9eE5DpCHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqQof4JEANwsMfQTk6bD2/lmlXS+Iw3EnELZAvSU90rHCiX/NE
	T8Li9gONpUmYHcbO+Zn3pGfYEU8cCOL2uTd/b2HcuhyKo2nn/QLMTLKDRVhpttjFGPw=
X-Gm-Gg: ASbGnctwDNfSsTYBeYk87ADoHoiD8a3FyQv4vPvnl2oOK0tItLC9Woczk6U0n+Lky2X
	Ye0X/l+MFszyhUrWSbzb0T4vGPD3YPl0Cj9BGp4PpNGqTUkibHOikF+P3nKO4yPtlbwIazDjK5T
	eFmdE1lI1u0kFAagLRrDLATwNY6Vg0yYY6UQVIZd8HhIzAnZZ8sXhWXtuGzYYB5oEZCxa4qObAP
	UJzcUmkBP/zwaWDMOHxFZII6U8xfDQzzMgJwPLfzgUejVK2osWxQTisXEFMRHk1es7J7QNf1Kjg
	aSBX/RSSo25s98/rxCzE22UUbpIsWKUqBsUSPyGNemVt0k0hLe9dTREas5qVTukxwC0r5R9VUJ2
	E69TRW8HrXibmaOMqYpKFxfpDQYQhe4dR/V2lzG1Pp2YheKgRAu6EVbRQjWGsdDWmvwNsnDyyID
	CVukGgxswwfUS9Mxi4
X-Google-Smtp-Source: AGHT+IGdI0GFFF8+9xDCagwj4MCOwEUqB1N0DZpsRtvn/B4KLEI2zmpucHSiVzTvwKt2YEcIpv/8lw==
X-Received: by 2002:a05:6000:2506:b0:3f9:6657:d05 with SMTP id ffacd0b85a97d-429907107dbmr2776319f8f.12.1761329311443;
        Fri, 24 Oct 2025 11:08:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429897e763csm10450792f8f.6.2025.10.24.11.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 11:08:31 -0700 (PDT)
Date: Fri, 24 Oct 2025 21:08:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ally Heev <allyheev@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Andy Whitcroft <apw@canonical.com>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Hunter <david.hunter.linux@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm <linux-pm@vger.kernel.org>, dan.j.williams@intel.com
Subject: Re: [PATCH v2 2/2] add check for pointers with __free attribute
 initialized to NULL
Message-ID: <aPvAm1E7CvQfOIuS@stanley.mountain>
References: <20251024-aheev-checkpatch-uninitialized-free-v2-0-16c0900e8130@gmail.com>
 <20251024-aheev-checkpatch-uninitialized-free-v2-2-16c0900e8130@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-aheev-checkpatch-uninitialized-free-v2-2-16c0900e8130@gmail.com>

On Fri, Oct 24, 2025 at 10:59:16PM +0530, Ally Heev wrote:
> pointers with __free attribute initialized to NULL
> pose potential cleanup issues [1] when a function uses
> interdependent variables with cleanup attributes
> 
> Link: https://docs.kernel.org/core-api/cleanup.html [1]
> Link: https://lore.kernel.org/all/68f7b830ec21a_10e910070@dwillia2-mobl4.notmuch/
> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Ally Heev <allyheev@gmail.com>
> ---

I don't think this patch is a good idea...  There are two issues to
consider 1) The absolute number over warnings.  500+ is too high.
2) The ratio of bugs to false positives and we don't have any data on
that but I bet it's low.  It needs to be at least 5%.  For anything
lower than that, you're better off just reviewing code at random
instead of looking through warnings.

regards,
dan carpenter

