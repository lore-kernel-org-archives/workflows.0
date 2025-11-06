Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2333B34A3A2
	for <workflows@vger.kernel.org>; Thu,  6 Nov 2025 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762446598; cv=none; b=VB8Ea0dvyAhIFa4a+MFWbTe7B6/0XihqmRWYP1ez0rgNhasqPjHUQpOBqBH2+Ahp7Am0eHwR9/CiRSR9HSN0dxTIL2hZj0hEO3b6jKhrv/oUALfeBfx/NAMEhKG1L17FAtgOgoVE2yAJ14wU3vPD1bvqMis+Vq2xTDgfzIViXjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762446598; c=relaxed/simple;
	bh=jEkS0wS9JdICTaCzYvZx0OjcAUCfKSnRc9lNZ08RGwQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BMAGTWY+K7mS9/l36ePtpvtUF/zOZG1Ohr8f72JgkuC8XWVlL7FMBlFBRcoOL988kdQRHCo5crLy6CtotJU9EiXotZASe7FRiCWY5VCWAYRHFTiaWihKWFF9QW6nOm3+lZIk92J549vJfrKO2eCG1KjxxR3PHZNIhpPiGnnaHuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ed/MdcYF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ed/MdcYF"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-33be037cf73so1365129a91.2
        for <workflows@vger.kernel.org>; Thu, 06 Nov 2025 08:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762446596; x=1763051396; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EMufvlKZanMTIZvbWWJIkNimyApBJZflYRWdIy87U/A=;
        b=Ed/MdcYFf0bE13i+lCUqEh61uYXZIRFsVri+LZVomCRwmAuWXJVvLQ6mrDubJbKC/U
         vgzdb5uvdJai6GSmlEbySoX2SUCrdlDoz2F9sx1SWdbzdQb1CUxPXT/gtK8D1XUm+uXo
         j0rAiZJ0MNULiHXmz1XEGw05ynjQVlhBxUGfxDUKihjbB22zhlJodUfyutsQ2QKzHe/B
         hA6rKMfalhvvFRHacfP1Ml7PV6yUAAlVMMDPtTvKJ+rNXJHvAsUQu7bL0GCDGXaUQfwp
         vXAO6e7LM+ffXLxPJcsgLhhaDz+7HRmkQkGY8eqQcBvoTaaUIefuchT0dpju/c1ZhgCM
         x+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446596; x=1763051396;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EMufvlKZanMTIZvbWWJIkNimyApBJZflYRWdIy87U/A=;
        b=XLpaOrfQSTynHo4B+HluLYlnrElG9RgYaLol0VSd6xxalmRURzLYY6GzAASPsxrf94
         3KflR1x6HDMLXEDbJtb8rCKZteAplOSH7Va06PrMUSxaaBl1vu3E0+aazpe54/kNhbKx
         jqCxb/33hXLSGucmYFa5j7KSnxdWQwtD2QvVdQFu+eLjk/+I98vqZ4eVXZa3yG0YUVx4
         3l7onuEQYdn8Yf+ybfhbbHwsdqlqVgGG8AjPGIAUxx3H3+LjL3ng/3nwEIiLNqGCDdG1
         gcdV9ESOVSZrp/mrTuAlrKoIlY+7Ud9WxPjsRYdTGRD740BKPS42hqJvLi4SH+oXjPlt
         ao6A==
X-Forwarded-Encrypted: i=1; AJvYcCXC5Pn83N/N/19//2lCrfW8J3Wp9m8uCnkgkal8lNrsz+m01Kv4PTI34UPfAkMyjNNQs9DcQ4LBgfA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1FP6C7Z+6H0P/5deIU9cYTqXMD+N2kQSG2t8DMhYaBtkSOzha
	epHWTLHxvRlNonmAegpoDMSUaPyCtJ5PL3uRGAJ6E5stJthlTwxf9rLF
