Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AF4359F89
	for <workflows@vger.kernel.org>; Fri, 16 Jan 2026 16:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768582743; cv=none; b=to6gL3uzyneU3nJ0KTdAjk2MV1zR2OcYGAaJYiAUWA7hilHUYnCtM62KV07xzeKRilXkrPKPkh+AzNEnou7+2hH3BntuA+AC3OrcaoY2JOiQoQpT96ZM6MMqcKVLiGIIjoEad52mKSqfT+mjHfDnRx3vgB7DHPQzKEgIYrOfY5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768582743; c=relaxed/simple;
	bh=YOAJjjvJ0KI3T7moFNpFNWwLaSdhr+TLM+PpaKu/Aoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXkypCPKyV3kZNz0Wa5VVkprVwqIX2+vOx17AOBna8FF+/YlroiWjSGXoUGkKJJ3lgHD+zBy4YiZ2eJA4laFB6q/jplXi628w9X6lvBFZGzDr16D93EKjUEntvInyT31otRGMr95OwspP6fmBiAa8jCj7Pr6FTXzj3GnvTK+WDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4G8frRO; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4G8frRO"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81e98a1f55eso1204365b3a.3
        for <workflows@vger.kernel.org>; Fri, 16 Jan 2026 08:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768582741; x=1769187541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YOAJjjvJ0KI3T7moFNpFNWwLaSdhr+TLM+PpaKu/Aoo=;
        b=B4G8frROqjrH8+t9zeH1nk9lYqMYkEAvU1PCoErOR4j8Th6W4NMKoBmDlGDN61L5Gf
         /DU74iYNHB1uTE5fNy2uY60FdoX13YluDt575PmOQFBva36hSruLcMwebR6XeYGy7kIT
         9pHl2pq0KPxYjwVL6L/oM0l0zhv+yj/rx6/aOxpn9SQPrb2iFMW929QK3CwPPRCWNJ/U
         l9O00zZWi5rBhIrE8QxO4/8f+2T+E0sqLv24c8bOLCETGT5HAOgiknjee3TYGvbY3Q//
         5Dk84QYZUoXw4THch+zwCfx1ZMvxdZ/+nZfLQdkYVg1cKunrHvMAGyjt5qbYjOSc/stm
         PD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768582741; x=1769187541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOAJjjvJ0KI3T7moFNpFNWwLaSdhr+TLM+PpaKu/Aoo=;
        b=p6ME2hT5ONOudYNiO+VgBblz/8kOXz+li1FSisK0CUQkWd1OVGNGfoaRDBrhKsCpsO
         /YZkA5NryAcnEIvt3Thm8aG8NghrZS/cHnVv42Nq6qlXXtqZ6429t7SrFNdJJyZGmMvR
         PsWKRByRIsh6iHD4pj7pYz+qOJaHw9FRNRRhxDC/QMwDfnK/aI6rHieIp22NaUMbX4/n
         sF8Vgn5c0I5Wd9A0jYK3d4lbmVR35zZeOGBDv61LWQZVmxA6DhTB9Th6tM+lOXFjkENN
         p/G/hrW4uIIDKVUzVFHOLckmDD/Ipk3KVwloypWX7bLIQ5r/jlvyxVzqJgNzbYMt3TQv
         3Syg==
X-Forwarded-Encrypted: i=1; AJvYcCW+6B32KG4oUpt5eBNl8/A2bWK/Vy1acl/WswYWhsCeFf6nU13Xi5uJIGC2lZm3oJYSu49BkfspxNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZsHrEnTat6YunvKA1uht2kR3hLNFftGok1sSSW8drvz19Wjtg
	fgzdlrkHp+ER1eKS8SNsHrGqhQiTnu0+8RvWrwsuGOEcn5Kh9nocT3vY
X-Gm-Gg: AY/fxX41pQrEowKS2pJLUyal6gUDmsh1XVL/WW+XXe/Nt5D7T29PLf2L9mXbbSYptLY
	iAD3ag7R/MNGRAixBLRG5F5Mbplm/Dp9RmCbJpDUiu+xT2ZEg+mOJpd6mRhiMmiK1GvNVB3HFJ0
	ECiPa1u9el61zyXn/zm+qVoMT/ddZWvFFMMm8rp2W+gShb9shlFxUsi3ACujy9sbpX9x+A9P+bG
	po/xphf17z5+Xbu1q0gy2Culo4hj5/gv97DSA76bimimqjgPT52+5m6uaqL86Jx4zBoGwXoqlNh
	vQMvBlKqqYZn9pPDoi3+RqYTcmrYPGQDnlIrMt5ENvJcTfjwD4sdmnKmw7ElJZEAGXu504XgSEn
	gdsamxIG+LUbFH4MLBWZUFOQmvDp9XLCzuH8S0OiIV7MROK+hrBLVSMmm40iS2hLoFRNJfUXFFQ
	seVNHRu0M=
X-Received: by 2002:a05:6a20:2586:b0:364:134a:2bc1 with SMTP id adf61e73a8af0-38e00c037f9mr3365273637.18.1768582741111;
        Fri, 16 Jan 2026 08:59:01 -0800 (PST)
Received: from fedora ([210.228.119.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf249fcbsm2576872a12.12.2026.01.16.08.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:59:00 -0800 (PST)
Date: Sat, 17 Jan 2026 01:58:53 +0900
From: Ryota Sakamoto <sakamo.ryota@gmail.com>
To: David Gow <davidgow@google.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] kunit: add bash completion
Message-ID: <aWptnVymdfj3-t2l@fedora>
References: <20260115-kunit-completion-v1-1-4de6564962c4@gmail.com>
 <CABVgOS=Yn3K+Xzq_3tb0LCrX2eJjU5AG38uMwHaa21nXfxsjEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABVgOS=Yn3K+Xzq_3tb0LCrX2eJjU5AG38uMwHaa21nXfxsjEQ@mail.gmail.com>

Hi David,
Thank you for the review.

On Fri, Jan 16, 2026 at 05:30:22PM +0800, David Gow wrote:
> Two small suggestions:
> - Could we add './tools/testing/kunit/kunit.py' to the list of
> commands? That's what's recommended in lots of documentation, emails,
> etc.

Sure, I will add the relative path of the script explicitly.

> - It'd be great to rebase this on top of kselftest/kunit -- there's a
> conflict with your previous patch.

I will rebase the patch on top of kselftest/kunit to resolve the conflict.

Regards,
Ryota Sakamoto
