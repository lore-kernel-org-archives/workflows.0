Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447601DF27D
	for <workflows@vger.kernel.org>; Mon,  4 May 2026 20:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777928312; cv=none; b=VOjoHhFf08cjT0xl+xnUa54wLbjpsKkq+x9SC+LtF3wEFiRWfSRIuyy7kLxNl/iZdke1LKhod8ssbJzvV7Fsc0ifaIKstNucTXR3GU5roWlt1Oaoun0jqK991bOPwEbmEv4CJNY55Nq/g0f+sRLh+UMyLEnbIdYf4+U0cnGttmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777928312; c=relaxed/simple;
	bh=AnHqmTk7h+qZbfpUtv/6QvkRxKkNv38kGyl2d1Y1klo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DUAWuImivCdnKsYd8t/i0NiJh9MGDCqgRtYvTRfXKCrqDhNX7kzjPivvawcq5H0G7tQjjcAibAxQMTuiaRBUGcOO92FU2820EGODcSfHL3Khgzrk5pyBGJ9ImA3N7k+wkWj7NFHEXOJABneunyPOEJmZCRnDKhSm3x9PY5+yBVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CIfgjEuW; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CIfgjEuW"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-42c0b0ffac1so1804808fac.2
        for <workflows@vger.kernel.org>; Mon, 04 May 2026 13:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777928308; x=1778533108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0amaTMBgDEgs3tF4RCm1e9Dle/WjpaIw0roTFTHbcEU=;
        b=CIfgjEuWFXT2dSbfPdLSygsJ1jexgKi2KKMddjnqAn9oA6KqvICrx/50cpA6l8Cgbp
         BvIQKVLfJgKfURSIkO9tlO6DZHBKsJ/iuMQ4cLFsh5bzIfLNRJdzrdA1FVNRyCZBPWYu
         lzD+ex9/GsrtRnyjrgHIufY42K/K+Gp9ue+gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777928308; x=1778533108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0amaTMBgDEgs3tF4RCm1e9Dle/WjpaIw0roTFTHbcEU=;
        b=IZuJ45GqT8yCEP8RvkzHx7LyBlGaYgmsmS1BCoN7X5q4yX5qOUD/QkqjR7oN/VMgen
         fDfRFFAwNmJF3M2sul9p3czE5fwjBI1cak2BS2HinaEgni3QYKuEhmVjWNoNWU4pUnIH
         FuWNwdcy+18lUiUCmdapg3H9dfo9xkAC2rAox0XYuR5ZhhXSy0u8ACJwWNA1EpMzy9mu
         nWehwyHEXXAz83K14ZZBR66BfGe9aLsxO23rbrm3tez31TA3N286JdSdiABPt8rv57Za
         CMrKVZXWJXT9APzpN3sEp14PwcMVsFXelYb3niAcgD+ZpSXcJyxRYzjnAGgVrj+ANoL5
         pAmA==
X-Forwarded-Encrypted: i=1; AFNElJ9z0dEuZzPoi0ukJZ9A1fBkxIHUPZl0dyn3yKR9jWGcycs/doUaOHW6rz/+HnH1CEfyiY+sUkjqDyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YycFPlzsqLdXcy/1sIrygU9711Amjf21KYPV/2XaZbYdrwSgOQm
	DPvWwO1OU5/kqO0DVo0+16vPQJw+Yq6JYW/6Yjw4vYvdtSAKhxL1QAZxKXAImwfrbn0=
X-Gm-Gg: AeBDiet3SH68ApOLbUe4pu3pJh8nnw7ujyEQs8vnlqO7Lrorm0rFk4Ob6vFW2DojSMC
	J17lOebqO1LXNnHlhgmNTMMW8sTGtrHq1F7sQU+8Gp9DjHUG7bkbx0SUSQHM8aWMiGMW23SbVAX
	OwZIgk3TYapBU5TUNVodOBQEW8l1UY6U10XkkfFHr/77XDcEQJr400PRadWZU0xEh8DVuvIr0ZE
	k/v8kKEKhYdbAonuYX2rFE+rKt5jOt+BRxwIJD1m7+nG1sekYb3lyC5L2GS+Gc7fEnmSjzEnb7i
	OEmRKsFptdtZEUHOZG467FVX+PKMqIh63gipVEbjMQaLkGHSgRkZvXfpXa5R/a+vcXPIwbyMR0S
	yeKCrLjdI1Jd884G8wnNmkG3TIlx4jYyDgiNn/E9TMzonQif4/5Mhn5DmFvIig6iiKbvRMNAG1q
	oh3HXLEGEzn5wAHyFOUInUy70TKE06A9f3UVagYB+/Rg==
X-Received: by 2002:a05:6870:1776:b0:42c:ecc9:58b3 with SMTP id 586e51a60fabf-434760613c0mr6278794fac.10.1777928308251;
        Mon, 04 May 2026 13:58:28 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43454cbbbd7sm10977170fac.10.2026.05.04.13.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 13:58:27 -0700 (PDT)
Message-ID: <444d823c-40d0-4c14-ac8e-4f810a5a2f04@linuxfoundation.org>
Date: Mon, 4 May 2026 14:58:27 -0600
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kselftest: Document the FORCE_TARGETS build
 variable
To: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260417-selftests-docs-v1-1-32e4a78214eb@suse.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260417-selftests-docs-v1-1-32e4a78214eb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/17/26 11:36, Ricardo B. Marlière wrote:
> FORCE_TARGETS has been part of the kselftest build system for
> some time but is absent from the developer documentation. Without
> an entry here, users relying on kselftest in CI pipelines would
> have to read the selftests Makefile directly to discover the
> option.
> 
> A build that exits zero despite some targets failing can mask
> real breakage and mislead automated systems into reporting
> success. Add a dedicated section so that CI authors can easily
> find and adopt FORCE_TARGETS=1 to turn such silent partial
> failures into hard errors.
> 
> Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
> ---
>
Thanks Ricardo. I applied it to linux-kselftest next branch.

thanks,
-- Shuah
