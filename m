Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC963806AF
	for <workflows@vger.kernel.org>; Thu, 26 Mar 2026 14:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536802; cv=none; b=iLr2lyF9Q0ykM+SwtyigOIBJjn0ivkMzDt4/DkMlYEAN4tbMpKBf5DT7dmupuV9GJ+vDbR/o+4dImJoN8Dj8NyVMNAg+R+qKw6EVMF0YF1/xotfpKTK1ZegSSADQA51X8plBvyCuGaONXCJUUpIsHUCb+DJtkAUzjnux6u509cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536802; c=relaxed/simple;
	bh=2388utc9394UFJS/UPxBTvHU8BTZ6fiNdrXOl7m7DM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQB0PjOFKCHJMNj9NdqJir0eAUx1efCnHRQnW6xW+r+Db7m9AklMrHp58K372/ZYmMZKo1IuKDtlBmH9DgLT1R7WI/WvNa6OKbeHTOs2xcd0xgEcMfMpHNC/tDZ9cnC4sCp6WOB56TEiQv/m6yXi6UwEA/ZvpKN28ZGCKkaYNuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAuQoxam; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAuQoxam"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-128b9b7e3edso99093c88.0
        for <workflows@vger.kernel.org>; Thu, 26 Mar 2026 07:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774536800; x=1775141600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=73CDRh4oXvGZ73Mm/YRLMvHfAk4P55rJanZOEN5QMuU=;
        b=hAuQoxamFzwL3heHjqiZdcDHYXI7ggaUCenY6xjUEmHFeYnDOn8hplwr63FRVmMY35
         EBE9loZJkqe7yqJV3oCFCqkSGCJuvvfZgmvpqW2FYI9nItxwQXeOhttqx0Ghz8hpxZrZ
         v1QM2RNXL3n1ShHHJYu153TR+rnbC+cOGA+JDsbX5VYgZGPaP7FUZ9wFUZoe58PVLGVL
         yiS9EoeI9oPqATnNjFZyrfAwyNVPr1vSjMGsLXZIrX4iXKIMLFkBLnLedIKXEQXqYFrM
         l+2DOlNT1GySAtEgwRm+GCW5NH3wgiJ47jIA58CaIvcIq8CBfxhTd8M0pi4ERW5zC1IG
         zyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774536800; x=1775141600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73CDRh4oXvGZ73Mm/YRLMvHfAk4P55rJanZOEN5QMuU=;
        b=ClvWwNFE1JMEXwhDwE5zUNw/LEq6H7SJHXPG5vqHV2JBCmPBccyu00jUwbWuaqn9DB
         KAaAAZpjcJt0+Q79kpnZ7uEnVc8VXg2CyCOlqh49fNZ/44Uh0tJerjZE+7gzBHdMVRMl
         ZuGcOw2Gwc4/tjLNo7UmtnFupfmf7YKMAGPeQpVXdvH8BNyYYB+kwmGBxie5oCgT42hH
         leTQoU+BXkatviXMZr79KRnOu8dUYnePMC001TTtbtMDUSaqFUJXdzjg+EYAD+XOal78
         xHUR9JhHu3dmEKsaQLGULrdL5COGHn3nh5p6duCxM/gljrAX+4cEpJsrwOtHKVDMb3TI
         gWnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFhaX3wO6lv+i+L/YCi10lfVqPE/rsLBsyojwOs/hp0ZO4LeDzU35GNynq+7wiXIFSgBEn7tvOfYk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2wDkZxvNiNYV1vyKMTksCLTl+lAQYsplFYwffb4kuEv4uJ0m6
	ocJeJPw+KgEwuSLcg5r7CDoXn+Ti+s23A2lXsfYZ0WPb1TEePuJG7r5I
X-Gm-Gg: ATEYQzzPqhtKlTvZoIUT904kzx6kIxB+iphOJhBqI4uBP/Q8qNDb8xWbTRqsv6E6xvP
	eHE0th16QbS9OIpPRy3qID81gfO9j/tl6tnnlkLiNto/MOUEKsJiTX/jHyXK64E+ekBslMahmKW
	Zbx9drP37dL3G3ELusUHzT0P7V1/PRzsET4bvT/U4oCJiZ5WedmH8oEvU4xMRr8zpHn6FXUi5Tj
	AKEPFSKONIzc1p4WOzouG2ZD7MDgcIcbgn5D2576yHrGw7EppWwq4Y+pcduP/YFmWzLVM62Zj/1
	YD6Ed0ApLFtUJWFmsZWyW8U8a0MYK2kDmyohXRUFzma5iL4zcw+9z3LUBe2uxoR1q5lsV78hGWN
	ZnwKdD3a4j8FqkDt29OC9GBEoXExICTwayZiSZCF+GXJP2frzXDaa25YFor45ITKGN7Xlq9hoJn
	uQk7hqdBZm8rUVIpDUoorA8tNFLbHK8+xL+7MR/yGJcAdsoi5rvq0zsMCimBMMlml5
X-Received: by 2002:a05:7022:e17:b0:12a:7181:2f1c with SMTP id a92af1059eb24-12a96e6b019mr3622063c88.17.1774536800232;
        Thu, 26 Mar 2026 07:53:20 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7b4:352d:eb23:66e5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa7248731sm3357533c88.4.2026.03.26.07.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:53:19 -0700 (PDT)
Date: Thu, 26 Mar 2026 07:53:16 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andy Whitcroft <apw@canonical.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
Message-ID: <acVIBseRrqJI8Uwb@google.com>
References: <acTPXMJfkHLeItrK@google.com>
 <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>

On Thu, Mar 26, 2026 at 01:46:49AM -0700, Joe Perches wrote:
> On Wed, 2026-03-25 at 23:20 -0700, Dmitry Torokhov wrote:
> > checkpatch does not handle full files well when they are passed on
> > stdin, because it does not know how to treat the text, and whether it is
> > a C file, or a DTS file, or something else, and so it assumes that when
> > it works with stdin it should be a unified diff. For full files it
> > expects to have a file name as an argument and read the contents from
> > disk. Unfortunately this does not well when trying to use checkpatch as
> > an online linter and feed it contents of an editor buffer that have not
> > made it to the disk yet.
> 
> Why is this useful?
> Why not save the buffer and then feed the file?

Because when I am editing a file I am not saving it all that often. I
want to have buffer diagnostic updated when I leave insert mode in vim.

Thanks.

-- 
Dmitry
