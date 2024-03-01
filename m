Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604FB3BB41
	for <workflows@vger.kernel.org>; Fri,  1 Mar 2024 20:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709323857; cv=none; b=Sggy55J2p28S9fejMn+pkuDoaLLpIAA7Lixi75igZxhct3NLbEndgln3vVo2UE9/2CqFBPQkO66Oyve4T/rjtKy3PSPUJBqTFlp2GZba5Pot/yeVD9Ln8xLcks9JfKc7/M3kvfthjdRAokTdEzIKRV8PS2grqJiNnBq2yKN2Jqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709323857; c=relaxed/simple;
	bh=eIlmeeWJ+q21jvedK7al42fEAfG42vJONf3MXPx/cRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vxl7T4Emi3CmhYrkMoQGIi+GxuOpJUQ3wmbsFIKoBdh4fCXbxwncAfWNDMR8s6Ygb8+g+M/Uw4gEVvNqP0/Cu9hH9cfpEDhIK085P+Yph0yWTBwDksWY44iKNoEbz6ggP017DaHts9AwFat6GTBADOXvKUMwKgjbfeQ1BZJ7nng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JbhQTC98; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JbhQTC98"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-563d32ee33aso3530777a12.2
        for <workflows@vger.kernel.org>; Fri, 01 Mar 2024 12:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709323853; x=1709928653; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GjHlLe8ifOuwGHIPhGu9Px14t+AYIlwm+A28Gp3fNW8=;
        b=JbhQTC98JdHfGNFyO4r5pc4+JyvgS0jT/zfZ2tHv8dMGxTKBWofqfG0sIlp9FVjyym
         YkPbFern0AxJT78q08PcRbeXB4TVeLLNHa42/QAJNyIcvN3gPH3UMLRHe8ltEiyVzvTr
         YhW8i9epCHCzcb62oIk8PlyBXhC7DFtYGNwfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709323853; x=1709928653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjHlLe8ifOuwGHIPhGu9Px14t+AYIlwm+A28Gp3fNW8=;
        b=PxQXolcNa40TdTeC7UuiFIRfAcRYZACYdmI/mIFMAPo6C6mklkOVXx7HwgejgyScwz
         g6HRe/JDaU/Vgzk+bAq8LXr4j5Do0Lj/DlC+CUDj94mPGhF3RiK749LGKW8Uc5cfvRYK
         Rxjw10o/9bewMO2oYUM3nHi2jqm1lXTHZtxeVqCzamWJUGp8dObMzBGcDMNbgRp30OSC
         mOK+qO1UDwyH0t+XD5Z6FZrpgGJTyOYQAV869IlH2RrJn36YEOpUn6pxPafSORnZ9tl2
         OpPJbNE7zDEFdYonmR+IznDJ9zSMjIE2uB4u8iSIdZndaGQqmBQ5YEMdv81mB9p98X2j
         9HBg==
X-Forwarded-Encrypted: i=1; AJvYcCVq7MfGeBrX3y9dN/1b2poUfWoMfk+0MdYdKdX18Fwx8UxOB359CWrSTr5NN9+97Rov9yXnU4eOBNvdrB42bVhdJwJG7LhxionC
X-Gm-Message-State: AOJu0YzBWRh0XmCzusea5enmrxMUSAFtcp0Xi0szRCD6XTgBLREs3zTW
	WscsmfVpMdn8TQn3R/mb4UOrTv6wFZiiQNSZtFXbUtolKL3sH6Q8VAYfeogceEUIbNv6jCCGtyM
	nzVXVTw==
X-Google-Smtp-Source: AGHT+IF1wUUWPld7gxUeYiXGScBswhL8em3hNbiGnU1Nnf7FRUbX3+vA/PEs7KHERF7sJR2B2JiWzQ==
X-Received: by 2002:a05:6402:901:b0:566:6a1f:c548 with SMTP id g1-20020a056402090100b005666a1fc548mr2242895edz.3.1709323853493;
        Fri, 01 Mar 2024 12:10:53 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id fk25-20020a056402399900b00566a461e1ecsm1772040edb.73.2024.03.01.12.10.52
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 12:10:52 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a449c5411e1so130921566b.1
        for <workflows@vger.kernel.org>; Fri, 01 Mar 2024 12:10:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVCkb59ZnfqlayOgkWj38jwM4t0RDrd+6Tg95EFnfVWLaXS6ScsCcgx86Xsud4y9q8ILcYD/9188U1ALQbOOmQp2n105yPMuext
X-Received: by 2002:a17:906:e08d:b0:a44:731c:bace with SMTP id
 gh13-20020a170906e08d00b00a44731cbacemr2324717ejb.35.1709323852310; Fri, 01
 Mar 2024 12:10:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com> <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com> <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <44ae0339-daf1-4bb9-a12d-e3d2e79b889e@gmail.com>
In-Reply-To: <44ae0339-daf1-4bb9-a12d-e3d2e79b889e@gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Fri, 1 Mar 2024 12:10:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiccniE=iZDC_e7T+J8iPVQbh1Wi5BaVee9COfy+ZaYKg@mail.gmail.com>
Message-ID: <CAHk-=wiccniE=iZDC_e7T+J8iPVQbh1Wi5BaVee9COfy+ZaYKg@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel Testing
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Helen Koike <helen.koike@collabora.com>, 
	linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com, 
	pawiecz@collabora.com, tales.aparecida@gmail.com, workflows@vger.kernel.org, 
	kernelci@lists.linux.dev, skhan@linuxfoundation.org, 
	kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
	cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
	ricardo.canuelo@collabora.com, kernel@collabora.com, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Mar 2024 at 02:27, Nikolai Kondrashov <spbnick@gmail.com> wrote:
>
> I agree, it's hard to imagine even a simple majority agreeing on how GitLab CI
> should be done. Still, we would like to help people, who are interested in
> this kind of thing, to set it up. How about we reframe this contribution as a
> sort of template, or a reference for people to start their setup with,
> assuming that most maintainers would want to tweak it? We would also be glad
> to stand by for questions and help, as people try to use it.

Ack. I think seeing it as a library for various gitlab CI models would
be a lot more palatable. Particularly if you can then show that yes,
it is also relevant to our currently existing drm case.

So I'm not objecting to having (for example) some kind of CI helper
templates - I think a logical place would be in tools/ci/ which is
kind of alongside our tools/testing subdirectory.

(And then perhaps have a 'gitlab' directory under that. I'm not sure
whether - and how much - commonality there might be between the
different CI models of different hosts).

Just to clarify: when I say "a logical place", I very much want to
emphasize the "a" - maybe there are better places, and I'm not saying
that is the only possible place. But it sounds more logical to me than
some.

            Linus
