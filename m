Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D017C26ED53
	for <workflows@vger.kernel.org>; Sat, 22 Nov 2025 17:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763832524; cv=none; b=uIiuJiImEgjU367sbiAhzYarWPzhL1moZTHjqTHtF5ZlypezMITAB9CUMIqvo186cMrLazxvwN3q/mtt05JSCgOaSoUosPUfF8GtmnSZWmQidFr9TVNjNyhlxWI5gbB4kS3VwyTBhVd+Fy/s1quSh3QnnwtMvqjom+qJh9epNDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763832524; c=relaxed/simple;
	bh=5MlvMXZYTtR3C+2ukJ2tJbzkGsByRH9qIzQcgZ1uih4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZIOgCOZZYZEgpZBWIbvs2pXvCcfheqVaDBu8VjPJ9hu+YXWHTstEiSgObjncNQFLPRhqIW7Z6POpxG5VIMGeH4T1E+VjwASLTLwA9nYBqxXNRPFI73RpOEBkr/DhD9izTJ+e9CM6yoG/lM0p0A/2eRoAL1V0jOqOh0C9YMG5FYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5AfyTpI; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5AfyTpI"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b9387df58cso4849508b3a.3
        for <workflows@vger.kernel.org>; Sat, 22 Nov 2025 09:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763832521; x=1764437321; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5MlvMXZYTtR3C+2ukJ2tJbzkGsByRH9qIzQcgZ1uih4=;
        b=J5AfyTpIqgeULMSs7LwLYb5BdhMx26AhFuqy7086YFy7JJdnMoVBVo1YhJys8YF4kA
         WMOGLJ/rDg4ApWJPCNe++jE/8Hnaa0edMyvX++niezWL253ofUzE15a5W4RTzpRZStrh
         0KHZ3oBDHnwm/NAtDoB7nmfDaEQFvaJV0w4xDIISWgSm1kgLs4QeQJLJ2QyDuKIn1FLd
         wtLn1gFB2PBW3OI47nC2i7rtQRix0S85i8+UUtzooMWqVulLh8fDb7BZ/YOSu95TSk0b
         ZjC3CjrqGGJzPvw1srhDqh6PXeyvYxS0+bdDcrTfbt/N8rOjz49D1ArAYuipNKISkLCC
         TEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763832521; x=1764437321;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5MlvMXZYTtR3C+2ukJ2tJbzkGsByRH9qIzQcgZ1uih4=;
        b=EbuLwSjcuNDxW5s6idsXwMzOFFemRhofH4w5/uDnlB/8Y3tTs0r1HkAkX3TsvVDaMO
         oM84Kb3MUtz/oFRx+k0g9/ILwj6Hbmfj5Pi2ot2f41/VSOOzmMcZPImcJPmiZE/lx2n7
         USi52XkuUfMsCJ+BGggMis8l2ZHVV/6tVNloWpFp/OY82dFwYWlClOakxGE/HqufpQwb
         3z8nQf+5lwxxPNHmlzi+kS36j9lH8TKJpNRIZeD/grHmMphy+7KteuhWVhTGXf+d/uOn
         f8R5lqlx/TfrUJH+sW8lUjN74bycEaaUGgSlL5Q9IO7WYVqfD6gFBX6wjB/7tbgmGzIE
         5J7g==
X-Gm-Message-State: AOJu0YxCUnlMFT0ACTfNoSKPQcCmzjpMrW4W4fUhOnbp+/7FKmmVEaw3
	vnqV0JcPQtgYDA2q9O6zGdwxa4dHKzvs/1PsjZnQjbahQLag+O/Q7sFf
X-Gm-Gg: ASbGncudYCjLNdr38KKc5GiBf6s8zotzFkxYN6bZqpufeUEXAPwbSUumiy3oKBjQrAL
	id26L6Ckz95eP2VenAWO7f3lV+HT/Bq9X3UAmj389+lL4jyGTw3MQh6uNZPBYPhtNh5eRp5vxdf
	MoLDuABgwjZj8zc/lhRgjypLRT/fZJ2cxu9HeQOarGdWMo/0neIuqlktbfO2jWoW7xH0yY+iRqR
	123g+IuaUUEICPnmGVNI2J4kCVtWBcQfN5AYHIuH5k5f1R5VYxnkzKUusA4X0o0gDqdwHBAF2sh
	nqgBLWeHqzNSyKMhkSCDqrTwnRvfp8jfhd5y/1l3OyjBpl+yDvTub0NBkaieq43NEhvXUKbCqwF
	3+G2ogUGUXxmwQk2qADcjjKIBJPpH42cF0z5k4GOus3rUqsyLDwkzdRBbmUuLyzkB6e0oJ4RNGo
	ohaiOsGv02Oz9046Z74bat1Eay0X+2Npo+++0dmEdbFO6M+sd7THLkajIA8A==
X-Google-Smtp-Source: AGHT+IHProxUTYxUr7Eg0WsWEkqduy6WY8mRtpWbTz5oJpvvl87zL4seGtqYrXC96lkU4A+SdYOPVQ==
X-Received: by 2002:a05:6a20:1586:b0:35f:2293:877f with SMTP id adf61e73a8af0-3614edd980emr7983683637.33.1763832520673;
        Sat, 22 Nov 2025 09:28:40 -0800 (PST)
Received: from ?IPv6:2401:4900:8fcd:4575:1ad3:3d1a:3314:cdd0? ([2401:4900:8fcd:4575:1ad3:3d1a:3314:cdd0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0243b19sm9534469b3a.37.2025.11.22.09.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 09:28:40 -0800 (PST)
Message-ID: <96d8ddb6c04651224fc66bca825ba99292fc8f87.camel@gmail.com>
Subject: Re: [PATCH RESEND v4] checkpatch: add uninitialized pointer with
 __free attribute check
From: ally heev <allyheev@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Dwaipayan Ray	
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe
 Perches	 <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Andy
 Whitcroft	 <apw@canonical.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
 David Hunter <david.hunter.linux@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Viresh Kumar	 <vireshk@kernel.org>, Nishanth
 Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,  linux-pm
 <linux-pm@vger.kernel.org>, dan.j.williams@intel.com, Geert Uytterhoeven	
 <geert@linux-m68k.org>
Date: Sat, 22 Nov 2025 22:58:32 +0530
In-Reply-To: <f8b93a66-c755-497d-a425-c7b4baff5165@kernel.org>
References: 
	<20251117-aheev-checkpatch-uninitialized-free-v4-1-fbee16ffeab9@gmail.com>
	 <f8b93a66-c755-497d-a425-c7b4baff5165@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-11-22 at 14:01 +0100, Krzysztof Kozlowski wrote:
[...]
> I saw the other discussion and Linus re-iterated old approach/syntax
> preference, thus I think this should also include it, since it is de
> facto a coding style:
>=20
> "Pointers with __free attribute should be declared in the place of use
> and initialized (see include/linux/cleanup.h)......"
>=20
> Best regards,
> Krzysztof

Yes. I am planning to do it in v5 along with coding style doc update
