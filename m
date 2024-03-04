Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6C947A74
	for <workflows@vger.kernel.org>; Mon,  4 Mar 2024 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709567209; cv=none; b=ifnAqGZX4Dw4qNe4xbHnuTwqFznpir7fNfsnKRUQAkFPlVpXkLilnrmCYpfjlL9P79BmZOYSmkZbugHcV3AVLCxLfDpa6n/N8We+4O21LfI71Yp/FQ5DiO8Sm29SLZLA8bxNdPsLTDqF7CI54NaMiDNfiORpzB4lVUga8zme2tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709567209; c=relaxed/simple;
	bh=FmYFhieBdwNBCdmRDPjUD9GHVVYPw43TwbCvph3PCyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSid44fei69FP0bIicTAkL/E2qbp4Ktcn+2DGzPQKktZDz65T+XI5xKlbtEitopDXnFXDucfwOap1GdLsrYXuzOJ6+mrOpjLGOMETO7k/abn6ubJQvIjpXcdbo/46Hc/g6luDSH5dGNgpQFTEgZI0NV95nZHJdfrVBRavr/drxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zMtyW7or; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zMtyW7or"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-42ef8193ae6so101431cf.1
        for <workflows@vger.kernel.org>; Mon, 04 Mar 2024 07:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709567207; x=1710172007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmYFhieBdwNBCdmRDPjUD9GHVVYPw43TwbCvph3PCyc=;
        b=zMtyW7ory4qAkVhAvoy7yeR1s2R7gJhMzIySVSppKcc0iR/ZX7Y10g0lcS87EzQt8K
         L6v9TiSzcH+2c7u3fANMVaylZ0OWnIsNarg5sIvVgUJAm1YrsQOCqjeoTWuaD3CZkmao
         3YKyrnVU95Ade5Z2iDGuTFk96NuSVbLFSf3sNzRPxbV82ymvPcbce3pLZbJALA7jbS2D
         GpupACFvJJbl+DfOG6ocyNtXWas8aXJXrFTsdE1jM2Aha1wbeqDe+NVxp761xHUxNGwm
         RktrPhSWUX8jDiWCBxI5tPuGEM8QuM0napTtCz3R/h4d4m+gd1G+/bK4xqgDAjtunwZ9
         dgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709567207; x=1710172007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmYFhieBdwNBCdmRDPjUD9GHVVYPw43TwbCvph3PCyc=;
        b=p2Jz3Z4f5Phvo2lZbUtuNOYkLPvK1r/Tt0/3+xR76vdPuuHLz62JWaNnWtZO5lSDZt
         J4xtSLFYQaUxM1zN35gU/GC91DjY1n6WLMGTrOiEEe0QFcRSCQWcTFUbtzFqNhxB0VdV
         34HjSnx9RLhX2icfagdzGmsonnTVY+0nuoXwEmA9GUlDtSTEct/guO1tVQj7mMPj7Zqq
         YTe3s/MB/8lfdaZZ9CaL3MueSrl+xJTNUChfSYmJJW8V19cscAe7oG2nq+ntYGDTzHn+
         CBY4srQw2dVJu+0kBVo7DwPCTlJrOzWGirQF5DDqSdycv1h1/ThdUBPrCb8ehdETQFE4
         1GJA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ7E8tnu14AZtA1USp4IjP/85LVREoJgs8y5ZGdPzrJgKHMF4/Ak3O0RPVgCcw95JY2vwNFL5GBKMabhZd1+YOWJSOYWRr5yGM
X-Gm-Message-State: AOJu0YwNTqP/iz4bOp/nd3sWCHsYO2DWNfvNIGsl6/xvv32mHbLnjzU8
	oVgSqCRXeaGVDBGzQVdifbBEqnuaVOvHxtG0OxDMRnRfUWxW78ayBp/6JXV9K4BWYuF+fwhmyN6
	FmpwppMX6VkH6IV/mHZ2Nyz+yF+bhlqzku1K2
X-Google-Smtp-Source: AGHT+IFVI6LZq4ULZ2pJwHISc+k1i94355Y/0LAb1CjD+NtEu1Yvguv+RgPLIv7k3k/C3Vw9/9vsUOmbNMtl5qL4OZI=
X-Received: by 2002:a05:622a:11cd:b0:42e:d8fb:8ab5 with SMTP id
 n13-20020a05622a11cd00b0042ed8fb8ab5mr505328qtk.5.1709567206948; Mon, 04 Mar
 2024 07:46:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com> <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com> <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com> <20240304-rigorous-silkworm-of-awe-4eee8f@houat>
In-Reply-To: <20240304-rigorous-silkworm-of-awe-4eee8f@houat>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 4 Mar 2024 07:46:34 -0800
Message-ID: <CABXOdTc4MXcjwgGuJb4_69-4OFELD37x0B6oMr=4z=nxZ2HPXQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel Testing
To: Maxime Ripard <mripard@kernel.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, Nikolai Kondrashov <spbnick@gmail.com>, 
	Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org, 
	dave.pigott@collabora.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org, 
	gustavo.padovan@collabora.com, pawiecz@collabora.com, 
	tales.aparecida@gmail.com, workflows@vger.kernel.org, 
	kernelci@lists.linux.dev, skhan@linuxfoundation.org, 
	kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
	cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
	ricardo.canuelo@collabora.com, kernel@collabora.com, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 1:24=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
[ ... ]
>
> If anything, it's more of a side-effect to the push for COMPILE_TEST
> than anything.
>

If the drm subsystem maintainers don't want people to build it with
COMPILE_TEST while at the same time not limiting it to platforms where
it doesn't even build, I'd suggest making it dependent on
!COMPILE_TEST.

The same applies to all other subsystems where maintainers don't want
build tests to run but also don't want to add restrictions such as
"64-bit only". After all, this was just one example.

Guenter
