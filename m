Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677110;
	b=Iu8IHRn0A44cYcBSEU805C3/9aKUoeRvfWH74NKo+yF62fRj/bk6pTBRh1gaWVbLsckH
	 oSN87WRfl9KxTz0cOvBCAuwYCCptGfvQSGUeHvX/AloUAtowjVqKS1nkEXTyA5kMv1MxK
	 EDosuNlkKjI2AlEFaRe/f/9IfqThSP/5V5O52StABZfCa8ftBSC2BLmvOLv+8+Zd+kdyo
	 qUTEM/ejESmfMNjfVma/B3efDAdWBYGFpS3QWrmtbzApGqrDdnM4GxMimGW8nqsUwRU/j
	 LqvoD8cz3oHp16C3j17/hEEll84AGpKNgezlrI3g4E4MUaBYEKylLHwlg3W5oQ0KbTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=h0xEqPZPyZSvEk4q4GfAAXI1OYobmiwWWcxbzy243zw=;
	b=GlWyuykoLJARTyYEG8Mf5d/uWAzm1Oi7RwAi6Kuxu1W4qoJQycZ+/XH5GgdGwXNE0BgJ
	 pMLWzafxh2ITxIRxmGRttA8FwGFM22sOZMP+e9hYJELkZIG4/6nJ+SKYycs0zIR+dw8ax
	 xX8/6w6bTcdCLY60ypcmdBNvLRmBtUVVAlo8UWDv/m188baK3nv//W8KOn2LDAd6BdQJ7
	 B8J41LLWuW+Mgs0nH2sX35VbopjF0SXeAXJ0TCpc+vFhf3371whB/wsxhQR5hQkEc09BN
	 o41Kx0AsGSoJJPPJ8HgSBLZZOH67vR/INykFt/uODjaZAikc27NBZWJ5zsQWKiSbZzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TEm/dmZH";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACD2606A330
	for <workflows@vger.kernel.org>; Sat, 14 Nov 2026 17:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ACD2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TEm/dmZH
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1101160a91.1
        for <workflows@vger.kernel.org>; Sat, 14 Nov 2026 09:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677109; x=1795281909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0xEqPZPyZSvEk4q4GfAAXI1OYobmiwWWcxbzy243zw=;
        b=TEm/dmZHhBs0Ple8gwcpThb6q4glfvu0ea46PbbTPWpZa3Qh+gyuWm4CpM5B5ZJ2IH
         p25p+zNz1m4drXpInICQlnfmXDtIPakmU2qbY5whTtRlSMtH44PIIfNsexDaE+GvOWVN
         EttuqLOaoZOGeRu5ji8sqs0zsP/DHqM7MqY2N1UB4O+wcK9MYXI2M8K7MGkBARDDK9P8
         palj9CUuGQxpCvaKn+q243Cw0qvMgzjJyhXeHtPxxvZuMbKIWDMkboGsMGtzA8kGijuF
         MrMaOOmml6cxeEIw//cIaqJ9Df18+DvB5r+5fSPBu+DEy61mOshL7euL4e80wMyT14OV
         cIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677109; x=1795281909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0xEqPZPyZSvEk4q4GfAAXI1OYobmiwWWcxbzy243zw=;
        b=F2GGxThrmm40aRe1A1soeRJsH+RIvQblIrWpBKzNSgxdp9L96q3f2E7BKgLNnrZXyA
         P/ozolOCSRkn8R8zBXGhaXP+WvaGhmf/9t9FP/Y10+SIODcqorn8K0SFPxpKMAhkmvDO
         iCSpzi8H+IjYO3rRhUFB/YTXdDK0E/G6MKFCPi8R/0ZIDJhhqvZDp5f1ArxavF2GNx6S
         RQCYzfo7aCxVdAn4uAM+UuSDt3jTiBvZwtSHBikdg26LYapuBIlermg0fpntCWqALtOj
         MkiMkNq/ypHPtO9aHgQrHw+XhE1IlHx0v15sPM9mDFo8BhHvPAHoN8iaqxI1s/jPel4H
         Ypqg==
