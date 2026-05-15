Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713043B27D3
	for <workflows@vger.kernel.org>; Fri, 15 May 2026 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855129; cv=pass; b=RoiXQ6V9epsyU0P4otPUDr1wnxNvcYo1WtCDKN1DdvvPBLa7y9S5a0rn+NcKIHKCjU3KnLtWDvtGLH77cg6S8/Yurf8yfjRLYbaELrAT/L3mWlMJk/PWQbk8cqAPDAB/xOuIUgHSXu5FjgKVEz1pExCmLLiangiD0kZBOSxyvkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855129; c=relaxed/simple;
	bh=TA5ESWaxk/ziiyS01LtpqfhWIycxEsFgwAIPwQRU0UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RPhHsWElLRAYWW2hRa/FD4/+chat+T8SMQRKCectEPqbwoRnriD3y+iAuJG6uC3CXKKiaSFeai+yQ/pDL4EoGvOVhJxdGLyUSQ/mcErutH/P/6oF/s0Z2vucMlBj3oIJ3EOBBEyLK+Zu2VPHle7NR/M1sAy60mXdkRlyiINJh14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gbxO49Xx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kmAqZPm7; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gbxO49Xx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kmAqZPm7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778855127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x7Embi/4WSTFlWQtHoiZCAOUQi9JugMiQF8nvMXYC0Y=;
	b=gbxO49XxS4zc4ZW5UNlsbRzGtqWtTCHvJhOmhZslF7ZaJCZs5usU3Z6Okdd9vvx/43DAFq
	+TMG86nUPKK0oUFm0fW1qrnJiwCMKDdgfp90wfmEp3bMiPpGnqx+OQYK3hMqLoMLTfmdTp
	ucs0xaPnhvN3yluyip5hANDsHmLZJFw=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-eY_xxg3yOlqfYR9huU66-g-1; Fri, 15 May 2026 10:25:24 -0400
X-MC-Unique: eY_xxg3yOlqfYR9huU66-g-1
X-Mimecast-MFC-AGG-ID: eY_xxg3yOlqfYR9huU66-g_1778855124
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-651cc9f2261so20635400d50.3
        for <workflows@vger.kernel.org>; Fri, 15 May 2026 07:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778855124; cv=none;
        d=google.com; s=arc-20240605;
        b=g9LFMl2F038BCWNFocd4M/s2MBRirjk5Fm5OCQVOJYOPcH/n8HAfviJRjbF04F/VaX
         Dnu5BmrSDXUj+0NWpVAAouV8EAtK+iAGE0/PGLxPQw4yI3tvj5TbWMHINNKP3Zoq+8gC
         fzEO/b6E2YjoWl7DKhgtnWzVB9rs1il6jKA395n/tbAOH+tXCEc5N+oFMI7SnT4y6Ns0
         bJ14tR67oHRdVgU6UiMHETLA2Ppl+X69/0aNu81m+qMjRRkRfUxqXaitFjrBI7ZL05RH
         qbDyeBIXS8ogS3NAbRUaSlUob98Nho+6eFZi1m9lAS82f7t3F5pCuSk+yAU7CZDRT028
         brHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x7Embi/4WSTFlWQtHoiZCAOUQi9JugMiQF8nvMXYC0Y=;
        fh=NdqoxNzIdsRr7rV9caahvTzRE/lwFibhzb/1fMsEBMA=;
        b=i4YGtv8AE5kho4ce1A97sPP1qXfRtHcrWH0KBiI9T6jEJKn3pNW2ar85gYlpnpBpDi
         kvZv92AeHF5qWwGxP5+n/mql1s16uBM11GHZgKf8ujo6L81NpDp6+wjsyY8cVn598HDN
         ZVrxiJbWXz6WuTj8T+vANlf1kk2/qfqSQxGqn2w587QhCfbOFBGHCgHnlYqzHdgl/lKd
         MbbwBfJm8+gKer7BU0mNXZ1eIscH29pr/Cou7/ACM6/pwRqL9gVXe+CZrCCoi/oCuVq4
         tTcMSHxyUXuX1eHUH7zCiPjQxCDIeZw8w+x1R8BCJfGdSrHOMLoGmXGOK8wgmlboBeoK
         zIdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778855124; x=1779459924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7Embi/4WSTFlWQtHoiZCAOUQi9JugMiQF8nvMXYC0Y=;
        b=kmAqZPm7P2kazLN8aFT1PqnhpeWMx3ydoEe/A61h+v5zME7GK8LZkuTQYW2OlPyBJ6
         Mf7KA5/24cfQliXQIOLmy/M0+kABsZO0U5Gb2dpoitHO8AM/PYTjn/C7f7OXtJoZ32QY
         3d3QIyZzdr8X2UZHBg38/kM3UYTDA0cDQRE2qiHmUt/QPgDDNV2V0LyHfZiXHgeTRPhO
         UfpEBDprETLXCjthon3nRz7grBk0xK8fxreWjorzjsaltUbEYbIu/dQ7ejZXuyQ9EAZd
         azjkukyNfApgW2ko/Kig2i8hwPfgkhM5zAn2wWrQ2MPxJ2xrCjJ/pfsHfKIYoTOsaaC/
         O5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778855124; x=1779459924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x7Embi/4WSTFlWQtHoiZCAOUQi9JugMiQF8nvMXYC0Y=;
        b=XhqI1u9ss0SnOUcd8wMNlpo49dUewzm8Qy2qBI8L012LHF3Reof8k0TWdwR2KlGJ70
         dg5c9vJsIx3Pt/VkwonLd06AoqWWw8HW0vgl+hYYr+yUhDLSvhrpp7wCfWXqU/e7wULS
         EGe3tVpBGjtKNNfGjJvO/a1N7NUH2k0Z4F4ugEZK7p8Ltv/S6oKeLq6s+7vKG4P9Mt4c
         /Xs80jIF86QlILf0UQehIV+pe7xjPRSJeAsf5JmgS4tVj3qVMTQaLax9FnQrHeVfYUP6
         yJtX4wq/XZzPf9P2tUX+iIWDifjx0Q30Zzd9emW4Svhyzsv3Ak80lq8/2Na9meimpupe
         ex/w==
