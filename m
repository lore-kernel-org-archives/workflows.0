Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24939367F26
	for <workflows@vger.kernel.org>; Wed,  8 Jul 2026 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504694; cv=none; b=Fds6pFrDwtbDtJ0x5dQNNGvXa+w7Kl3yjOMeDuGdAc4gpAYLnO/X1I6ZNLqWc848AH+fIqf/fhiiI0/3Gd+fqV1hsyoorizjEAQnVne+3BgwAA40PL9m+hIs+EJ0/Hdv6wOJiN3fn1UQ4ggpsn/2/mDmyZyYpW17ACkijSWI9Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504694; c=relaxed/simple;
	bh=ZPZ8Ghpofvj3SxI2tuKyXiYtS79lSc4K8bhJ3ppreTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ufDSlVbIsvuVWwpEmrT2TXz5a+LcKUMOHC06Nd/sVNRcDKuoJYYlUaCCWUoW0NsJMtMABTGna04Dw6n8BW3xcpYoD2TUS5pxk7vwLqkWvuXZYIy+9RZM3FHVgdmkMdbz/7FqEI6qbnLXVzaZy3wUBVEt/WapKL3fqGC+8aW6DBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HptC63VL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LAhN7SFy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HptC63VL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LAhN7SFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783504692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vZPaMybjeMNKNpD8AtX/8HSMSCIwjQpAmfLjC6sDrjw=;
	b=HptC63VLBmON6gB8DF7tfthve4rMu6392jSxWg4VPEkAsNgiTj8floUCCtqgw/f48J5MUK
	73ZxaxDzTw7Q5FA+KlEIse8Uq92ByGnNJzTzO0vEBOVvMIX03NhwrsQL/QncvrCouJXeaN
	8Tc+0ExB6e7iHu+CLex1hyfgrWZz8NY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-Ftwr291uPXCAac0wxzVmTA-1; Wed, 08 Jul 2026 05:58:11 -0400
X-MC-Unique: Ftwr291uPXCAac0wxzVmTA-1
X-Mimecast-MFC-AGG-ID: Ftwr291uPXCAac0wxzVmTA_1783504690
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-493b786d550so4849795e9.0
        for <workflows@vger.kernel.org>; Wed, 08 Jul 2026 02:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783504690; x=1784109490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZPaMybjeMNKNpD8AtX/8HSMSCIwjQpAmfLjC6sDrjw=;
        b=LAhN7SFyMNxgdC3eCNsZJ7NpwILQH0VQ7ps9BlsMbNl6xyYsdYyzFSy0Ks02AH0GHM
         p3yJ0yAhwKENfKrljwmppPUb6so8K3v28GXtIN40ZPu0Ng7QosIqkN5dkKWI9y+xrsNt
         u3KB0K1GTQVyjIFt7J8neEdh8hPWENDJQ/s74WI+cF6DIY37X61Tv/n1KV9OxnewjYr4
         u8v63Lcbo6etOIpsWymXhhYfEvh+LKYp7qzghPkxXcVeb56l40bPXPpmkwwZun/8SPcV
         qcQ3q4cMglE+rytPdjxAjOi0/a9ytzB22pddRqiMeRqnhrPO1lzufCm7F9Twf1BQLd0X
         q59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504690; x=1784109490;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZPaMybjeMNKNpD8AtX/8HSMSCIwjQpAmfLjC6sDrjw=;
        b=LHfCuSDv+uCVs4xC+0v+wpscXRB4javGsJZ9N58iB73AV8bCkeiyEDZujefeN/NnR9
         CkODztbvZxupmlljBJOZcrrS4O0om8jo9ffien7cHuSGKb9wT+9TK20AAoP/IXFyyg6Z
         b5raorHd11yxi4SXqkOLHLtUCzvKfwYHszL8WssZyEMLGvCx2IbsAHeaze4JuJMQMws+
         78ZEy19l0GM8/T7Vq2Igyp9pJpISCbqVeZYZgHAUcoc/ZV9Nzxfz1RbU34H2oLurnbEF
         qqpSdBk2CwSYWuQgsoAXCs6gshnmwcWLNk6cQIA4V2Pw7uw5Jvlve+MtHIwpbwxU2tXh
         oKxQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLyfMkBym6sZERe6i/s/lgx5nUwzFJSdAmUo+lRyXCVQZswUUJpnlJxZ12A/b2pXnEDI0I1cUATeY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo7kyzOGej8A83q2JU2/WbTCGooUWUuNY5Inn6TkpudP8FDqkp
	IPthWYFi2Pxv+YfIt0LJjqdvTUy0bw8D50qQ93V/GrbBAu3eRmmf841v390nfn5xtx4yAveN6LS
	F0VnbYiI71SmDpacC3IX3AqHonElq9a/hP6TjeG3u1l8vGIMlOlq7L6FgalPe/dAMgFls2Q==
