Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CE630C379
	for <workflows@vger.kernel.org>; Thu, 23 Oct 2025 11:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761217738; cv=none; b=lA1qbFN17PJbOaxMofiQ3g4NwVWUyEHUZyCfb+Je1QLsuponEL/xLJUMMAg75oFxnDbP3cb6IDOYEZs8FPmqyR835FnaL1P6D7PG/CMYyDfnKEa06LVkE6ARmM4h/lTZv+Diiw1qg3NFwnkDIVm+TfA+EwHuiegqO/lheZWTKP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761217738; c=relaxed/simple;
	bh=2gtsPC5so8y6JlR/LE6EcnMO20S4+I796HirmIgdDJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wpywn43gtErVbj+mpcpMAwur7K3AwC1WGG7HDx7hQuSaPCvS6/CQOFOOWxcmdlhE961wh1+i+LKdxjLyZh8ACq6xli8SPZpqzI0aFpXqaTfzAXCRsthn5MDMAdYURjSHqGSUa1qizjkxufggCBqLvmRm//5cpLbmQqNfhoetRZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdKOa3K6; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdKOa3K6"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso1072149a12.0
        for <workflows@vger.kernel.org>; Thu, 23 Oct 2025 04:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761217735; x=1761822535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjVTzYMRUK9px4tCar1m0xiZ+9sd2t0ODPLBN+ZVn8M=;
        b=KdKOa3K6waUkW0GYhOosJkCYGIJIZqrvpfFr6jzNI1/PdhZGq5ilbKjK2XZEEZbTHc
         Cc/LT/mrSSVDE682cRd4WLqCuN3akDe5iQqKbwAJ1L2zaeISF70Tk+kPlkj8OJjLpHPi
         UlhAu6JxbrhBkYTybov3h2fQOdwaXCkAZbDekUBS4NZHspB6eY98cdZonqd4hUrjFVdl
         wjjTynqdzvJukc+HOztd5Sa9PKEZtPVqhcdu+T0mGvV7VYwOnEKKdVV/j7686rJWiyAU
         o9EXG0fGjrT8BaeG9GrRFkEToJAi6d3WwHFN5+PgQvJA3aUc/MKzwXHlKlHUk7bvulS/
         8nLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761217735; x=1761822535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjVTzYMRUK9px4tCar1m0xiZ+9sd2t0ODPLBN+ZVn8M=;
        b=NdQ8nwE8OfOS2fnxRUR5zCXWhwIZdpgDH7I+AjtNMFAF7/sspMFR+TvZMNYeYB7dQM
         nnc5YQHFVAJbXLmbF7BHROZ4DqxEON+1SipDiqsGyOZulMwdrcdF2Eqae0kG8/Z52uDu
         b088hKEb9qVP5nRzToZlp/wkTJRSdbWljTD5d9tJR3cCtKjjDKaikDE881vqP8OUVZVR
         o2LAYJatrNN5m9S6sHZtGzT1tzHF/n2cPVdXNnxAid4JxMTuJe0HTTj9GW7IjTANaoTh
         Ys86ApmNZQgOZ7HZt9HJ8IE/WcJi83HUmmoFkzgHUkXoIaclN8ZyYyHFs9Vm1TR9pp2Y
         S8ew==
X-Gm-Message-State: AOJu0YzFZvyaEiJ737UiZaynKK2lV2+j1ook+qBWozONQIonvOu6r8BG
	7s4ILPdTdkzActu4MsH64I63hHN/lct1DSLLmVu4N9JY6pIY7kFW8yUZr/0XIBD94VL8craJdlB
	yYqWaTDsBWcHPIE14pAvYIy7f0w/mNm0=
X-Gm-Gg: ASbGncujLg2EA4/86Hj1+jSgPE7ge+tELOo6+cvEPeyex4rjVreT/ehCxcqC6tbg7uD
	iuqtj6ibYyU/y2+g9t/M1yh/IuqTR4KMzeP6qF3wmhXpVgUzkO32AD6Pw4856VH5lBLimwEs8XZ
	agQEFcYIi0/XHPaqM/7qQRWUUAVcB8bTq+CVA3CPwtsdkfZuHKHDnNiE5eFnve0tflgDcTqgX9Y
	XklYPBEPKj652wDs07gXD3w4cQods/gJ1K+j8Wd+gAVKAvMSrE4iZ0t6AOd8zik/n9jlQODtw5u
	Nnxh9WN7yq3NM+2jxHoh74X91D95TQ==
X-Google-Smtp-Source: AGHT+IHaZkNWJBzwX+xnT6zDyIsd+FpAB6bVyKjHzY4MeJJT61pxMSaC+0svUKX7j1+JJd4Z5fMUP57lUimsGmTU5qA=
X-Received: by 2002:a05:6402:510b:b0:639:dd3f:f25d with SMTP id
 4fb4d7f45d1cf-63c1f631b53mr22704985a12.7.1761217734817; Thu, 23 Oct 2025
 04:08:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-aheev-checkpatch-uninitialized-free-v1-1-18fb01bc6a7a@gmail.com>
 <68f7b830ec21a_10e910070@dwillia2-mobl4.notmuch> <f9cabfed7b165299b8048670e548c671f300f2b2.camel@gmail.com>
In-Reply-To: <f9cabfed7b165299b8048670e548c671f300f2b2.camel@gmail.com>
From: ally heev <allyheev@gmail.com>
Date: Thu, 23 Oct 2025 16:38:43 +0530
X-Gm-Features: AS18NWALoCjfGGgMJQ1J0KTtA-LIrHjubjnnhPj65_HytxxNdk20M4XgmPj7hPU
Message-ID: <CAMB6jUG+ES6XY7NL5TF-hFVDmz6O5rd9T-HNk7Q+pJA2_9g4Mw@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: add uninitialized pointer with __free
 attribute check
To: dan.j.williams@intel.com, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
	David Hunter <david.hunter.linux@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-pm <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 4:01=E2=80=AFPM ally heev <allyheev@gmail.com> wrot=
e:
> > I would go futher and suggest that the pattern of:
> >
> >       type foo __free(free_foo) =3D NULL;
> >
> > ...be made into a warning because that easily leads to situations where
> > declaration order is out of sync with allocation order. I.e. can be mad=
e
> > technically correct, but at a level of cleverness that undermines the
> > benefit.
>
> But, does this pattern cause any real issue? I found allocating memory
> later useful in cases like below
>
> arch/powerpc/perf/vpa-dtl.c
> ```
>
>         struct vpa_pmu_buf *buf __free(kfree) =3D NULL;
>         struct page **pglist __free(kfree) =3D NULL;
>
>         /* We need at least one page for this to work. */
>         if (!nr_pages)
>                 return NULL;
>
>         if (cpu =3D=3D -1)
>                 cpu =3D raw_smp_processor_id();
>
>         buf =3D kzalloc_node(sizeof(*buf), GFP_KERNEL,
> cpu_to_node(cpu));
> ```
>

I will take this back. Found this in `include/linux/cleanup.h`
```
* Given that the "__free(...) =3D NULL" pattern for variables defined at
* the top of the function poses this potential interdependency problem
* the recommendation is to always define and assign variables in one
* statement and not group variable definitions at the top of the
* function when __free() is used.
```
