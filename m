Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7187921257B
	for <workflows@vger.kernel.org>; Sun, 14 Sep 2025 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757834423; cv=none; b=t2x4gF4MVkBlV9RZdp5yav+/CE/G704yX9Crqi7YRsRHoXQvFd8po517N0O+6wFAzzSbAkUa9YIroxGdote5+cl5rK0IGwrOwl+VxDG95fr85WZj6IPQihPlanpeERC352dwFXFk+yqFz7wbn/B/lKxXQhLEZxU2a68Igg59QT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757834423; c=relaxed/simple;
	bh=WxHbnp3mXY85vHOyFqflPsDdFgmpqdsippjcQEzh6k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XojCkZdZLWAeHJHSFsxTXGLDw+rYjF9gFZfXWvWtwZFUrqd79EAzoPJZ6Itq8JbJCLSY86E+b4fZ1JHwD8fgP6VPcKOzJ5zfohFnTxbCROHhRbEzOJtRjW/2cX5RLTTQWI923UfJB9KGG5PBVJvcz3vg1xhnE1064402bQhSiqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqJyDFdI; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqJyDFdI"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so2682575b3a.3
        for <workflows@vger.kernel.org>; Sun, 14 Sep 2025 00:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757834421; x=1758439221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YOgfe+9uFa1Sef9wrFS81gpUBs8pXU8gTxUAzr2W5PM=;
        b=ZqJyDFdI/HscnUlKBH4DfmknZONfXAFUmYD1blLC6PoMbehWZ8akX9AH2JC0+upWRr
         bRhQslB0byyxeTtNdiEHmSobANTMsZQ8AkDsvgrQCmYNH8QCXhdBpcoAemDFYjTV/y1y
         OEDm7137G8r0SjTPoglK/U48uzCR06hv/0opygdJAzmGo+99jq3I0E3Xg3RZejq+N/9S
         rxK3MnF6mSjjTLj0LvgpsrhYcf4x0PeKNqz8QkQGkx9V4Pjhu4aWF3qe9KXb8c19l69u
         nR1RSd2EsQ/W7KWng8YVJs0LS3dyc5CI7ssZRK/mmobebbhmkW7uEBoNfW6b2JjI4N4W
         Dw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757834421; x=1758439221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YOgfe+9uFa1Sef9wrFS81gpUBs8pXU8gTxUAzr2W5PM=;
        b=lJJ8Z9lToKFbeBRJdpk29CWwbc+vQJOrx+W3RIUlcqZy2gCkvlsUi3GyIBOjrfJrnS
         Nhgwp5eHoGWKyinB1+MLzlEnCBYmCQqMdWEVXGgkJPKMVCdqoF265EFjZ7OwdgmiBU/Y
         sXAaVtgSn5KOBiqA7JmUg+ffwn2bJUAMlxNhHL3JtNUMg/+sJ0aEqjF8QIt+2OJj+PPU
         1vdi6E9iQH1JQ5H8xbCZAo6q4cEr9Z020DipQ2zSogtPnu+9jrG5xTOMdwbdba0B61JR
         H4jYr3dFWKx4gAq4mEuJv4d2LYgKOuqYiOIEHhktip1YRAaqidTOPmmb2jmryqgOobRu
         pIgw==
X-Forwarded-Encrypted: i=1; AJvYcCWsHf47lviqJfgMJfVzGHOeINxDrdMrNQaoN+H9nghnIX2n1em21TbyMcwhj865EcDc8DydKBtgzYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFydXQFqeMkaEzkosU7Heaf3F1QokuHI7D5X8yGXmfmqApbYcE
	U1NHR8blrhJ8WFEhQ1d7SPGeVEsj5ja3OdyHuL7j/T2uccdEsNA2ZL72
X-Gm-Gg: ASbGncuDVTPHI6YGaIH/bcpgP9LV/m959KxbtD+fBkbeiVbX44nmbWd4uQzZHseWtST
	EKB0OIzYkDG1WU5hWk4fDMmo/A1dkm6/QHdLBSpN8B1g7O93u1eDOriZMNzUyibqnyuEONDBjSv
	moOn9yPWjmHe7UzMQ7ceD3Aa/QSVEp79jW/rzf0HVgCVn7k52yvGft7k7/YfCyR2J60XcVFJD7x
	vehIQ8kkk47D3srrL6/nvY1xModp8VUccFXWXZnICVp7T+uD2/JauQ6t44ho+hgPCKUJSY0aXWS
	L/zn9mYcVwc4qU/1dp6nRgFG5zGMQOf3p3Occ2UsEiK7laQS6Hcmo1jZZ6P60gbs2ItW6D1tkbl
	2oUTK+J2uoN3qM6Mc1S1S3Hu0dHZcYJSJkOtkCoPbAS9d
X-Google-Smtp-Source: AGHT+IFt34+1ICBGiFFGL68L8S7MvtUKg3hTKrfZfT1RYdTndglwbOB3Hevxm6aiueGdmtq9q7ufrg==
X-Received: by 2002:a05:6a00:4405:b0:776:130f:e1a1 with SMTP id d2e1a72fcca58-776130fe348mr8620872b3a.5.1757834420608;
        Sun, 14 Sep 2025 00:20:20 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a47601sm9815891b3a.28.2025.09.14.00.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 00:20:19 -0700 (PDT)
Message-ID: <b81b16da-5031-4c26-821d-e7bc564dac0d@gmail.com>
Date: Sun, 14 Sep 2025 14:20:15 +0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: process: Do not hardcode kernel major
 version number
To: Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Workflows <workflows@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Dante Strock <dantestrock@hotmail.com>
References: <20250913015147.9544-1-bagasdotme@gmail.com>
 <61249b3d-3996-4d9f-814b-3794aa42c40b@infradead.org>
 <aaf3dffd-cc88-46e2-a65b-a1ff4fcc6eec@gmail.com>
 <5fcf5f4a-1bbf-458e-8aab-8c66d326fd17@infradead.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <5fcf5f4a-1bbf-458e-8aab-8c66d326fd17@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/25 13:10, Randy Dunlap wrote:
> Do we use the word "supermajor" anywhere?
> $ grep ...
> Nope.
> 
> How about we call it MAJOR (like the top-level Makefile does; well, it calls it
> both VERSION and MAJOR[1]), so use
> 	m.x
> 

That's more sense (and that is indeed the term I use in the patch subject).

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
