Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF7A18EB0
	for <workflows@vger.kernel.org>; Mon, 22 Sep 2025 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758549698; cv=none; b=YqAUvgsfHjkaJPzRnaEOM+IIfB1T+CdfUQ+OHKZwkMT65HjsEfYdqmk1daDptvhPUxdaRAvR0Ovawsya+4WlGlwY/qt68LBuKQSMFbyBd011uW29onNQqdiEYVh+7zQfI05i5TS0igKckN0SgdpAU29X485um33L51CQWAf5/Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758549698; c=relaxed/simple;
	bh=UZjjThwwJZGVVrDbQVu3djnqq0f0cHLoax1dEyX8gx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQa/Ckndms2xtC3G+QIC8FkCRwynfeMlgorDaB+RjmGbA+CfSTumlZVM92FgDbxWrzgM4MLXW1n1D0uyGS6hNJwB/QZe9j5iWAQul6og/E7JA0aGcIl0fsmTCKm8GnJntY7mmCD089TpmwGe9HXGvlT7e7WCDecTk1Gf/If96ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNQyyHpu; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNQyyHpu"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso4026350b3a.2
        for <workflows@vger.kernel.org>; Mon, 22 Sep 2025 07:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758549696; x=1759154496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fKCwA09uzuhqOzWAVdE6ynBeU1Drahgo1zKeykBUIgA=;
        b=ZNQyyHpuEAmkQweemQ5+oZWcIw0D0Dg6LHu+wMpjNp6IidrSLYIV9prpKVXyIa2BWv
         0z1FJ1x+pn5Da6tdjEEF6Wa9nVOLSQN5pfhJfeX6mUH8+xCd1DlKnHrvbmiV7dSc8Mli
         69ECXNoKHReM7B84ke25VvzBu5GDmiamQ/+NgX4nKvTspEWrHG/sMdh8W0nqREwSKpGB
         CImZUSb3CbZHqcpsEXDPyUrNQ8b8WqD4rk76skYT1HuK5nRAHf20E9p5/3krz1WfJTOw
         kIcP2Rkn0PiKLhPAglqOgfnVsOsnbXmrCV7Z3i4DOKgKN955zkU85ZEfypvNOHLDFtJk
         OqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758549696; x=1759154496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKCwA09uzuhqOzWAVdE6ynBeU1Drahgo1zKeykBUIgA=;
        b=tAbfC/6UUSkPRRA1AFVLzS8JlAdekCbaHUOYsJfGXScFaOSzwWfb9lBXCcBd3Q1oRY
         c1BSBvZNNi5Tp+f4wZCIHG2rJQuAfMtVPfTxmdijp6/Le8Rnz8ixYos0YWee7jixre4w
         k/7t+hLa2yu/qprrtOIlOisRSQXUmfmK/BXb+lY6EO+dfAYSeiF0EDST9CjDlMHTe31h
         bQB7vsF4R1WOpc8sROF6h22UFxjLQmO4f6WB1uNvGuTeNlgYtevR2pfgTDVqB2gTrMxP
         MlXoovkBMUuPLbewJA07ZH+QyyQ5PFd/kpbJBCkqu39Rh2q0NPPhgBuiOTokBxQ2Xvfj
         oorA==
X-Forwarded-Encrypted: i=1; AJvYcCUbiin+17NaY1w8ZhL9c/s7ewD/mx1N8Yk+GrhHCUPeN73u7+gjjgMYdjBM2Xq4q0siw7BJ48KoBX8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2LQtOUrX4litFxNmq5/KTrKwxXeh4HWSksV4TZcgvTcI2RUGz
	s6NNGUADZDd3TqlcDQVFl3yrYH1bfppepGLL5UtChfkxZwbk13oUFTfH
X-Gm-Gg: ASbGncvQdqnqXgAJgUoKtGlQyM5PRMo+TpA0aFoNeoBhVUhcKfh+ocybZ6ioVf2m0P3
	S+jexC3zNKXYjVhiW6LeEcy4CMj8c05hUgsF/D2mKXXDw2CHKCt959vpt9ayuxPQDcfk8t+XVN0
	G2Xo+RCBHuhFVLjkwnxS4hCix4QNZup8Y+kM747GXP4QfGlD1lMr1JaCcAaPqBp/H+mTDpRoyZS
	6t41y3rxNXfL7NDYaL7Uz4RvQ/b9qPNz5b94sjPo+daUTSkPXkjEynNFZzQ+V24TyDqaE/mhi7r
	0dI+sELaMjQBsYzj3y8hVU2YKLL3ZscpatqmfGqJ4gXIIb2xOHd/HW184zDPbDXohBEYnPCDRIo
	cfugQGdy2P7mFpziMSyo0KJIgmqAsNg==
X-Google-Smtp-Source: AGHT+IGrmrGvSmosds+W3wTUoh6DC44jNVPqPse8MKhb2Qiqm6JwSQCRflUH7JmR95N5n8TSktl7BQ==
X-Received: by 2002:a05:6a00:22d1:b0:77f:414d:3774 with SMTP id d2e1a72fcca58-77f414d38e0mr3142062b3a.4.1758549695190;
        Mon, 22 Sep 2025 07:01:35 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f4d204aa7sm528770b3a.44.2025.09.22.07.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 07:01:26 -0700 (PDT)
Message-ID: <ff092ff5-8ee1-4e91-b7f7-e5beb1d6d759@gmail.com>
Date: Mon, 22 Sep 2025 21:01:18 +0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: process: Arbitrarily bump kernel major
 version number
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Workflows <workflows@vger.kernel.org>
Cc: Dante Strock <dantestrock@hotmail.com>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20250922074219.26241-1-bagasdotme@gmail.com>
 <87h5wu8x7o.fsf@trenco.lwn.net>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87h5wu8x7o.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/25 19:53, Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> 
>> The big picture section of 2.Process.rst currently hardcodes major
>> version number to 5 since fb0e0ffe7fc8e0 ("Documentation: bring process
>> docs up to date"). As it can get outdated when it is actually
>> incremented (the recent is 6 and will be 7 in the near future),
>> arbitrarily bump it to 9, giving a headroom for a decade.
>>
>> Note that the version number examples are kept to illustrate the
>> numbering scheme.
>>
>> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 
> Just FYI, I've pretty much shut docs down for the upcoming merge window.
> I'm probably not the only one.
> 

So it is slated for 6.19 then?

-- 
An old man doll... just what I always wanted! - Clara
