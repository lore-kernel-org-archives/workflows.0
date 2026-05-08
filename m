Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAEF332EBA
	for <workflows@vger.kernel.org>; Fri,  8 May 2026 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261028; cv=none; b=lATg7ey02PZnnR2uX3lC5/f0TKb5t52lrfJdgGv5tVp2Nq2a1QihGPoNrpM/0++ori2NjTtMy8fnSedd1WNEYUY6p/5TXISgYF8Aakc+WgD64okgo4zJN/ucCVQ6YeX/mJ6EMpgKiPKthbu8mJsIkcTIB41qTz0LJTyS2w04KfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261028; c=relaxed/simple;
	bh=WOyx8Z48htcxwyxmNQbyPqTjfn7K0keNSd9wlveroLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qg6DNwtXNduGQjLnYngTJy0lHNVor5Uil6UDhjRp826O0rNs4+rWIO70Tt2LDG8dMyGej+SJx2M7w8V0/6tJgK5yufjnql6SFzGhZVwRLEZI2UMpT7Ovq5ugNepf9EDn7U8BNq1izV+QYgi3p2YLW58G3esNtYWS5F6d7kBDzyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gvciuZH9; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gvciuZH9"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7de7dc85b74so1924066a34.2
        for <workflows@vger.kernel.org>; Fri, 08 May 2026 10:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778261026; x=1778865826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1DP+JuCnIiM0V9Dxy5rK6Ns6ZckVWIlwW+CDaFwu9r8=;
        b=gvciuZH9/GpAabeNj7v0/yjRAaqzwh3FodU+bWFch5mONSfYvY2Je6Y+UVgivqN/0Q
         wrc4bUh7DlcuPQUwjYpf+od8DT07F7xlRYQ7c+0IF1kYiFeeXtKUuddZtzQgEwWy2x7L
         6+TJ/kQDyJsZjcy+uKhN5oltUqLo4Ylsa6ANo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778261026; x=1778865826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DP+JuCnIiM0V9Dxy5rK6Ns6ZckVWIlwW+CDaFwu9r8=;
        b=gEz3bXx2g+Nxn2GIZkrr4F3PMQMFOrcXu1J0oOLDmWLR8vtdYpyVzURjLOF1DndFD5
         LW7cn2obR/xY2FBnUoBKB3JOzGV79QbvuBUO+UCqx0xDQnFdjTgfKf93ggZzt/uy3QF9
         h18eig0I+8pLwgRCtic1rVVvgshyZPCVnF8Pfoc21edfDYtFCjA4bd3OzPiwVNVnWUaw
         /0ewNlSeyBx6YSWpek2n/2Hz6CDU0UeMyCNhSiv5fv/nrwey5E6rE0OpXH+9rVqABm0I
         foYQU0a0B/d3XiPy7+PKxP7taYAim2R9J0B3lTwOJbPjLUehg3PepPo8P55Uy7RO0Ys5
         RJGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8v+k0tuhsQ9yP5SoG4zvgrLIBr6rf5fz2lFyGowt2fsFEL7jTb83Q+8hmHLak6vw7LHVJ3qMMt8/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWwVT62RXitRtzZSV+Qlh45LSL2HH9Pku1c51/9MP7lkRr2VNC
	abzbQOPKYVrFJeRvSau/+7qbxDIoIKomOhPEDt4eFbk6WkfyDYMX+mEZ1jrHUkf+v9w=
X-Gm-Gg: AeBDieuy0n0Mv8TSWFCkghl9x8+tLVU/OGbdfXqQJiw7YWI6X5K4KPdmzwKtHpn3GLF
	1cmlOs58MOZCXb+sHAPRD3pwnM0qf8LDKF2YCy6qWmfCIgqbpKWV+yPZUvcysd9lwtzMnbQCEYY
	j5I6ASYkmdJ+XFgDHoafzV2GXKS1jl52V6irdx4wUPC2gD5ViM/BbbxnPAoRLykC2jMgrrcBux0
	LSsPYZOGE/oqcNg4iq+qQb0WHKuMrcvkQc4gMrn7+3/lvBF7/9K2WQ/3LaUqKFNyqlJgnOOnJYD
	gRDWU5RXnGS6N6paiq5O+CcmHisbBLtuvCkS3Yjk3fi5zLRdXLIWX9bHs0LPrdEwjVxDCQBjevn
	w2p4BdGNuuL0p8FItNyvJj4IYUmdfC20yeVFw5Fjhjn5Zm6QoSHr6Er/dvDcFpVvqwGGkM2mzYu
	nQryAPF10bF+yqdHSZG6U07Ef/8bQOQiE=
