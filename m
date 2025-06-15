Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379741BC3F
	for <workflows@vger.kernel.org>; Sun, 15 Jun 2025 07:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749973039; cv=none; b=Z3t7qRv3A1xBHt/guhGeybHxixgRqdfPRrRT8cw9Jbso6pvKffV92IQDrw5sdoL5f8481fFy4cXkXmSmOb55ChrvwhImgyEBEADPOVRLgOoGxWS557+3pT7wnNecM6Wjg+Ii8bmHZVcXSRb6Ln49/wJZn1Evl0OxPaGRilaOOCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749973039; c=relaxed/simple;
	bh=gmI+OB18/aEFLmeG+0NzWDalnJ1KU2lcY+ijh5E8H5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqQlzMbjPb/Wex1F9tIJwKqfYQFATmByqytiXc3y/1mVOlHdfxA4n256Db3jFId1VwYnwzxOFJj4AdeQnRtFoOKYw1oa+e3uDbbYkYk4HMRuIOzwHXO3Wk3wwD/7bc/314wfb0X+k/5ONe/Te9uHRLTbS7F5k2fJvY5ZAQF16Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=xnMDdUIK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="xnMDdUIK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d7b50815so27601235e9.2
        for <workflows@vger.kernel.org>; Sun, 15 Jun 2025 00:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749973036; x=1750577836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZe8uQenlqylTmWqNC2hIY8BhxwJwY3Ls343kx6UWFQ=;
        b=xnMDdUIKJPMVG2IugNAPrWYQpsfUuBz+NiDCwuiKaSd17T15lDcS4VLBHX8j9aA/gX
         qxTXl23somu9+2UCHe0xD0GFAnc5JeETz+/n0OH12B72Dee+1Cx2TVhMPxzUuWYO58c/
         0Af6K+4yK0+RhgVFLJX6DTwv9PdymbFhWSeRwBSyNbsFbXp2rQjc/86T3SHgYJxx6hvr
         jtXz6zux1pH7G1bGva/2RR79eyJQOyaNOlsG3ApxSWKhLGzZTkRPZqrXIVAB2zqIqppQ
         S3CxE19XQJNUraberPbxmN7Ko3Z9dcxkn4lF5YxQSiDSBDgsgkwHYbyMwg0j1xkhXz+n
         R1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749973036; x=1750577836;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZe8uQenlqylTmWqNC2hIY8BhxwJwY3Ls343kx6UWFQ=;
        b=vwaEeID4UsvmeKo7aP3gqvL4tCkzQtb8fXCsjoDJV3ctB082jdu4Ghfy6nFiR2fJZx
         p+qDahJADuHzKPFOf4sXQQkftaXfgq77a6neK4KUX8XckyPiJiw/G3l6kGXxcwU9oONJ
         iOYZ/wCe+T+sc5knPsvPz2XkxvCRZhcRCSjXyo80Zceq3FCyih66uM7CNNdu/gwLpaB3
         8ClwcNgRxGqYSvAo6c6kovr5/8NtNT14pIGoN2CY3j4C+UkfEapBS9owyO2nOLJoTgnr
         X07y1KRBrHTDJmnbtWzQSUw/jvl2aM/4ORxstlps7m5ljHl8une2jDFuciTutkFwSIiS
         YRow==
X-Forwarded-Encrypted: i=1; AJvYcCWKI/6S23woqHnux+Og7zsE3uCVJesqbE3d5fknb93bb3IQSr5Nj4pc6c3n98l5O/twgfweOUrA2RM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHvejiBQQAMVqxq0lfTibE/63dI4diKVhjYgWEU0oU3oes0Isj
	oQhX7Bv0zGUMNjoCF+GCqLjfQgPJO7AjwKLdZ5JPQJ4qt057HJaggRBcmwHNWpA3hHA=
X-Gm-Gg: ASbGncsTe4gPxC0fjnZhXfHkRodmCI+PNYcGCznJnLVBKQqIyrVC/zDqW9uA2LhpyTU
	JG0LMfbKR5QGwXOns4Qm/s2L5kcgpc6mkVMZXXLovXzFSVU39Cjo7p/hNEEs/N+cZyd2NfbLkwE
	AwvfeLGSWXwaOxGeYPEOgo8lehtn5YZQU1o3HwDFCcgEJtbNt0+ufs33B0A84nhNsbfwOhzewmR
	szyBtP8ykYTKIhTzeWh+5HzAp2XFOVqjGSLnv6SFycNkEWgNx8KBpbtcHec4Hyk6fUatwhU3n5o
	AlCr+bz6KnrFF0LKyDJuc2XDdoBgvUR2InpLTQsbUlvxBVpvZ0fUerKGTOHZg3YDB9I=
X-Google-Smtp-Source: AGHT+IGT3aOKYj3HxP/dNJ5wrtCJCS4jvbys/KYqEQvAxfZyw3IyNpDmpHTFfLaisw6FIEWMgIolQQ==
X-Received: by 2002:a05:600c:83cf:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-4533cb3bd51mr47139255e9.19.1749973036451;
        Sun, 15 Jun 2025 00:37:16 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e253f64sm101318935e9.27.2025.06.15.00.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 00:37:15 -0700 (PDT)
Date: Sun, 15 Jun 2025 10:37:13 +0300
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH] docs: process: discourage pointless boilerplate kdoc
Message-ID: <aE54KSsCaTY5cxri@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org
References: <20250614204258.61449-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614204258.61449-1-kuba@kernel.org>

On Sat, Jun 14, 2025 at 01:42:57PM -0700, Jakub Kicinski wrote:
> It appears that folks "less versed in kernel coding" think that its
> good style to document every function, even if they have no useful
> information to pass to the future readers of the code. This used
> to be just a waste of space, but with increased kdoc format linting
> it's also a burden when refactoring the code.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: corbet@lwn.net
> CC: workflows@vger.kernel.org
> CC: linux-doc@vger.kernel.org
> ---
>  Documentation/process/coding-style.rst | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

I suppose I am guilty of this ;)

Reviewed-by: Joe Damato <joe@dama.to>