X-Forwarded-Encrypted: i=1; AFNElJ+fOYmw6L5+bbGEBQTFWFlJWJ/gFSd1jQ9KET9x1l+0E6SJwGBsbMg95R6Xpugb4SN7zb0YaQ1g1QY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUpkcYklrfL9tOJ2/xvpWQJyw6KzO93zeGYjCUnPWRqTxCM6v1
	OASOfea5gg/MSHMyZhvPDVtrfyZY/C9NG3iWB+MrhapOuf2Mp734+fic6IzrUMcfSAF/AZZlo9N
	0mygF09LibsK6VpVPFDN7xw1zXhsuLmmF1XL+bnvoCaqRlq/ciWYfC5v5SWGajQqbvlTLnFhlMw
	9Ybg8qsHqz8UAP549+vkOW4++ymNgE1GWnhgPn
X-Gm-Gg: Acq92OHzH8SoFRiRHVtYg7Pqa7akjK6Nf8vBj/wpWPzO3OUYLs0sX+U/SEW3cC+evuE
	wElEV54dixR+f7Hm6Wc6gk0iJ3Y4HmFhSVJ3Oxuuh91ZmsCOGlSCQfNybjnq9G4OI+jPWeO6aeA
	4objteT4fgEjCHbRiJtae/LgiHCst4YVy7Qq06qKzeWV9paGxMtM+P8eC7OZKS5WgpyjlsHpmqq
	QeJBg==
X-Received: by 2002:a05:690c:921a:b0:7b2:136d:240a with SMTP id 00721157ae682-7c95a56fc91mr34927997b3.9.1778855123621;
        Fri, 15 May 2026 07:25:23 -0700 (PDT)
X-Received: by 2002:a05:690c:921a:b0:7b2:136d:240a with SMTP id
 00721157ae682-7c95a56fc91mr34927427b3.9.1778855122973; Fri, 15 May 2026
 07:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com> <7bcead90-7d96-4101-bd13-dde2c5ded1aa@roeck-us.net>
In-Reply-To: <7bcead90-7d96-4101-bd13-dde2c5ded1aa@roeck-us.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 15 May 2026 16:25:11 +0200
X-Gm-Features: AVHnY4II_A6w9jZTl5s671EZUUpKeCpv5nVKmn-MiUqfHzgEw_QM_N-JJo0K588
Message-ID: <CADSE00JVgP50vud_3uvvjg6HDeEwc1TsK0E=gSKV07jKtT+vMQ@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] kunit: Add support for suppressing warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	peterz@infradead.org, Alessandro Carminati <acarmina@redhat.com>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <error27@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 3:51=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> Hi Albert,
>
> On 5/15/26 05:29, Albert Esteve wrote:
> ...
>
> > Guenter Roeck (3):
> >        kunit: Add backtrace suppression self-tests
> >        drm: Suppress intentional warning backtraces in scaling unit tes=
ts
> >        kunit: Add documentation for warning backtrace suppression API
> >
>
>
> How much of that is from me at this point ? Wouldn't it make sense to dro=
p me
> as "author" of those patches ?

Hi Guenter,

I do not mind authorship either. Signed-off-by lines already attest to
everyone's contribution.

In principle I am done with Sashiko's reviews. I addressed all
comments in their respective patches. Some lead to the rabbit holes I
put myself into for previous versions.

I do not plan to send a new version unless a human review requires a change=
.

If that happens, I may update the authorship. Otherwise, I'd keep it
as is, since you said you do not mind :)

Thanks!

BR,
Albert.

>
> I would not mind. I had the idea, but others like you are doing the hard =
work
> of pushing it through.
>
> Thanks,
> Guenter
>

