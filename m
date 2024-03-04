Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6366E4C3D0
	for <workflows@vger.kernel.org>; Mon,  4 Mar 2024 16:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709569058; cv=none; b=AJ4IC78qXdjF7/3jwZ+SHvM7FKtH9Yza6FUmqmkyI52K1x1BKIXmLdmorIVy2TiaCQvCm/N0lq0jZrqVeQbj012ZB8QuPc28hTEluLHfz5cPeRtyF4Z4H18N0V5G3LYTWeWrxRAuq0zgLgdG4FyvsjbY1PeVWGlWrqcTTx+AkMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709569058; c=relaxed/simple;
	bh=pJO9gacEPP5sFMHLlJa9c2bsoqfYUttJAmzyO8JWUPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HiUZc2X5IIuNxhCl3GRTpJWGDcDfrt9rrtAXAk8lkh8LGxVb7P39o1Nb665M3UhMgweA0F7aMkN0g9W7L3oh3uYYOoOEfY7/i6uuPwUnyGPGLqv7mESYgs99C7XZ9LMvWTDuKSIuH9H+IOqJFXRzdt8dk6Q5H7QCp/oOLcPt6sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0XMowtvi; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0XMowtvi"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-42ee0c326e8so438361cf.0
        for <workflows@vger.kernel.org>; Mon, 04 Mar 2024 08:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709569055; x=1710173855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJO9gacEPP5sFMHLlJa9c2bsoqfYUttJAmzyO8JWUPM=;
        b=0XMowtviMuC3PQXjsOAJpTHN4JHtfsV8awizI1m3PR2kdW42J1OYgyOh1c/bcHY26k
         fRX3GrBTsj6YcaB1aaujiA0HwcWRXxuF5e0Et5SjnwK9UyDOvDOX6JizRaJUvIxOGfXV
         PrJ17n4MjmFHC50D4xTYDFkwbwNyimmmcz2M+wBlwaLsX3NNQZVgP3GRFkO8A2ulKRFK
         1DAft01hjA9W4A7QuqCP+wHTWw9VUAtlSNUubMcfW4odjjNT+exlucYhH6LMF4nFw/mb
         I0VLFhw5dDESlvOb7H35+QCR+QEYeuxa4aAvr9kTTEI15YzgAY7TBGru9AcocWK6nkef
         bPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709569055; x=1710173855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJO9gacEPP5sFMHLlJa9c2bsoqfYUttJAmzyO8JWUPM=;
        b=CmTpn2mrkTm2BVLerWSuRPuU8w9YPqAFgjZu3hyUyrvZncSDBd96remf2EFOnT1znx
         q2bpFTmtHKTMC1/QRnpJRFHsQmCRpcegVIXbh2b0pjFem1EP0S2gr30Pv33lCR3STOPx
         y4emWFp9gor4QnifY6MK4tRWcESNso1CSZzztVGxaoY7gGnIcYAahez/A0sKflGWlwmj
         /DzMKaiOvRe6i3AQVODqipomcyw0XtWeEVc7kXVNzz/eeX1tADCtgJ0FrbdmzAlm0ADo
         Cy+kLR9/y1k7LKugtVpWw7T/QWyLfKM/HAur+Aw9ntuhnHRO2oIGLObWEvEKdO6D8/Gw
         oLAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrMCxGQ+FVwIH5SNfmlvgM1Cl48fercidTRSHdn2dQiLzP7usQq6CEXKGS6Ajjga3hEoBRauQDWG7gKTfdZKBIMPa7LnuwJTeX
X-Gm-Message-State: AOJu0YxVuIg1/0yjy8gh1qckS/v4TFNnaW9SsE74SAQJqs8BByQMYVfi
	awZIukzAfwuvm16x8FmCZUXUmVy/mpj/lo57MVwHCJoethhZ6T0tiwMS970O79IlLRWE/vB3bcr
	g1ZMdYUHrF69UTdqOqXkhX+PjXyD3fhOxatHk
X-Google-Smtp-Source: AGHT+IHbFr+UrpkmDyx9eEQjvWp5e9il7+Ss/3DBjwoc6vhBdezPC0MNPvzzn5kv1q0w0+yTuTK/ZwenVZtUrxnT/+s=
X-Received: by 2002:ac8:68a:0:b0:42e:9dd8:4a64 with SMTP id
 f10-20020ac8068a000000b0042e9dd84a64mr708152qth.18.1709569055283; Mon, 04 Mar
 2024 08:17:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com> <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com> <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
 <20240304-rigorous-silkworm-of-awe-4eee8f@houat> <CABXOdTc4MXcjwgGuJb4_69-4OFELD37x0B6oMr=4z=nxZ2HPXQ@mail.gmail.com>
 <20240304-ludicrous-grinning-goldfish-090aac@houat>
In-Reply-To: <20240304-ludicrous-grinning-goldfish-090aac@houat>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 4 Mar 2024 08:17:22 -0800
Message-ID: <CABXOdTeDydWO9mf2yxWjjebHZ1bE=R2HPs1P4XYwNhzznNKxmw@mail.gmail.com>
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

On Mon, Mar 4, 2024 at 8:05=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> On Mon, Mar 04, 2024 at 07:46:34AM -0800, Guenter Roeck wrote:
> > On Mon, Mar 4, 2024 at 1:24=E2=80=AFAM Maxime Ripard <mripard@kernel.or=
g> wrote:
> > [ ... ]
> > >
> > > If anything, it's more of a side-effect to the push for COMPILE_TEST
> > > than anything.
> > >
> >
> > If the drm subsystem maintainers don't want people to build it with
> > COMPILE_TEST while at the same time not limiting it to platforms where
> > it doesn't even build, I'd suggest making it dependent on
> > !COMPILE_TEST.
>
> I don't think we want anything. My point was that you can't have an
> option that is meant to explore for bad practices and expose drivers
> that don't go through the proper abstraction, and at the same time
> complain that things gets broken. It's the whole point of it.
>
Can we get back to the original problem, please ?

Build errors such as failed 32-bit builds are a nuisance for those
running build tests. It seems to me that an automated infrastructure
to prevent such build errors from making it into the kernel should be
desirable. You seem to disagree, and at least it looked like you
complained about the existence of COMPILE_TEST, or that people are
doing COMPILE_TEST builds. What is your suggested alternative ?
Disabling build tests on drm doesn't seem to be it, and it seems you
don't like the idea of a basic generic CI either, but what is it ?

> > The same applies to all other subsystems where maintainers don't want
> > build tests to run but also don't want to add restrictions such as
> > "64-bit only". After all, this was just one example.
>
> We have drivers for some 32 bits platforms.
>
I said "such as". Again, that was an example. In this case it would
obviously only apply to parts of drm which are not supported on 32-bit
systems (and, presumably, the parts of drm which are supposed to be
supported on 32-bit systems should build on those).

Thanks,
Guenter
