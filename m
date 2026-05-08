Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6C53D7D6E
	for <workflows@vger.kernel.org>; Fri,  8 May 2026 18:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778264941; cv=none; b=HtFEhjqWUk8Mc9UvhlwJJ/pbXYass0oK7wV+LTgYHDfXYEFZtgrf4Qe3RWlhwtpJeud2Mh+ffIw8doPlYVzjLKCKVPrJCbierkgEL9uyy542/nZ2gW5QgfO8VsU+D1C0KIgrpL5OXU0tclgn1Pqyny588mWE6hmED0idYzkj0T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778264941; c=relaxed/simple;
	bh=e+hoEU1BVnwIhgWSnafe2Ncw2XQkEPQSWsM97UwRlqM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dn+7zw9ltBKV/+34NFGdCDSftHMre8BL67wZVtEc3Lni62PZ0ka9hvg7KVyIjyN7a9EWck2Qg3MCAaOhkGGhw26CKIBcTcy+Y/50Ut2gM573JV/VMd2iCnzZQ6FApOFONOKtwrAE3/sqYjx3RQnNMNTvcKQfb8G0GrZ9zmsXkh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tA9+tX1h; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tA9+tX1h"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so20771825e9.2
        for <workflows@vger.kernel.org>; Fri, 08 May 2026 11:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778264937; x=1778869737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVMKZWAk0SD1GHr6tr/9fhB28kwxhrp+So3ZgzrkNIs=;
        b=tA9+tX1hlqIMJBQp8pL1dIdDwcZjzMQ9wtubMLabRWf7K0bR/A6WIro+Q2O1ojvMWk
         SX1rlwnFZNY5snfZhVIyu0B5KJUVmiELdEbMx8RZjQJoA36C1ABXz1fpeSbOd4WJnHtI
         +WuMIPxhbuLVXl9UOph4WsZMWrS2Qpla0uM5c6g/Byq6ekq0OqF1+h0Zxtdz/DR43d9j
         F54CLJnS9JOXI+6HJwnka4w8Jl+Io0316vhvqY0f7XB0vI/U07D2UUnJO0lUMGZ5nQaR
         YZKwCiYkvoN1QIspHuZQTB/BS2RIddDS1arJ4gJu96GfUyp0DJs0BkMtYC15aPhd57Uc
         g1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778264937; x=1778869737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oVMKZWAk0SD1GHr6tr/9fhB28kwxhrp+So3ZgzrkNIs=;
        b=GBXa0vq4enY7eLsQvS+eKlrbNFP6wVYrLiblMd5pdF9EQeOWQv08pzQpGc0AmFI8k2
         Gq9QpS433X811V+vvT4ofpWoLnDcCtgyZgxDeCvnNvPSF6XIEDCNwXm41wzNT4G0gihA
         zrJa8meVcTtytJ0ZU5O2YBdTl3tosHqquCVRo4pIgp1mxl3EkW97/98osXihnuVvDKAn
         E4qbJQSrjkSxvlfPpJ2aRiGHw3IaWpwTbxTR5ZcmKmA0o/rbEoamX+NlQEr0KTywmHy2
         PFhvKRkiJQttuOXSNuHN6VrIqSBlWn1MBC6ZY8GSSPVZeqIibf+y+ukeoVt4ziPVn0Sz
         BSrg==
X-Forwarded-Encrypted: i=1; AFNElJ/w5f3LM1AmLsHpIUkqCXvYYC6ArzUUiozFAEt1ShL0UtOEF11veyNQ1K8eMmvgszKMACFngaJqZnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUGeqUWQ7b2WKTdKQKo6eTNBsPpRQkUgvKeKVBih83W7vbgIpR
	7Nf/UcxeRtHTgX5ErjFlh6OaVQIbjuzfPEf3pK5fiTmfdGCKsV8JzfBT
