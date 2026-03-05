Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFECD35DA44
	for <workflows@vger.kernel.org>; Thu,  5 Mar 2026 21:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772745756; cv=pass; b=E+1Pqr4Dfj/CQdjiirBBzFVP3IKGocnb6ot5MOSFUwCE98paVdUbZIIGUD2rZgjOUpaGIV/2IUAGsCmtZdPnAjuRTyE3pe4B2OwDNViEk/UqmR/mtVYzpjQT3FR0ouD2djgEJi2tLP8CgQ1ojXkNuJhffxbD3JoMtRNVvCTzWRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772745756; c=relaxed/simple;
	bh=xRV4KrgPufJHYoouG5oBzfgHa9sX1mic2JP1prCF/Sk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQwfIEw81xvZWsT3So/oiSMxcSJo5S6urml3q9wTUqhPydZe+Jjo4JpVTokleDJiajZ/61hzfSEMt+BtTrMgVktdN0Zyf66IoAktqsbD/qwTCGQq++JbBu18Od8GVRsx/WatAA3ZEYkTj3A4qHD6kAmMIBnxdPXU7msYJDwpHHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwCD8JD5; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwCD8JD5"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-797d6bde07fso5203107b3.2
        for <workflows@vger.kernel.org>; Thu, 05 Mar 2026 13:22:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772745754; cv=none;
        d=google.com; s=arc-20240605;
        b=j7zGTEUgV0AZWoQoYPJ35CgZVeHNzyVXwz7pSmMRLsW8KswhEcB1JZts43RntdwIqC
         9A/Mo5igggXc+/ULi/7G0E60xCbr8FZYKia0TkCQmaAJA5FKN5px9ElabTgKAsqKxF/F
         hRuqfPqOGpFafGmILib9HbUDZJox9+yjWsgFhl6WgCtYIQfEl+3DIAX7R8J0G7/beIhU
         tprHydRxL68VNV34ht/LowpDH+oNPLrxF+frbmOGYxX+miv5sjygJrjG1HGkPxdIhmfc
         FyjHkaOz3K1Y7wzF4q+x+J6PaNwJCkEiFZHJa4rYXitYeDKSUHWAKvDUlruvaXiQWs4w
         HbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=xRV4KrgPufJHYoouG5oBzfgHa9sX1mic2JP1prCF/Sk=;
        fh=98O66pDS1KHb2a3oykYtn+xlx+YzmBQ2OhQG9rD0CD0=;
        b=Tfk07bC4RoEMwoz5JSuEo0a26xw5QpUlFIJ6K7xMbsFtG5vhOLqXNKMExDgPB3EXSJ
         tZJz3jSlnAOaaK0CroCZ8t1FIgowOGnK66GWk1iEqwUqZAIlP9nid3cr4SUxFyoNwAgg
         oFf5MiaXEU9dQpJC6/ySvCUa+Dbzrioh0U8/ZA1zDPq+jz2mO9KyRa6trnaD367YeYcM
         Z7L+VQhjpZl8gEdu+GHVc+4GuQcgAxQsI835G8NxeDBTYf6GWzKzFg+TYNqmG04AaHbv
         FPggJQq8wVujGjgn6Wbj44A/fbUw7K3kXEepGAwHEsUbWzzq9xKDzupknh+UfVLyZ+oT
         fEwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772745754; x=1773350554; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xRV4KrgPufJHYoouG5oBzfgHa9sX1mic2JP1prCF/Sk=;
        b=UwCD8JD5Nt7KVwhWhvDouar5AnDLfUEEyRwNPxz9WD/FSEPNLoLTdxjOwT0oH/q9uM
         RAFrFY41HkHXmJpWnbVYikJaV2bSiN0wYMHmJ/YJbOSiG3cA3ygsUys2RthW7E5t7JiQ
         RKdC4HWMbIFSBkCJywpD5h5T1JKKAzTR9ylkzAo+dAAGLnBae61AtPWU5AvAbyY0jOJc
         WdP/OUVv29xMyWQ3tbS1dWORmSWv1GPtzB2iSY9xgjTgE8HRGEIIxwGgQFhx+qdr9EG5
         1hhQRo+3KObCWa1OE6k67gpTgK9nr3bvj7bWwHH0kLnBfOCeMu7RjTRHoYSj2T6m4Eig
         QH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772745754; x=1773350554;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRV4KrgPufJHYoouG5oBzfgHa9sX1mic2JP1prCF/Sk=;
        b=V9ydTg1jF/fHqjbm9P3zdalXdznIiBr1g/2FYXIC2daPyULknYuEOxX/DtuyN6fqGY
         jUtz/zqHrkvcSU5vU3Q5Ag2QEv87sMYA1v+XqV97UkXLYNsjv0LQ9JrB0tFyF+a5LGEb
         1+w2bOpDgvey6impS8SI3Tx93Djo/k01/N7RL99fDuD4ayGmEp5OVxsGlNNNpA/Ae+ug
         wzlOzBTeMF7EXFSCvhhg0GLkn2ID3mvg9e2MhczxFeLZCZZGzvekxmypDgDcA3TmGUHV
         xHRS3yjZJvNKu77J+RxJuk8+4NHKPRotL9TmnB6mXRugV+ZfDwKKqI1W+SnoZWraFOyR
         weag==