X-Received: by 2002:a05:6820:178a:b0:696:982b:1c24 with SMTP id 006d021491bc7-69998d56a5cmr7340448eaf.57.1778261025735;
        Fri, 08 May 2026 10:23:45 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b25c1a58asm1448361eaf.1.2026.05.08.10.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 10:23:45 -0700 (PDT)
Message-ID: <2b771350-0562-4cb1-b9b3-cc3ce59b1a63@linuxfoundation.org>
Date: Fri, 8 May 2026 11:23:43 -0600
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] docs: fix repeated prepositions across documentation
To: Adrien Reynard <reynard.adrien.08@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 "open list:KASAN" <kasan-dev@googlegroups.com>,
 "open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>,
 "open list:USER-MODE LINUX (UML)" <linux-um@lists.infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260508163804.16267-1-reynard.adrien.08@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260508163804.16267-1-reynard.adrien.08@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/26 10:38, Adrien Reynard wrote:

Missing commit log

> Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
> ---
>   Documentation/dev-tools/kasan.rst                   | 2 +-
>   Documentation/networking/switchdev.rst              | 2 +-
>   Documentation/virt/uml/user_mode_linux_howto_v2.rst | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index 4968b2aa60c8..3a8bd40ad905 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -392,7 +392,7 @@ reserved to tag freed memory regions.
>   If the hardware does not support MTE (pre ARMv8.5), Hardware Tag-Based KASAN
>   will not be enabled. In this case, all KASAN boot parameters are ignored.
>   
> -Note that enabling CONFIG_KASAN_HW_TAGS always results in in-kernel TBI being
> +Note that enabling CONFIG_KASAN_HW_TAGS always results in-kernel TBI being

This is correct the way it is - no need to change this. "results in in-kernel"

>   enabled. Even when ``kasan.mode=off`` is provided or when the hardware does not
>   support MTE (but supports TBI).
>   
> diff --git a/Documentation/networking/switchdev.rst b/Documentation/networking/switchdev.rst
> index 2966b7122f05..948bce44ca9b 100644
> --- a/Documentation/networking/switchdev.rst
> +++ b/Documentation/networking/switchdev.rst
> @@ -162,7 +162,7 @@ The switchdev driver can know a particular port's position in the topology by
>   monitoring NETDEV_CHANGEUPPER notifications.  For example, a port moved into a
>   bond will see its upper master change.  If that bond is moved into a bridge,
>   the bond's upper master will change.  And so on.  The driver will track such
> -movements to know what position a port is in in the overall topology by
> +movements to know what position a port is in the overall topology by

This looks fine.

>   registering for netdevice events and acting on NETDEV_CHANGEUPPER.
>   
>   L2 Forwarding Offload
> diff --git a/Documentation/virt/uml/user_mode_linux_howto_v2.rst b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> index c37e8e594d12..7b08738c30aa 100644
> --- a/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> +++ b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> @@ -1092,7 +1092,7 @@ be formatted as plain text.
>   
>   Developing always goes hand in hand with debugging. First of all,
>   you can always run UML under gdb and there will be a whole section
> -later on on how to do that. That, however, is not the only way to
> +later on how to do that. That, however, is not the only way to

This change is not needed. If at all add a comma after "later" to make
a distinction between the use two back to back "on"s

  "later on,"

>   debug a Linux kernel. Quite often adding tracing statements and/or
>   using UML specific approaches such as ptracing the UML kernel process
>   are significantly more informative.

With these changes:

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
