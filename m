Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9E438AC8A
	for <workflows@vger.kernel.org>; Wed, 29 Apr 2026 08:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449646; cv=none; b=PqoySw5O5BMHBEnhm2BV70dhjtx0BGVsIZX5aHNqBkLHD8HyR/y0/0f/cYQ4VSkhHlU4FNdDMx6jBYs41TRjno1/IpGIofohS4uafwx4bGWHQYGHVxOUlK7H1AKr0sr5+akfByyn8wR3Vkja2jcvvy7B1F4jZthtDUzT9SCS3wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449646; c=relaxed/simple;
	bh=jUfv7BY18i0hzz1iwaD/eeJ7LRQt53qdiERx2ReGrsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6KoUHZNRMbo8hff9Ip2LbKSeRQAeRuRUIlRwsx2PCPBtptX6PbWpeNTSv0Ib58L19/L1Ad1ADeKA7otE+FrBopl2wNvBCehRveJXg2c+0ov2zp3WNiZf2+9Ehu0ApjZtOmJ7qlSMhQml8rKZTKKTwaYkzbyBVIPHcrw+J2OtI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b/XmVtyY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b/XmVtyY"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4836d9d54f6so18108335e9.1
        for <workflows@vger.kernel.org>; Wed, 29 Apr 2026 01:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777449643; x=1778054443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKt07qcPF1NidEM1dAs7s4kLamhrOjHwcNAU0l78/qI=;
        b=b/XmVtyYu3BowK7ooHE72B93/oSX/3+/zXfTdJkaJ9EiLuj18eyKbhSQnW7wRatBvt
         Eiz8XRXAW07QFxRpFSqrNka9nwARUAS4yWXMuhGfus/NQIESuElcdlHco5ZS3bQ/7fdO
         Lfg3ceT1lkT2oFAW7WngeTld0tzm7XRCu3DBORxfCyxoNCdlzKDsiTIpWwGXATlaT7Vc
         FfHAXewOGn6OR2WnVZkZw69DYTm6b92LeydfNQOcrBK9hilxrvRZqj2BbRXiIuDjKysG
         LSZUmoK7gXrIVvBQb92pmzjij+/5nvMVTwsuWUu8h/gil89HnRYV+mQ0ULGwEE4r89qK
         pNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449643; x=1778054443;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKt07qcPF1NidEM1dAs7s4kLamhrOjHwcNAU0l78/qI=;
        b=khMeUyyCs/rZ+BDQ5QXzaSfyCkMNLAHnoISZgWLSanC0RcGCxrDJBS9VbeqkxwXGJz
         bnqwOirOALeyy2r62X89mcbe3+2FIggsholWsj8fSvWxqe2ivpKti5YwbcN39VFyOGco
         HRu9T0SnK8yPdZKsfyFvRoQakkiv/4YQzJnYyNuBkic/BuURHB6bDoiG1JkfeScqA69H
         Lf6Zp6PY/XUtNxkkAafbfXjKJM8oKB5h4ZTlv3nWmwvjBgCRAd5H1fWJVmwfIEkDw/NE
         uUoif7pLExp2FknFOyjKQP6OYHlcYOEWhUdGBhVhdw5dysmrg2/moVZ7Q+/P9xSosFvL
         m4NQ==
X-Forwarded-Encrypted: i=1; AFNElJ+155BYCALgDOjyGFQpx576WCSt5ogND1fhYJ7tGqTX1g7DmvsfwQcV7Esm/oz2VFCG1P+Ljse6AFE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxi5/Js4K1ctrlOqZNMS4eeYMoQSwSBxRMIRuUNGR5ARvpN99W
	JbXmrl3CEt66hzVJvF4HEG5ANHb+s4r41KD/6cYds/Ky6XlnvgIoJyA6ZeYrzCLm5kk=
X-Gm-Gg: AeBDiet305aBCj0VIU/GG3m+weo9cWy7dKhuRAvcgijvqgNRpp3xLJu+Yv/4AB1tuVX
	TELwi7y96yykc/hfSY8svYK18w0dZKJkK2DlrX7OrJByY6oaMDp8187SBQwVd8mSTeCwwD9BKV2
	phF7uvFx4XuCkax6A+t+Lrlbyyp2YutDCFH3BPOm95s6tIl8C9BzbabAmXDNEUOPXJdW54/KHTH
	UT/fqHzOUhKGdUGAOLcux2ssNHiL9IQy9YDYpALlrpCV8CCfsJp7KHxADfFbdlTa9leGg3ZB08s
	Sbrpc5mPqWJfk7Ci4Hlxu6kzjATBjLvSXyMv2Pv5sYsmbgiDxzqYLd1qoX07ufLbs/Y4gcVHrSF
	4M6AWFyk23gS43dQ1YdQ1AiuJNGg+VfFuMMEbqBvyEcQr+gd9E4C5Kr7QccMNRTHcFd+fkXIP1h
	25n9Hsx78/BF8TOcPIxE/It4CgDwmvPNkxDTdIZU2b9hxLE/COdNSLV3KNe9USfWzpk4ql
X-Received: by 2002:a05:600c:3acd:b0:489:e696:127d with SMTP id 5b1f17b1804b1-48a76f82973mr58572165e9.5.1777449641184;
        Wed, 29 Apr 2026 01:00:41 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c303c3bsm18098475e9.7.2026.04.29.01.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:00:40 -0700 (PDT)
Message-ID: <78978a11-8345-4b84-bef7-90d17f4c581c@suse.com>
Date: Wed, 29 Apr 2026 10:00:38 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] Documentation: adopt new coding style of
 type-aware kmalloc-family
Content-Language: en-US
To: Manuel Ebner <manuelebner@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org
References: <20260429070759.309110-3-manuelebner@mailbox.org>
 <20260429071445.309733-2-manuelebner@mailbox.org>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <20260429071445.309733-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/26 09:14, Manuel Ebner wrote:
> Update the documentation to reflect new type-aware kmalloc-family as
> suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj()
> and family")
> 
> ptr = kmalloc(sizeof(*ptr), gfp);
>  -> ptr = kmalloc_obj(*ptr);
> ptr = kmalloc(sizeof(struct some_obj_name), gfp);
>  -> ptr = kmalloc_obj(*ptr);
> ptr = kzalloc(sizeof(*ptr), gfp);
>  -> ptr = kzalloc_obj(*ptr);
> ptr = kmalloc_array(count, sizeof(*ptr), gfp);
>  -> ptr = kmalloc_objs(*ptr, count);
> ptr = kcalloc(count, sizeof(*ptr), gfp);
>  -> ptr = kzalloc_objs(*ptr, count);
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