X-Gm-Gg: ASbGncsBZw++8Oxb+UZKaWFa6+KCFvBaxVbcH00zXM45fGMKUcdm0PUTGVfr8/qwzup
	7oHWrpyXstk22wicBJ+esTcm7ABFgAluRj77+vrUZlggLGoqDpfU5vLeXigjiSmuCXAWQq63Xll
	QiwxOQz3r/vwVTdvWfIgnsK3OKP1XcG1B4ib5LaPQQBJDSN6MMqgNleEuspGylBvS324MwT/2FD
	oICO3wUEkqC3D5eQIegI8WtheAU8c7E1lWshr036mZJpJfdkWBnizFge7oyUbJL8oXdSwVslexQ
	jpLuVAa/1RqpHNfHkqkIyOwiXf8GmCMUpehuV7/6Fnj9TzoUiedwNiAFC/WzH9ZcgYMtNcIbS3Q
	X+82sYzWekF6WNHFO7zk6CIQ616M/RKB2BjAm/OqOsZI7fYrhMM3x5sXshARV55Jkas3oUTwlgT
	VnI+Xl6Rj9HVu25Gtci91nXQ3zPe11bP+Toc9Y850hzQ1myO48IlsuMULU7PRPW4KvKq5eow==
X-Google-Smtp-Source: AGHT+IG+/YJFa+iN7B35iE0D3sOPdQh3iyKV5sn/uuCGaHI5yvaeFznbvQBUEeV5BmhRnHB0H5TLTA==
X-Received: by 2002:a17:90b:3607:b0:341:abdc:8ea2 with SMTP id 98e67ed59e1d1-341abdc8fdemr6666428a91.37.1762446596409;
        Thu, 06 Nov 2025 08:29:56 -0800 (PST)
Received: from ?IPv6:2401:4900:88f4:f6c4:12e8:f050:511d:31f3? ([2401:4900:88f4:f6c4:12e8:f050:511d:31f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68ad143sm6652545a91.3.2025.11.06.08.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:29:55 -0800 (PST)
Message-ID: <67e28fadf4c20433c964d13d96dafe3514457656.camel@gmail.com>
Subject: Re: [PATCH RESEND v3] checkpatch: add uninitialized pointer with
 __free attribute check
From: ally heev <allyheev@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, linux-doc@vger.kernel.org,
 workflows@vger.kernel.org,  Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, Andy
 Whitcroft <apw@canonical.com>, Jonathan Corbet <corbet@lwn.net>, Dan
 Carpenter	 <dan.carpenter@linaro.org>, Dan Williams
 <dan.j.williams@intel.com>, David Hunter <david.hunter.linux@gmail.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn	
 <lukas.bulwahn@gmail.com>, Nishanth Menon <nm@ti.com>, Shuah Khan	
 <skhan@linuxfoundation.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar	
 <vireshk@kernel.org>
Date: Thu, 06 Nov 2025 21:59:33 +0530
In-Reply-To: <221c2b9b-4809-48d8-af7d-f290d1c2a7fa@web.de>
References: 
	<CAMuHMdV+12MoAGNHC9kf==Bt0cLuJ39Fs+W61DN67sE_p-u=og@mail.gmail.com>
	 <221c2b9b-4809-48d8-af7d-f290d1c2a7fa@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-11-05 at 10:18 +0100, Markus Elfring wrote:
[..]
> * Do corresponding source code analysis requirements indicate a need
>   to perform data processing with other programming interfaces than regul=
ar expressions?
>=20

not sure about other source code analysis tools, but checkpatch
predominantly uses regexes

> * How do you think about to mention the possibility once more that scopes
>   can be reduced for affected local variables?
>   https://elixir.bootlin.com/linux/v6.18-rc4/source/include/linux/cleanup=
.h#L142-L146
>  ...

The docstring talks about interdependency issues caused by assigning to
`NULL` which are very rare

Regards,
Ally


