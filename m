Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9AC3446B7
	for <workflows@vger.kernel.org>; Tue, 21 Apr 2026 07:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776758228; cv=none; b=M/lD1vH+Vzdw4VFfZgnUEBZJUrCZLYpVVx/IN5aT+Qo5spRxCYjqoT/UHJBeBWpgfYj6RPDqjl8xZSbhjO509zmytLA4pSTn2zCoMUWUC4QYLt5DMVppHuNV+C1DY7AWshctlVjJPx/0VZSkRLbqOSXq191fyQJ+QlQLGhR1PwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776758228; c=relaxed/simple;
	bh=Hn3V5heiza+LebzSQmrfdlavZS76PmKX9/yDwhvJ7UY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jdKMplBqAAbjBjizNBm4sovQtkDSMLKePfWzTrCVnZPH/7oFI9WTNNG4dMEHW+GQxhrJz26g05Deeojhv13Wkd38wb7Xjp5sWLdvH3c1VBTJv+rSXXsaN2AdcBjXqPqb8sJ9iHPDM/+eV9/NA+7plKtzzF7bV0+xIxY0KMKnRDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fJLnG5y7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fJLnG5y7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cf7190580so367348f8f.0
        for <workflows@vger.kernel.org>; Tue, 21 Apr 2026 00:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776758226; x=1777363026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dBN39niNfJY36pjauuEaV+o3jy3iZSrBPZOF0eYAbic=;
        b=fJLnG5y7cLwXaywgM+J1MZYQoLE2H8GDebcEA/JDx626KXy3n9OvRXDtRJszV+hb4B
         YfZx+lHlPnaEvsdTyRjdrlxT07w1d3o1jBzHSWWTERoQqDa8yB6Jdd0akNSqfzDKB47e
         n6dgNu/GS+54lGdsPX9A1JKHl60sIApl8Pubx2DVwJJ6Kgju69VIU76lhJr7pCtN4EmL
         qYbypdpiJJAron68WHOv9blDUlmeP2IOc5L6lyXGxKS2F5rSdCVpq2iCgGk/V8Jop5hM
         qHgZuKZc+1ck6pdKeqf4X3cqeVfx4NXRBCjwN4FRDxVfOaceIkjR2VvXXqsOFHJKA4k/
         xHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776758226; x=1777363026;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBN39niNfJY36pjauuEaV+o3jy3iZSrBPZOF0eYAbic=;
        b=gKWv0e2BTwlJVpdlpS/mjaFfHexCRUD7+sgJ5YzQckbCf2HDVL+qQKuMhz/PQ4uNg7
         aJHxZmSh71bPdMUWB2MyFV+8RqOEfAmNeMsldhe5SpaM/zl09hv4/31PRQYgs0J5kuvH
         nAL1WALr29rmxjmESfF1MiPn1Ucbb3hn5f935BesCDpkMog2GMwYtU9zWAQzY7EBvWD1
         7WzOgBuXuATp2cIr80PzgN0okcBK33qmLhPcLy9N8tpIV+bWWoVFoXDlgs1owW7zlb6Z
         xcREwXrm+BGuCHN8edOmScxTLwPyB7JSVUTx30DPDNk3hsrl5p94DSNf89S0Kng3oc9x
         NHLg==
X-Forwarded-Encrypted: i=1; AFNElJ9MfB/AryHYVFq4xdy9UWpJtCPBoEL6yp9FHzgrnOVGVQ055ywNOXjVrPc7m9Lkj8nRhHjtkiDQu7U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywie0KPk7oKpwVe/QB/xe8ow604XULHl9r66v0U5+KP0UoeXT4l
	qzWQn/ZG8n9+9d6BlZVyNFSXNruoOR/0MncXmKWHenG7samjujwKyEv0QLBvktU4EBc=
X-Gm-Gg: AeBDiesy0y7IB8W9qHU6gedyn7CtM92GHfwzrEYEVBVkbQ8gT/VPK07Qb+Lit9o6Z82
	2wy9xDRm//LSJmqPx6og8teuO1E2NTSHBoy6YTHMzY5YOtXTedMY9+M1zXEGtMoR+K0fw2tadEO
	UvXbuiJ9lnwE+N3mJSTSjitk4cp+sd4p/HQJKi5r9AjvjPoNv6jBzEo/CCr14FannUj0MjESL5C
	esUf476CPK53JrevGgK4nj7uXmNPx7F5bdxbsx3SIvFmHS10dv2cIzYka4agGrqSaLUnW2sTg3u
	E3PL7XX78MTVlCZ0yV0kb4AKrzZyKZ1hfj/0TPfC8NfAckrihnG/SwUL/Bg9YRE8ODZbUkqqakC
	TU3iF2ieORLlLGqILMhf2vFrZtctzOPbfp9g1qaAYMdPKpncAez02BUv5BKZQZ3Ag0b2czgEIlt
	DQOqnikPytAlyFvFBOhDDvGHToMiZOiekVjGIx27SIFPoIyd+h9pN3KDXc9s2QPsQ1hxp4
X-Received: by 2002:a05:600c:3b8a:b0:488:7e7b:dbc2 with SMTP id 5b1f17b1804b1-488fb75eb14mr137950245e9.3.1776758225655;
        Tue, 21 Apr 2026 00:57:05 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffc558f2sm210641525e9.1.2026.04.21.00.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 00:57:05 -0700 (PDT)
Message-ID: <2f002882-e584-4491-9c12-11822645cd26@suse.com>
Date: Tue, 21 Apr 2026 09:57:04 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: coding-assistants: add optional Acted-By:
 trailer
Content-Language: en-US
To: Blake <blake@truealter.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260420142741.3187814-1-blake@truealter.com>
 <2026042035-retention-platonic-e5d5@gregkh>
 <IF6AC3bPCYsGyyxsgSQlwZXnA3BJJh61OW6a3KznzbsmDPG4DtricBAzsxyOjDQZ-RHBEkgsjRdaVKQ6i8gqv1bd2AGwC0BTJwBErNHOqx4=@truealter.com>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <IF6AC3bPCYsGyyxsgSQlwZXnA3BJJh61OW6a3KznzbsmDPG4DtricBAzsxyOjDQZ-RHBEkgsjRdaVKQ6i8gqv1bd2AGwC0BTJwBErNHOqx4=@truealter.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/21/26 03:04, Blake wrote:
> On Tuesday, 21 April 2026 at 3:40 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
>> I really do not understand, how would this actually be used?
>> And as you have to have a signed-off-by, why would you use two
>> different names for yourself this way?
> 
> Signed-off-by and Acted-By answer different questions. Signed-off-by
> requires a real name for DCO attestation.

AFAIU that's an outdated claim. See:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d4563201f33a022fc0353033d9dfeb1606a88330
 

