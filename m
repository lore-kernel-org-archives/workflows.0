Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCB2328635
	for <workflows@vger.kernel.org>; Thu, 23 Oct 2025 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761228076; cv=none; b=VK29w8DMoHB5HaLwONYxPANXlOxsZye/B1dhUOGe757glTcL1oErSb564AhbtTzUged30l65vbHILJQMcRzFg2N/sSAXk2PBWuT5tvRRnjDz/LoZUOAoTZTf19CXvwo6TbHVtBWSdzbc8MrQqWLaFeRboAWhsCqi+Hgmy2sEoL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761228076; c=relaxed/simple;
	bh=JnMWVm8H5Ck5TN7RGfsn5EcNXl+YklqB9zPZXCC4wAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsTGG2RSdvDQFn75DvQBG1GbBGkSzlFtTgpKi3/NvAaMHe+lnVnQlfP2ZHcuFA6ET9r4sI+LE/Gz0jmctkl2l08I6m53aHyqWDyodJrGyf6cf7NzBcZBIrtV5CBpEByKPPZqqoHfm4z1wQKqJHUd2ZdASq4p5fpbLioZy9C445E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bKcnDu1U; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bKcnDu1U"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-471075c0a18so9799275e9.1
        for <workflows@vger.kernel.org>; Thu, 23 Oct 2025 07:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761228073; x=1761832873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JnMWVm8H5Ck5TN7RGfsn5EcNXl+YklqB9zPZXCC4wAA=;
        b=bKcnDu1Ugc8m1FO2mnc9vhsm9Gt701FFuUye9pb+IQLedRuOOPZ7GH9xP2YLtnqaWA
         3VWYZdNJluPWjsWKI7bj08iE3QMIoaJnU8TwJUYPVn/0XA0XkuqAHU5BXj7LoJjjzhI+
         Jt/w+MfFqdWkbmI0HsqDr4W7tk+853JoroELlD6yHZaI6anlSaR+rYrmNHOp1jmiaWFD
         bRyN7v/bJVXOET0nkcYsGPOCnkR+dK/eo37HgXt2JobJRvmuyK6SZzZEl2gA0M2s61AR
         mECOx3QCU9G2NjOSy3w79ydxc1TC77gKKwO4rdMFp48bKYCp+HPRYn1Q4LKcTYA2ZnkS
         9wDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761228073; x=1761832873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnMWVm8H5Ck5TN7RGfsn5EcNXl+YklqB9zPZXCC4wAA=;
        b=Q9IyC9xO6Jg3kqZjZODujJdghwgzL34MXjH2utYRBuWDtkCXNwarPuAAN9Z4eQFgR3
         3agy8RuL0S5JZ2SgUbVdufe8yEjiRajfkHqYeMVGjxZEeH0P6LffCGVfKJ+FwKtmM7aB
         D0Lf4o6N6gQzhjp2UM9ZZIoA/61Msom4tUzGChReIdFIMwtv6+ZGIapiYcQSFcGYQwlj
         LrJZOlfgJei0Bp7LHAqBLNmwGm+MLecQ2zbm0X4sVUyR/ptIAW5UwYHRKTYNcMmyDgOh
         05VjOkBwN49M2n7I+yLI1OOfAfCApsYHmLtulW5LV9Or+6hqNInEIST4HLsYoAPtE1iT
         2VWg==
X-Forwarded-Encrypted: i=1; AJvYcCWUBwSCTG3BUhLVVRv/I04dGtuUX/e25C5WiDzI+zSOoraoBiJbJ+O13n88Sh5Gg5BLmm3AB/YZvY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEkFESvwAgi9/sxKtWcJQGJWRE5mAo9aLf24Qf13GbIPzXj9kR
	gVN7Nv2rzFliGUelRPoa2/mNDZuX6ANjTev0Ao3iw8hUGOhKY6uBhsHWMksDmWSKDro=
X-Gm-Gg: ASbGncsphG2LOQ2zrE6T0aFScp/FJbtOZP/U2DOY4uiFPPgHvkiSKn7oJ1jStP0AMp1
	bnv9d3htY6nDNZzvrDcj2OGYyLMzv9WjTSjpvryvCvG0R1WtMJzeH92dCNhG7KjL/aM/6KGGf7M
	33Fk7PagjkUnfc5EWL/jWfHtMzQaHSpP9et25/vfkY5d7w15IiV3SB7uIxYHSmEP3OV4pBwB6+P
	0zU5fTRjAkz8J+ZLHHOUJEVWcMU05NzaRKo48jt7oOxawUSI6s07kNaw3Se4gGyrprntLej+B9u
	mSBB1/U3CYozE0v4O6L+V8NpykmJF8sjp5zJN4QWDteahFAdc/e+9AZlI7X3cW3PVPzLZLDHCoa
	5ZcF8JM8n6cPBbryrP0KWCKAFsVSpNuOrJbqpZsj1MuzDqIJU67n8jzYxpr94QkQUKZ7l3zyBaQ
	nohLkKbg==
X-Google-Smtp-Source: AGHT+IEQurVzp77OCpHZFz2TRcOchNrP75ZwR0sZ9FlZgnu+xhnNBWaXzzz3i5vljtf/+Kejv/936A==
X-Received: by 2002:a05:600c:4688:b0:46f:b42e:ed87 with SMTP id 5b1f17b1804b1-47117925eb5mr165543035e9.40.1761228072957;
        Thu, 23 Oct 2025 07:01:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475cae924a1sm49352875e9.2.2025.10.23.07.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:01:12 -0700 (PDT)
Date: Thu, 23 Oct 2025 17:01:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ally heev <allyheev@gmail.com>
Cc: dan.j.williams@intel.com, Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Andy Whitcroft <apw@canonical.com>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Hunter <david.hunter.linux@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm <linux-pm@vger.kernel.org>
Subject: Re: [PATCH] checkpatch: add uninitialized pointer with __free
 attribute check
Message-ID: <aPo1JU7pe-vvQzEf@stanley.mountain>
References: <20251021-aheev-checkpatch-uninitialized-free-v1-1-18fb01bc6a7a@gmail.com>
 <68f7b830ec21a_10e910070@dwillia2-mobl4.notmuch>
 <f9cabfed7b165299b8048670e548c671f300f2b2.camel@gmail.com>
 <CAMB6jUG+ES6XY7NL5TF-hFVDmz6O5rd9T-HNk7Q+pJA2_9g4Mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMB6jUG+ES6XY7NL5TF-hFVDmz6O5rd9T-HNk7Q+pJA2_9g4Mw@mail.gmail.com>

On Thu, Oct 23, 2025 at 04:38:43PM +0530, ally heev wrote:
> I will take this back. Found this in `include/linux/cleanup.h`
> ```
> * Given that the "__free(...) = NULL" pattern for variables defined at
> * the top of the function poses this potential interdependency problem
> * the recommendation is to always define and assign variables in one
> * statement and not group variable definitions at the top of the
> * function when __free() is used.
> ```

Ah, right.

regards,
dan carpenter

