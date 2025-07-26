Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86413204598
	for <workflows@vger.kernel.org>; Sat, 26 Jul 2025 07:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753515287; cv=none; b=uc7/sSh0XiPu5VJR2ayKcFm/o4wE8OMjnEZqYK3MX/iNZZp8Tb6VKiqClQjacxrs4GALHLDQvgCz3hOnvtW4+7gXYigTKgUHYq59HzPWeurvB5ljkv8egPYOw+MqwfKa2XY57MTzhPYJ8e6mrAZ5gYaUl3dkJMal3MfpYkfSU1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753515287; c=relaxed/simple;
	bh=FMNmStjOUWVtt7cOwV8Qlv+tumSg3tiV3l++SO5dGx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTJSoZJIPBfMVLhbceo/bjC1bsVqfCzHyosIjeaerzLmTdOcX+uLu9+iwBVqzUoN53wdKV6vnQAWr3kQC9P25SQ8+kYCEYTXWu32lcBkx/Hu6wzuFryAhGRU65tJj7DGfe2XZzTA3Raa9fBf68HlItvdk0/mOyLlYWaYMochayc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=khI36g8W; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="khI36g8W"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a522224582so1367751f8f.3
        for <workflows@vger.kernel.org>; Sat, 26 Jul 2025 00:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753515283; x=1754120083; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMNmStjOUWVtt7cOwV8Qlv+tumSg3tiV3l++SO5dGx4=;
        b=khI36g8WBD5L5T58SbErP3gsvmWIvDAjpf/72tHfCOG+ZWf8GUkTHOIxZ/yP1k9mg4
         1bG9x1mQOcsv6SKbEVWOn2dt71k3a5+Aax43Wts+R73VAviGHQ7SXLF1h6gqwa8VfBvJ
         V4OpcUUxMQ/o6ZhN3FeZWix7X9LJ7nxL6mrBVZ48OhCWwS1f89ZCV0raWbW53QbwEWUX
         Bg+wxxlFMdZyczs8JFXFR8Y0gm2I7JVhM/fe3866H4qC7Cst6jGqSQg52I4PIt5P6XOK
         XnznRJfbtV30s6EjYxnx0v16twlEvT9tGgGrkvAL+rUnBeFrPkopntpaUuGuWlTsj/Sp
         Ea4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753515283; x=1754120083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMNmStjOUWVtt7cOwV8Qlv+tumSg3tiV3l++SO5dGx4=;
        b=KhUsbCpAQc8bGzZfXl0+qiYMXbll63nvf+TJ9Ov0ALMuXGRZODxSPAuzAdAn/4FwSJ
         Z8OO8ENBhq09jslQawehAClcMVivRPZ+hxz5QsDLcviu4Ui9PD2qeDcnweJm6/C//0B9
         MZS1lIdrcLGSvQ4EelnEruA+0vjS/kNxbikS0NuDUgv8+Dir+6vzJBXNUF8ekJzkcoG8
         jy6uB6MYrUWsNNlKNo8Sdo6ZE2B4fPoeB15BjuE8ljJh0s5XQT/6J6UNXjBkhLpSEeiO
         9nWCGQPGDxqP1sMaht7VbieMLXjWV35hJCXFWf6jzeUNK60itYymCYGpzn6rAYOv33as
         p84w==
X-Forwarded-Encrypted: i=1; AJvYcCXPO+zWjY2aBTAhmr6b04bxBndTFIA8o/XVL1M+phFAmLJYu3pwmKZeRRJqvlmNL6x3byjvEZkyqvI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx1ZS9s3nAg1r+Cq0/em36vwBp5Cebs1J0Xi4h4vMAZjrbJGvE
	/nW522CuCAypx41VWiKYFUyTI2txS+BlO6EkscAgVirrqnEEOen84wb7pkKm3XzT06k=
X-Gm-Gg: ASbGncs992Z4eFePQvrElOX93GejzCa9EsXs4cpdnFZS/Q6O7C1ab9OF1o5qA7mSFl4
	bqXj7SjFrmradfNevmYOZRLbflC+pNd44kcS9kuaZ2+dzwda8YXKW6eCxajkjfhKF/Bc3Zo0kD1
	OQKpT2d47k4pftIOa+6uX07bhMEIohaPuhS44b0IDhSBcCEyc/slEh6HZtQ9Jk0zZqTxuoL80m3
	oIUw4GD8CEvGt07e+aXC4OfwChlUovVDbJH4YpHloLT6gWG8nhwuPYlbx9Okn1ERyzTnLVj10Yy
	aIGLZcBIa1RLTaLlz9Sjwg2M4qBD3IuMne5kBjx/R39jhiqP5KfIqSgwn24xTAmuqz9B8KDI/kb
	xwHajsrYhq/2E4wvVOpg+LNLKACwJUPe33xZJ1XPjA6j0ImfjKbthPro5SfUn8j1mo4n8Kilz4K
	Ga+u58pO8mb38A5qIlcjkj
X-Google-Smtp-Source: AGHT+IGS1R1BLd51LhebYLPR71ELpRpxxT4MPtlRkigqh7295cnHvdHNyjtNpQNmAZYcVC1/uPyNUw==
X-Received: by 2002:a5d:588e:0:b0:3a4:d9fa:f1ed with SMTP id ffacd0b85a97d-3b776728f9dmr3020420f8f.13.1753515283332;
        Sat, 26 Jul 2025 00:34:43 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:aad:4a11:7705:31c4? ([2a02:1807:2a00:3400:aad:4a11:7705:31c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778f1e760sm1991506f8f.69.2025.07.26.00.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Jul 2025 00:34:42 -0700 (PDT)
Message-ID: <bbe1ea08-23bf-43dc-960d-bb8a214b65fa@hammernet.be>
Date: Sat, 26 Jul 2025 09:34:41 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checkpatch: validate commit tag ordering
To: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, joe@perches.com,
 corbet@lwn.net, apw@canonical.com
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeff.johnson@oss.qualcomm.com,
 akiyks@gmail.com, konstantin@linuxfoundation.org, krzk@kernel.org
References: <20250724072032.118554-1-hendrik.hamerlinck@hammernet.be>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250724072032.118554-1-hendrik.hamerlinck@hammernet.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/24/25 09:20, Hendrik Hamerlinck wrote:
> Modified the checkpatch script to ensure that commit tags (e.g.,
> Signed-off-by, Reviewed-by, Acked-by, Tested-by, etc.) appear in the
> correct order according to kernel conventions [1].
Hello all,

Thank you for the feedback. I wasn’t aware that the tag ordering
conventions used in the TIP tree are not universally followed across all
kernel subsystems.

My motivation for this change came from a recent mistake I made in a patch
submission, where I incorrectly placed a Fixes: tag after the
Signed-off-by: line. I realized that checkpatch.pl didn’t flag this, and I
thought a warning might be helpful, especially for newer contributors like
myself.

I now realize that my approach is too strict by trying to enforce an order
for all tags. However, I still believe that a targeted warning could be
useful. Another mentee I work with recently made the same mistake, so it
may be a common pitfall.

Is there a general consensus on placing the first Fixes: tag at the start
of the tag sequence? If so, a warning might be helpful for newer
contributors?

I was still using checkpatch as that was how I initially learned it. I'll
definitely look into using b4 as well.

Kind regards,
Hendrik