X-Gm-Gg: AeBDies7j9gNH5SCXNKpHZJ9lb6YirvLlTFKbk106TWbFBor1dotRSqv8OFdXI5/TWH
	iYHcdwTzNxQ5Fhg/1KReqGv1cFxQ5VFA345yEgePatDhR+p+cNI4WBSykchYlKgyoNALh5ry5Ml
	o9ToW/EpwDN70aooyA5eZARpOTpUYdIMF8ENqr58Sx+t0ahHgHVoxmSb6MlV1uQ7tmFDFzKWNIg
	F5LgsOgY7/wNnXnGmnUoevgjSfCJ37ofLya/rnWw0a8NkMhxDfbRhdiBax3DTOvm+wH34vB82IZ
	YQg8GAaVkRnT0jfSUx2fiXTJ4JeOblTRrIDGFLE7KkwZKxRoP0i46lqembIth+Y0TqF85+8jtl9
	v8ucuqo3E2Fal6libIZX9dxMMoae+kZ5CPtYbVhOPozZdlJu/xyy962CDs0xEeEvNCWdYc6S5KT
	Z0OETogqLQG38EtjY15crH1aP4FsX0xL6W/n3Jc/vXp1EtT3Bgv3/uJkuBQ/NbT9wT
X-Received: by 2002:a05:600c:8011:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-48e51e1a545mr213241825e9.10.1778264937224;
        Fri, 08 May 2026 11:28:57 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dd3fd0csm10812815e9.14.2026.05.08.11.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 11:28:56 -0700 (PDT)
Date: Fri, 8 May 2026 19:28:55 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Adrien Reynard <reynard.adrien.08@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Richard Weinberger
 <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes
 Berg <johannes@sipsolutions.net>, kasan-dev@googlegroups.com (open
 list:KASAN), workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS),
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 linux-kernel@vger.kernel.org (open list), netdev@vger.kernel.org (open
 list:NETWORKING [GENERAL]), linux-um@lists.infradead.org (open
 list:USER-MODE LINUX (UML))
Subject: Re: [PATCH 4/5] docs: fix repeated prepositions across
 documentation
Message-ID: <20260508192855.3b024c83@pumpkin>
In-Reply-To: <20260508163804.16267-1-reynard.adrien.08@gmail.com>
References: <20260508163804.16267-1-reynard.adrien.08@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  8 May 2026 18:38:03 +0200
Adrien Reynard <reynard.adrien.08@gmail.com> wrote:

Nope, all these are correct as is.
I'm not looking at any more.

> Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
> ---
>  Documentation/dev-tools/kasan.rst                   | 2 +-
>  Documentation/networking/switchdev.rst              | 2 +-
>  Documentation/virt/uml/user_mode_linux_howto_v2.rst | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index 4968b2aa60c8..3a8bd40ad905 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -392,7 +392,7 @@ reserved to tag freed memory regions.
>  If the hardware does not support MTE (pre ARMv8.5), Hardware Tag-Based KASAN
>  will not be enabled. In this case, all KASAN boot parameters are ignored.
>  
> -Note that enabling CONFIG_KASAN_HW_TAGS always results in in-kernel TBI being
> +Note that enabling CONFIG_KASAN_HW_TAGS always results in-kernel TBI being
>  enabled. Even when ``kasan.mode=off`` is provided or when the hardware does not
>  support MTE (but supports TBI).
>  
> diff --git a/Documentation/networking/switchdev.rst b/Documentation/networking/switchdev.rst
> index 2966b7122f05..948bce44ca9b 100644
> --- a/Documentation/networking/switchdev.rst
> +++ b/Documentation/networking/switchdev.rst
> @@ -162,7 +162,7 @@ The switchdev driver can know a particular port's position in the topology by
>  monitoring NETDEV_CHANGEUPPER notifications.  For example, a port moved into a
>  bond will see its upper master change.  If that bond is moved into a bridge,
>  the bond's upper master will change.  And so on.  The driver will track such
> -movements to know what position a port is in in the overall topology by
> +movements to know what position a port is in the overall topology by
>  registering for netdevice events and acting on NETDEV_CHANGEUPPER.
>  
>  L2 Forwarding Offload
> diff --git a/Documentation/virt/uml/user_mode_linux_howto_v2.rst b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> index c37e8e594d12..7b08738c30aa 100644
> --- a/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> +++ b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> @@ -1092,7 +1092,7 @@ be formatted as plain text.
>  
>  Developing always goes hand in hand with debugging. First of all,
>  you can always run UML under gdb and there will be a whole section
> -later on on how to do that. That, however, is not the only way to
> +later on how to do that. That, however, is not the only way to
>  debug a Linux kernel. Quite often adding tracing statements and/or
>  using UML specific approaches such as ptracing the UML kernel process
>  are significantly more informative.

