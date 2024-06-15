Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D173D635
	for <workflows@vger.kernel.org>; Sat, 15 Jun 2024 01:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718416661; cv=none; b=fwMKVMbVTF65zdqnxVemxmsOIMuaYVzKL7l17kk3yBHEowL5e1gnSA6ZiIKaZObeJVwfn7qCgAv+KxcwGF9RuLdYfInT7t+AkvgMrBhl5zEeJ174jw2yboGl/Z/8ethXM78e2Rtk+9pKW+f0OCj/x6ngde1yxX73JjHP2fhDaD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718416661; c=relaxed/simple;
	bh=00qodF6QKX6kY5aVpmFn0IV6lZaTfbB/wM6JlDqCD6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlCi3QxJhKRrOl4nXeB+Z+kRMf81bDaQ0HX90cxkW0Ww9GmLvZ6+CyzAQPmfgY0kTa+JGdViUJ8ymvEyXu2oepcwskWEgO7D5/kQYmNCUQRHoQy1pJwwfFc37O6ZKVpD14kNRM6iHeKRZKjdc8v8vdarUwZtSrxFamu2ALB+gME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JgmvwduU; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JgmvwduU"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-35f2c0b7701so1610389f8f.0
        for <workflows@vger.kernel.org>; Fri, 14 Jun 2024 18:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718416658; x=1719021458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ABtmO3SynGCheUJoZZwiI9goLwucbtXdkggcFPq6bBg=;
        b=JgmvwduUaBJu8FuWyAm0SGwJVhw3fGy4fv5p6eqJn2Yeeu+F6J69jgowf7WtIICuNS
         oRFXy0lb/TYXHPEHToTRqG0g4W+9dLIi3sWtjINrotTcmut/a4fo88agCfp/IlXlqTuK
         eIgKp7Afe5byJUEZmNQ86hMP+IJEdP8+wkdxOst90RRKpe8bx2g7B1fQq4S8QdCimc7k
         ZhagDPSDPNtjzygQYNuUmi11Yaw+Q232WHl3HG8uuvl5T3WJwUpb/23PcPF4z+z14E8m
         6ehDnpcjgzD3y9moSLj2foxgyo8ko1+IIpw3ZdsJ2ovj2yhAt3D1QFiNp9kI0VtrbsXK
         M7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718416658; x=1719021458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABtmO3SynGCheUJoZZwiI9goLwucbtXdkggcFPq6bBg=;
        b=Zr7E8tuzMxmjmWUHsLEhCBxU7i41wCEwjIPGgdOPWy0T93UlM6oTwM0IY2if+D8fho
         owqSi+cHP/GLSTSBh/EKwTqh993eIK/3qVddVlFa0oDfJUG8EX0b4+RkKfAofiuSZOvL
         K0ntR7LauqPsfDY2Td1AJ13qFMxjMXgIIMpbdsajHe3TC6uXz+ClF7y6Bj0tHZaEm+Py
         sTkKJ33ElzHyR761+0FGBEtwh2rDO8mDYPHqszYudS3oOZ3edgmodOoQXX2a47DbKI2i
         M5sBwp9PPiZZKbFlnEn2uICMaFCaOQBs/PyJTHSx8Q7xHOj6lRCM48WUA3htDH673tmE
         OP6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmXF2n1e0XEOjWXxcih+/LV9xc5B7N5xfD+LNxvphb2nQoPYDb2gV12OwaDAPxQs4MLv+4K0E6jNrIz9y5aClYEF8dcV4cxrmO
X-Gm-Message-State: AOJu0YzYFV+YXPrNDqRmx46fhB+DzlPWQEZCsTHNG5oirR8Fud8oUN0f
	VrWeC4E+rJsdr9Kj3YCMYYYP+Wt9HWvuTKRxvxv2fnBv0uaCTG5awFCvywr7NM9qIW8BdC1zzlx
	IDa8=
X-Google-Smtp-Source: AGHT+IGR4zVFkXOonICx/mvA5JDvyRAE9eCUTxvhR4wF1jq/1vyMqD+Yqv9ypAbz/FBNfZXmV1CISw==
X-Received: by 2002:a5d:6306:0:b0:35f:b45:97b4 with SMTP id ffacd0b85a97d-360718de6a1mr6772651f8f.20.1718416658187;
        Fri, 14 Jun 2024 18:57:38 -0700 (PDT)
Received: from u94a (2001-b011-fa04-32f9-b2dc-efff-fee8-7e7a.dynamic-ip6.hinet.net. [2001:b011:fa04:32f9:b2dc:efff:fee8:7e7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc967334sm3717206b3a.57.2024.06.14.18.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 18:57:37 -0700 (PDT)
Date: Sat, 15 Jun 2024 09:57:29 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, stable@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: stable-kernel-rules: remind reader about DCO
Message-ID: <x7nuehxxk3cn3ra46abw3y5jks2h4ikwzc6iv7cmxw7sexla37@efgriowgekfa>
References: <20240606064311.18678-1-shung-hsi.yu@suse.com>
 <20240606064311.18678-2-shung-hsi.yu@suse.com>
 <0f7d5012-99a3-485a-b500-1d79d69a64f9@bp.renesas.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f7d5012-99a3-485a-b500-1d79d69a64f9@bp.renesas.com>

On Thu, Jun 06, 2024 at 09:21:39AM GMT, Paul Barker wrote:
> On 06/06/2024 07:43, Shung-Hsi Yu wrote:
> > When sending patch authored by someone else to stable, it is quite easy for
> > the sender to forget adding the Developer's Certification of Origin (DCO,
> > i.e. Signed-off-by). Mention DCO explicilty so senders are less likely to
> 
> s/explicilty/explicitly/
> 
> > forget to do so and cause another round-trip.
> > 
> > Add a label in submitting-patches.rst so we can directly link to the DCO
> > section.
> > 
> > Link: https://lore.kernel.org/stable/2024051500-underage-unfixed-5d28@gregkh/
> 
> Is "Link:" right here? I'd prefer to see something like "For example see
> ..." added to the first paragraph so it's explicit that this is a link
> to an example of this issue.

Thanks for the feedback. Yes that is better. Will clarify that, fix
typo, and slighly edit patch 1 as suggested.

Shung-Hsi