X-Forwarded-Encrypted: i=1; AL+hErH5BuPwbrBNwBGI2Kcm6Vi2oFmJvouk8evAwNLTsHq+k6aVPRyHCL4RSdSFcm6vk7XGfqGF33mO86o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rQDyQEqV+q3lR5h1BNB4ISGMK2+Neu7iSQKmvWCzaDUbNPyfz
	m8Qsbvf6sDKbst5mMzz8DiIwmh43u70JxGA+ZgUMa27EyRuF8jiWzisI
X-Gm-Gg: AYBFou2y1DPl9tOKNT4Q3i1IbsuChk/Hc2rlZ40xw9g68UOZwgEzZ4U9lmSNaD9xdPr
	OOmwrn3sVuiaDZEE+EGJyZY3A0lVCo5UFYPokMeqZpjPt1Ztn0dseb/fqq+kTCTfYcn1b8T8Mco
	ntKxnADcR+Vm++Pt36qFGKCErJRFH8OsoqMUV59ail9ECbK3STjcwvcTtxu0J1GRVXjfHqASbEJ
	psbnfIVg71FYnuA47OjWmeOgkNoph7DcoqeUP4kEy+Y59U3VnJAYsmMV6PAdcScWX+8iJULeOPB
	ww4G2YVUrbAlhz4WXHDaQAFQ/9dO/CHGm/ItHHsUEdm4yOBqCPabUChNH8hsrvDc2E+rzxbFn4z
	RYbjjeqfjyhbwd9myb1Jm35CgDHknWtKATbptzaTdRCLi2m3eHJk6jH0lS9thBbyUofa4tBgO3l
	jKQxeb4PwdcWmPRC2p6/plK3r4VF3qFwniT5pVG/4qPsbzohPXodlEhxLfZquUQtMYq5CTM4JjK
	91X9HyhNE72KQQfs4RLmipx8kURoRm4je56iKknOhuGftQU4eabcOTcCbYiTlr+U+SuUyavmtxD
	w1L4yyTCyv7k5pqYqMOtFE1+x8iqpw1PPqjDni9W6KBqfg==
X-Received: by 2002:a17:90b:1dc8:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b1b0b5becemr3918051a91.8.1794677109388;
        Sat, 14 Nov 2026 09:25:09 -0800 (PST)
Received: from [172.20.11.208] ([64.141.80.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce49d6sm14999864a91.4.2026.11.14.09.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 09:25:08 -0800 (PST)
Message-ID: <dcaab84e-cd40-43d7-b747-51f490d4e8ff@gmail.com>
Date: Sat, 14 Nov 2026 09:25:07 -0800
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kernel-docs: Update book info
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261114124813.1056807-3-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20261114124813.1056807-3-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 11/14/26 04:48, Manuel Ebner wrote:
> Update info about Lorenzo's 'The Linux Memory Manager'. The source is:
> https://nostarch.com/linux-memory-manager
>
> CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>   Documentation/process/kernel-docs.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/process/kernel-docs.rst b/Documentation/process/kernel-docs.rst
> index c67ac12cf7..dd5bef154d 100644
> --- a/Documentation/process/kernel-docs.rst
> +++ b/Documentation/process/kernel-docs.rst
> @@ -79,11 +79,11 @@ Published books
>   
>         :Author: Lorenzo Stoakes
>         :Publisher: No Starch Press
> -      :Date: February 2025
> -      :Pages: 1300
> +      :Date: Spring 2027
> +      :Pages: 1350
>         :ISBN: 978-1718504462
>         :Notes: Memory management. Full draft available as early access for
> -              pre-order, full release scheduled for Fall 2025. See
> +              pre-order, full release scheduled for Spring 2027. See
>                 https://nostarch.com/linux-memory-manager for further info.
>   
>       * Title: **Practical Linux System Administration: A Guide to Installation, Configuration, and Management, 1st Edition**


Reviewed-by: Carlos Bilbao <carlos.bilbao@kernel.org>

