Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C361390CB4
	for <workflows@vger.kernel.org>; Mon,  6 Apr 2026 18:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775498999; cv=none; b=eRR3BI3BlcE8dLOR8c0VDrYHyLbXDX6xwXHuRqLVUorR41bexmF823z3lB1buRt9i8/TFcVLMmADzn7TNnQNV9tJvLfGM9j2vRhOh2+gKt4q/eMtUV4qJ3yRZ7TTm7DAaLL9Pcr+bGRFh9fCuxax8+KX9wIDjfrM9A3EHwqXFH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775498999; c=relaxed/simple;
	bh=y87UGnEvy+KkqoyI9K6D3ZSqtPHNEV6mFem3Govbx0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guZSJyYah9nLwgeVQqQUxYl5RccPrqzQCiMXcYXsPKKdlIgl7u5IMWgcwYL8fosNwgvFaY2meNiS4eOnGnjtTZYkl0zB4LNqkDEy5aHHbN76jcMYvsoHcPMo08F6cVA8mc1z65UkscE5Dx7cAJRIP7eAGNTzxAk+auIEg06u4sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=w2Z4HDhg; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="w2Z4HDhg"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ad9f316d68so17225445ad.2
        for <workflows@vger.kernel.org>; Mon, 06 Apr 2026 11:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1775498998; x=1776103798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjRd2j/guPJEuyJ4mogcE8ofw18KOTulc7ao1ZGMUDs=;
        b=w2Z4HDhg1PJezTM7L4d7GIEQbA8nG1NcyAPPCtZXohOlyTaLw5WjEWbPxALTWJwdDJ
         dDha5Qxm7e6NSZGTmPLGi80ylGWh8iiBv/k8FpGYJcjMSYVoHE+Qkn6dvmSLpAQzZ/2o
         nXQ/4qAehKwWvukRxvMS71ksHiSlHVsnskXtKq0ASykSnr2uzc1QxRvhH2uM/Kjp+KaS
         EPPZt9uoNJrLvyJflz1pa6DDmejP/EFFDqaVPAhpM9dJ9GJWEcejPNtiDrpSxPSNoJgd
         nQH1769THVuM30r1Jz+p6+lgz6q3BFKg09iglaJcO4Zz3rz0TpE1mWFofryc74LlTYB8
         hnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775498998; x=1776103798;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KjRd2j/guPJEuyJ4mogcE8ofw18KOTulc7ao1ZGMUDs=;
        b=mw0xVE70rMftLFu/gEHnFoly0oaAyS3l0/oIvNNvexBW4hLd4SvLCSw45D7yuD9n8I
         iTNQBfYDFF8gp2ziaR9+B3+aGAtfjn9bxF4GoD4A0kSNqttTNSrhAEY+vw5TPjm9bt87
         aC1CbAk3m1MoP7nfmHO9s800emHSyZF85XaNRyaVYhGN3SQvPcigOAHQNXHwK1YphAbb
         RrqYj+ZKA4KZGqu/HQ8je0zsQO5mDIwniGS7Ad/NelHrqAD3CyEk7yEc02we2EvouA+z
         LXycF4gvqoO9xvRUVDQVWVQVZGctpYoD43JaouY4sjS8vdEPiUTrwORpkFpB5SpxzZmA
         VZsA==
X-Forwarded-Encrypted: i=1; AJvYcCUt21b48IsT8YcBHkp5dOiSGOc1JSdEd3A+u/4fCW2uh0X/lfJCU1x8BZ5Jx3mIbyps6UeO3ibJ6RY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsJlxbZrY38T2KWYgW7I0ye+JjqhYxDOySKeJrTo85KQgsx+Ja
	4QffDjppRW+3Z82bWgn8swlOhrlnVgOW92h+9uLyun3N7bQAMipalgnCowR+GXcvTzqm+n2g2An
	o3/YC
X-Gm-Gg: AeBDiesO9GOy0DG7c8UnEzftZNZXZQ2Wau6aiqx8N4sHXQYoNYeN9BfDBmZ6koxEFns
	uJf8ftJLr9qZHyW8CGoEdATZc53Kftr1g7xu5qOl8MXftl4fRChQkf9TrvKiuAMnZ/R6Np7kzv5
	+/YCYRhanHcpYOJG/AYhRBjL2O9keQqhaax4P0xOmXALtOwxv60GIe+JYz0y/GlTz9VVpptvoUD
	p2MOBxKDGQE58pV6dOz3eWvUbSE3VTXIztfk7bHh/LdTFyw7wtkfrddWVUdN2cYKtiZUM8GAzb3
	NFGMkSljoFLs68wQQgQv5U7Cx3Guz3g1IJ0Q9yhlb5HLvxKrmWsZcxkjMTVyfD0vVO+sYiCcpMH
	WNHe7u8dpWxROzuNZuEOrtmer9yTcXTaWOBpWQex/bgtuDJj+tpM+BF8JUfp5A+ho23RaVYDN0+
	3Q3FQ=
X-Received: by 2002:a17:903:240a:b0:2b0:c90f:449d with SMTP id d9443c01a7336-2b2816e7071mr138195105ad.19.1775498997925;
        Mon, 06 Apr 2026 11:09:57 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:8::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274757fa7sm143694175ad.21.2026.04.06.11.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:09:57 -0700 (PDT)
Date: Mon, 6 Apr 2026 11:09:56 -0700
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs: netdev: improve wording of reviewer
 guidance
Message-ID: <adP29EHk6Rgt2y7W@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
References: <20260406175334.3153451-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406175334.3153451-1-kuba@kernel.org>

On Mon, Apr 06, 2026 at 10:53:34AM -0700, Jakub Kicinski wrote:
> Reword the reviewer guidance based on behavior we see on the list.
> Steer folks:
>  - towards sending tags
>  - away from process issues.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: corbet@lwn.net
> CC: skhan@linuxfoundation.org
> CC: workflows@vger.kernel.org
> CC: linux-doc@vger.kernel.org
> ---
>  Documentation/process/maintainer-netdev.rst | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Joe Damato <joe@dama.to>