X-Gm-Gg: AfdE7clgvAtDRTPhWQuATE7+wKnSbFXExKpJC4Kibpk0KOyw+LXGNisJIzSdJc63lqC
	1RCnxFzZuCOYWNcG7nqWyWE4Fd3vP7or7gJKxihDUx69HjM8RCfmXyHoNL5TOdzVrlRToLef0Gb
	Jeeg8kNxJAk9bTOTikVdaKYEBDUelr6Umck3P8XGnoyAm9YN84ZFOStimUyT8zalt0JnzYfqvht
	RnVTbvajcmV/R1k9Eqpku6x+eqNzpbVC+Xy0t1c1q8EsR8sMAQ4EsXSmie329WTIgaBrF3GMZ7w
	VeA3ys/Irg5mUQ4tD7d75zVXmxZMCWvu7k7we2Yi7idKGdvEOFH8We8CmOxlyeZXxTFygeazc6P
	y63Co6ZDkuI8nASNIzEqimNcC1EZplDaCzipohkxwiUai/ssWX1jMTmJcDpPa9nb1W35Uau6VFB
	65qBPi3IDjfGN5
X-Received: by 2002:a05:600c:3e11:b0:493:df1d:7488 with SMTP id 5b1f17b1804b1-493e6904b5dmr20334505e9.16.1783504689797;
        Wed, 08 Jul 2026 02:58:09 -0700 (PDT)
X-Received: by 2002:a05:600c:3e11:b0:493:df1d:7488 with SMTP id 5b1f17b1804b1-493e6904b5dmr20334145e9.16.1783504689342;
        Wed, 08 Jul 2026 02:58:09 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fccf2dsm135091445e9.15.2026.07.08.02.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 02:58:08 -0700 (PDT)
Message-ID: <e981a64f-ec3f-45d6-b20f-e03b61a91f2b@redhat.com>
Date: Wed, 8 Jul 2026 11:58:06 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] VEGA: a syzbot-like workflow for LLM-found kernel bugs
To: Yuan Tan <yuantan098@gmail.com>, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org
Cc: jhs@mojatatu.com, gregkh@linuxfoundation.org, sven@narfation.org,
 netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
References: <20260708092247.4188498-1-yuantan098@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260708092247.4188498-1-yuantan098@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/8/26 11:22 AM, Yuan Tan wrote:
> The rough idea
> ==============
> 
> VEGA would have a public dashboard, similar to syzbot, and would
> send selected bug reports to the relevant kernel mailing lists.
> 
> The goal is to send reports that contain enough information for maintainers
> or other developers to pick up, understand, reproduce and fix the issue.
> 
> For each public report, we expect to include:
> 
>   - a description of the bug
>   - the tested kernel tree and commit
>   - the kernel config and environment
>   - the crash log
>   - a minimized user-space reproducer
>   - the suspected introducing commit
>   - a suggested fix patch
> 
> The suggested fix patch is meant to reduce maintainer burden. It still need
> human review, but hopefully it can save a lot time from building a patch
> from scratch.

Thanks for sharing. This sounds very interesting to me, modulo final
impact on the ML - overall load is severely increased since the LLM era,
while the maintainers pool not so much.

A few notes on top of my head:
- the amount/rate of reports is critical. The higher the rate, the
better need to be the reproducer and the suggested patch.
- the crash log should include the decoded stack trace.
- IIRC syzbot reports sharing is [always] human
moderated/limited/controlled. I think that is the correct default and I
hope it should be possible for you, too.
- it's not entirely clear to me who exactly is 'you' and would
appreciate more info about that.
- it would be great to discuss this topic in person, i.e. in the
upcoming NetDev.

Thanks,

Paolo