X-Forwarded-Encrypted: i=1; AJvYcCUMIGdkvQ+Jz7nM+xa7mogzfY2Mfj3KLK3UykIux0wn/9he4rIFaLEPFdvLOV8LP32EBM/NyeA9HMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YznkhIt1Tzh3q7zIop7xjw+mdHwhDb05Ja632OzCjoiq6UeIgAf
	UzrM6zo8jADF6SnP24SgFGMXSMySF7+4P8kiIvvtTmKnJ3xlZd2ahIfPOOa9IACt6g4lGGWjVGK
	FGRUGbwdRMhWu+vmdqah9/g76d57VLD0=
X-Gm-Gg: ATEYQzxCL1RKLMwN0WahBdwFqXq0179rxNB4YnHKNx/9fs8NnysMQrcd31CHGpyzAGS
	YGnqtsqauLx6IOBvjMvl1ZFl/bF9lD/eRuW8N91WflUCEcIciU2kWI0Axxg9RUBrstIj1uuQBcL
	GaXOE1dfr6pjlMuxYPxAmkh3mYmb5XcJNC2SpXzyttq2efphpms997X1kGy+MSooN9Ik1MQtzP4
	cgqkRcoyLEWm35VIYpXVWNpBKlxi3v14+gvRArJCaZPkExCYfofvRnsunESmcE3+DUapjgXJEk1
	Uun9YwqR
X-Received: by 2002:a05:690c:385:b0:794:2fca:81a with SMTP id
 00721157ae682-798c6cdffacmr55975367b3.8.1772745753906; Thu, 05 Mar 2026
 13:22:33 -0800 (PST)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 6 Mar 2026 06:22:32 +0900
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 6 Mar 2026 06:22:32 +0900
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <aanievpHCv0Sz3Bf@wieczorr-mobl1.localdomain>
References: <cover.1770232424.git.m.wieczorretman@pm.me> <bd935d83b2fe3ddfedff052323a2b84e85061042.1770232424.git.m.wieczorretman@pm.me>
 <CAPAsAGxpHBqzppoKCrqvH0mfhEn6p0aEHR30ZifB3uv81v68EA@mail.gmail.com> <aanievpHCv0Sz3Bf@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 6 Mar 2026 06:22:32 +0900
X-Gm-Features: AaiRm539DykMmBy-Zg-BtYOlfUPQKOJ6bwMQcvFff9WH9ZMuhoRcwF9c8D83p3A
Message-ID: <CAPAsAGyiukChPLYO_tQci-7Bvmnnxh+w=bO6eUYLrO3RVuUThw@mail.gmail.com>
Subject: Re: [PATCH v10 01/13] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Samuel Holland <samuel.holland@sifive.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, workflows@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Maciej Wieczor-Retman <m.wieczorretman@pm.me> writes:

> Thanks, that looks really neat! I should've thought of that instead of making
> separate arch versions :)
>
> Do you want me to attach the code you posted here to this patchset or do you
> intend to post it yourself?

I think you can just squash my diff into the subject patch.
