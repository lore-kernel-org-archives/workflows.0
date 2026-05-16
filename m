Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79473D88E1
	for <workflows@vger.kernel.org>; Sat, 16 May 2026 12:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778933492; cv=none; b=m3nBJAHArZMw/kRjyT/E3Xonrwr+AEdvmjtatabaZeY+WT9zHwoj+K4XjVtnX6ny0COrrYPvH2jSWlNuvqgC6SPb9JanfjjgY8O3/jeS0A8x2qKUZQ7RqYXZWsAVGxHO6169FZJGo/wb/WSkZ1Ml7QYEREq7N5jrDXU792oIkwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778933492; c=relaxed/simple;
	bh=Z28oTA3GMSXIjm6qDFnu5n/viFA2STRDZfrShD1dZck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxgYTg7pFo233Wy5C6UmuL1MxgT1BiK4X3ahH7J9/z+KB8bDdgSz/WgjKNeczP1R4rCVkbf/4nBtAVfKqSS5K1UrFx4XVk6YHbeixwRe8u9mBWGmynA/EZ80duJL2+7tb2wQ+/E4D12VRCeBaOB+oKAwZacqs7yaB3lKyDYMniY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjNF0+KH; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjNF0+KH"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c15849aa2cso779066eec.0
        for <workflows@vger.kernel.org>; Sat, 16 May 2026 05:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778933490; x=1779538290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcR1L4lWy0FktqufnY8V8UAksIVyQ73+bedTGKxuci8=;
        b=UjNF0+KHiwq+Ohy4D2NVtIlCSgnH7CdavIFdsO+dd+R2BEGen3s7CSRKmYR668yAz5
         33++ZWg7+gycIqRLT/zsZ3lJIEwQsbxhpXX7S0GAkK2rlp3+Pnon8VQSIL+eu6z4mRHX
         tDygjq8HbuCD2z3ORr2nlKDB5tDMM67BwSdHRT5MeCS91zzJe2bukie3Qgzs9qofsfpw
         iAkcgbh4z+WIMI1z+8nNfx0JsJ4j2jjz7+a+rhiJkAh3Gl71qS+LmI5QivW46fVDuxcz
         iDT6NYV8kno9+AUdLlfv+JvC6l5VczPXtiR4yLuzevZ+eU/8A37xTuDW2Aa/i2BwDEi1
         JArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778933490; x=1779538290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DcR1L4lWy0FktqufnY8V8UAksIVyQ73+bedTGKxuci8=;
        b=geO39HX9zpvbL9ifMxO5hCNfcxdLLh9VVpKWZ8lPzxZtuWEW72H4YVHOXwTJrWVxlM
         LENl6we+CZonE1GLuxfQrZ4EA8qfmfkiy1v7DJnx+YXEt7h3FNNi65lNfO4Ad+x2a/zZ
         p4NpCc+gOP90U86uYcZ31cQ/+uXTUfg5JTgr9z2lwixesUHoicrdJu5bkiiEuQrqRfWY
         L6+CA1PK+7PmH5Ebkuvejz3IKJAnUT2rsnlSqf36FqPOkutARCF11puAbGlR/+jf46sm
         JQ+r+CBma/vRh0grsgfVtl+EFLaTp20jdtWxtztUk+PHJyz7LQn1cdnoZcf19hQ3IVoW
         cA3g==
X-Forwarded-Encrypted: i=1; AFNElJ8MjRq8nOUWvltCZgv6x366bq0d0LtJLaWVCnRevkqh3+sxrVEb+pJu2QXE6Vlxe219jZs84lPQucA=@vger.kernel.org
X-Gm-Message-State: AOJu0YynJ3E3B13RsOyL/YI5w3U2Uzf6yD6vXlepuzoEugV/tpQgfKUA
	hjuTHHxrIE83GYGSuelnl3mlJ9czAIJxe65furm5+UAsN/tFuil7vYqy
X-Gm-Gg: Acq92OHJloa215yF+0qGHjfbeu95UHjJ0i5IpBxAclk//y9xiT0VfzC61L/0KHPLcbD
	8DT9Rc8d05MPKFVq7vTnxYGZCypWOMy8dHgyDLi+T4In7HXQW/lmrAIOX5r08timRK6gilHlUWd
	iYLvPYqEO8GJwY6jVVOFwUfDbaWaS+ua1DBRYooKfqDNtYV6LL2R4i5JdBXN/9H6proYF+XIRll
	AEa0ykgolocqyoinUU2tqli2Ky9nvW6KvZFzBLmHmcuE/5VhlY7V26LyVvO38moeAnjlpKrjOwa
	lchQsVEN5rZDsPR9dAk6ROfijL2yYPRmuqGxtcVtA5K4DGm6HfAZM/Qqh1YrgBN3iqXKwY5FvFA
	O46Ohc9sNQR+Js9TyxrLin5RQhNbMWDuXl9FDBgMPX9PRZL20DRoNNP1dWGU3+c0LkqtxvsG9cX
	BD/DoFvC4B8koKONKgFmTb9f/M1oDZiJWe2vJ7dXTzGK6hRl8aAq6kSwrZxA==
X-Received: by 2002:a05:7300:dc03:b0:2ee:be86:7b90 with SMTP id 5a478bee46e88-303986b1538mr3431840eec.29.1778933489890;
        Sat, 16 May 2026 05:11:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978afdd3sm9763251eec.29.2026.05.16.05.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:11:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 16 May 2026 05:11:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	sashiko@lists.linux.dev,
	Linux Kernel Workflows <workflows@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <fcc4b719-2696-4f31-bac4-6c07f8ddec47@roeck-us.net>
References: <ad139e54-a7f0-4d09-832c-6b2bf2e93e03@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad139e54-a7f0-4d09-832c-6b2bf2e93e03@kernel.org>

On Sat, May 16, 2026 at 10:05:02AM +0200, Krzysztof Kozlowski wrote:
> What the hell is that:
> 
> https://lore.kernel.org/all/20260515190707.033BDC2BCB0@smtp.kernel.org/
> 
> As a bot you CANNOT MAKE a Reviewer's statement of oversight. You are
> not a damn human do be able to make such statement. You are a bot, a tool.
> 

Where exactly do the rules say that ? I seem to miss that.

There is a policy document about _contributions_ made by AI, but I don't
see the one that says that AI agents must not provide Reviewed-by: tags.

> Stop faking tags.
> 
> And really, considering how many false positives Sashiko produces, how
> poor review comments it gives, how many misleading comments, it's
> unacceptable to me to consider that a review.
> 
> Amount of useless noise Sashiko produces already changed my mind how
> useful that tool is.

We seem to have completely different experiences. Yes, it does produce
false positives, just like humans do. However, I have seen it find many
real bugs, including many in patches which already had Reviewed-by: tags
from (presumably) human reviewers.

Again, it appears that our experience is completely different than mine,
but after several weeks of getting code reviews from sashiko I do have to
say that I trust its review feedback significantly more than human reviews.
Sure, it does not guarantee that a patch is indeed bug free. A human review
doesn't guarantee it either.

> 
> I will be NAKing every damn tag produced by such tools.

I'd like to see an official policy. Until then I'll ignore your NAK in my
scope of responsibility.

Thanks,
Guenter
