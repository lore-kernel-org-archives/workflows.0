Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871008;
	b=uqy94g8mZOO8OodvR7HgtLGF4Tq3aVOEQJ5iNFKu8qyTrZg4T15NNUKUUY+ZhNdbGuap
	 IFvajg3SgfmoSsJwffwQ3APVJ8Ym8rqs/xd4OgZy2WeaCMQzosN8scfA4JYjlsRLVE67+
	 2ym1FU9/YqUGWmqZAJ0mL4vJjiWtvhmRfkel6A5QJgyARiXOv3P4ESZhe+8PhKNboTgUO
	 eoQREWBnTC52jhbSFk1pnyhKF9bwKtamtC1BO+VwhReSvBSyVN/aBtuVHSenJ2ejoXZ1G
	 i60Ez4ibAPiHdE/ebUgEhP403U2hL6lhhJrx9VkNIatP19AlJRIUaYyeyBo8//bYwzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871008;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=KjEnga27/tEerSydp7sFOusMCGvk8cn4l0RbuqweDp0=;
	b=2IsTO1RG+iZo145vjQEfVWlBwA7gWDxlukOCHq/60vBgHyGJ4jBnnPLO3/vEMbHovzli
	 nmf88QR84awBeYz5nGlrhA2xiV60Kxhr5zf1Y1dQfeHGbeLCY6jy7XZJDR19DbPvFOmX8
	 AG+Kkr6hMbi+e1u0neKyMrSt4RS5wJ6209MjXr4VXkU9p2mffR3fZPrBEryamZAjpvc42
	 h8MA/3HhU2EpZYrseTWzHHBPO9K4ChlaiaFe554q+QItX9coU/Yzhm+kUvzII4jCuCum+
	 9YvIOYyOr/bX3cd0LqZ62AEwPgRh05mXVL+yydtyLp0yc8U5JPk1px3LuyTg1R1oaOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DBA606A337
	for <workflows@vger.kernel.org>; Thu,  5 Nov 2026 09:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1DBA606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-990703f817fso816255241.1
        for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 01:30:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871007; x=1794475807;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KjEnga27/tEerSydp7sFOusMCGvk8cn4l0RbuqweDp0=;
        b=b2W2f8knmZmr1IgyaENuzmCH/qDcc0JE8pVldx3Rc9tpzJd8sz1IC6THc5hUIMxCLW
         +cy0dTC8xefy4dOtem2/6MUfckhKtWVE88KLLmMVYqby77An6YrZgXZ+oscavefq1gX7
         rZuL9qGddapL6qNr9N94MESE/BvYtTrEVGokjYKB5tFKBci5R0vVSCLQZSuqsmLasDxV
         hnPdeCNZdlEIJknVrX+fIyALm2DQ2j+GofIa/JAItJqC6rXAh+7MlDz4s02kKJTXAIx7
         AYbo4PJB/p/OC7wsDiBp18Kh+Hb6NttS2MQO88rYnWuMltzZ1kOu8pyyjXPIV69GBsWw
         /wGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcYKfI9T37/uETVHw8fO2xJGi5GMr9qf+JytbJEfA02uZc2i02mRbW31PY1NGqT/N17894kDAVgS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8obRU5rvRb8DHb1TQcmPzKiPsSEEH0BqA4sP19R4Z/aH/mG99t
	thndUcfAy0zgendA1+5dn2RnVAbDX6gA08lc4OLoU6Xid7fqdbBq258mJjamXDS5kXU=
X-Gm-Gg: AYBFou0COecSzIOmfh1mylCq+/kt8Df3Bj6dBlo6BfVt29vHlaT8i+jK/4l37jcBPeI
	oPSn+Zt6vXvt8089B9DPUw8ERFTY7kaLhZzR79SysU9IoIejw6W500PoGZHDbLdHqv0XY/CB1H7
	EaFEiny0SfDBBSVYP4VlebDp0/MLyzL9gpqW8V3eraYc1ODo7l8P09FkS7Q9M7F419U/opK2CZ5
	mQV3rPi0iDzxzZXqH9ocG8aubSENyZ9dxhFr1WZ2ac49Lvsyx2rmokgrBSgq4Z3/JafvUqG5Wo2
	38XTCI90jXzFBmgMaS5Mx/kKR5E+q0mn5dPRQ2iPVK4k05/mItsiapa8S/fi/SwdP9KbHpQDipE
	dnQAnXYhaqmJVuKSPnShpDf9NPDqFaTBLRxo39T/eE6FdU+LO/QOlGycumDeA/ndYS8rA8KvFSx
	Ca9hzox9huLXo5qpNHTE/3V5/poFxKD1hZVOxiB4FLqx+wimeE2T/Qv1VI7DbXVw8WTkx/9tNFe
	/FCeXYupf9X+KTeaMesJohmPz2diDkvtNhneVjlCnR2fK1gt1QF1IDmbzVSrYfSzyGbBzd9B0dz
	d2RRA4unR8+JWDTBhJpyIBtiNzDj5ccVh6u7luiyBDxEmT8PfGloPvkGo9NNpbsdh0mjoQlpiFK
	jmWYc7mxYfRYm
X-Received: by 2002:a05:6102:2d0a:b0:7cc:3eb0:6ef5 with SMTP id ada2fe7eead31-7d07261540cmr8814854137.11.1793871006827;
        Thu, 05 Nov 2026 01:30:06 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fdaf4efsm3489081137.5.2026.11.05.01.30.05
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:30:05 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-990703f817fso816243241.1
        for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 01:30:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzSYDhj+RwAtpaG9IE8jUT0YeQ4qSUTnIzDclqpG7AnWSWq/oMnjxcjER63aVzIiod6YwSkveBCK7w=@vger.kernel.org
X-Received: by 2002:a05:6102:3f44:b0:7cc:24e1:77b with SMTP id
 ada2fe7eead31-7d072270da8mr8474506137.4.1793871005148; Thu, 05 Nov 2026
 01:30:05 -0800 (PST)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro> <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
In-Reply-To: <auxHASG78dTviSz8@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:29:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWA1LNNaih3DHUM7yxpoyrnUndWDKpOjqb6_hSWWs7KHw@mail.gmail.com>
X-Gm-Features: AclHuK_4i6VsNysO9pD5FTt2GxVJKeNES2GdHJyDSBq2xm_0fur_LQOmKg8OPSw
Message-ID: <CAMuHMdWA1LNNaih3DHUM7yxpoyrnUndWDKpOjqb6_hSWWs7KHw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review tags
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 10:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Reviewed-by even with the "# subpart" still appears in person's credits
> > and reviewing entire patch of 700 lines of diff code (like Frank's SPI
> > patch) is not the same as 10 diff codes for one driver.
>
> Yes, if you want to spoil that, you'd need to introduce
>
>         Partly-reviewed-by: ...
>
> or something.

With a parameter taking a percentage or number of files or lines,
to serve as input for the Big Statistics Calculation?

Doh...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
