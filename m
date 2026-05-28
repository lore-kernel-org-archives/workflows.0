Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E22535E1AD
	for <workflows@vger.kernel.org>; Thu, 28 May 2026 21:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005129; cv=pass; b=m76GJx3NVcYEbWfsKHvxVoEYTUbCp4eqAicxlWebc1hKZrHvvxnkANfNht0JCyO3sQP4h0Z62CK1M8QIxKP9NgrGY9HXX1sTXfDNDLENqyZyBe8jj1cbfYdikw6GQ1RHBvTs2h1JuDrfftRxGU3GM5w6c1wCLaPYX1RmG8cDz5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005129; c=relaxed/simple;
	bh=Inb/xKxFXd5Gq+skEkeIfv78O2SJYuecAkaftJOgBi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/Hy0fozelqf2XRikEAdjgvJlSxVIsFp/tVl4Oreb35/1rvYjr9lkruQBNEzDcPR7rrSk9BS0lfT0NkCMwDQstL6k+uAlsig5cF/IDI0/79AuFekN3pTW72uazLG72cp+Yfox7S1HquyZ7bz0DjzLNgSrAM7pBbnYu8GZsFMTk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpgXaJ46; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpgXaJ46"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1351aa6418cso576332c88.2
        for <workflows@vger.kernel.org>; Thu, 28 May 2026 14:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780005127; cv=none;
        d=google.com; s=arc-20240605;
        b=j6MGx+psnmGLKaqktK0Ls8CksaNxrx28AJ0edzX+7mgtVmLyT6DsZIOR284dxeW4cP
         oppG+hG3ty7a+1SjdtL5SLJkNaLW4MpKdBIvAezgIelIrEdNvIh9XKLkZRBng4MBoG7v
         rrwrKXL1ih6cejjokm1yL5/k2wq4q+tI4cZs6lO55LnD1Ls+UzNZkjrEbIgyqaEIzoji
         hwXOAks2BD6jPz6RlC2Ej+83dToYQjjOkAxcWXaOPW2zmlXqGEUk5K8X/W/1UN1FQbv3
         MUs7jbZAW1o45FmF3SI+6lyyH9V8q1k/tq9o70kc8pDOvbkPni73THQRsLvBGz0c7tmM
         4ngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Inb/xKxFXd5Gq+skEkeIfv78O2SJYuecAkaftJOgBi4=;
        fh=Bg2c3shLsMu5cuNEv5GbnlanZCDwd5PDrJ9P7s8YgTU=;
        b=ReGwH4WxbZGRHnvkUfpoCgXYrxHsNhV8Fl1mpsGjPzzu/cSsPQmReFYzTiPAICi39t
         DFbLo//gMm7Xsm//TG+T3SuD2r4u8cwZsCA4ck9v+IaN5/vkUlVJpB3i4F0hL9n73paD
         wJE4LgPjgpQ/Uc+7mq8LvvyXKuGwFcw+/mKJu2wzVqumoxJrJAAneCdD8xBP2PB0kQIk
         Ow3JUt5pW//AEWVKdWoP9bZkhH+KhTV0f5JcqiK18rLxwo87aaxfYbvZ2tvL7TWiD76m
         +hyk9DFAyjVQaZKNvzVKOjE3dJWsV6x9BZscCN8wp3t9UYNApZkSn7wBb3rGOAgzsl3/
         TaUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005127; x=1780609927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Inb/xKxFXd5Gq+skEkeIfv78O2SJYuecAkaftJOgBi4=;
        b=RpgXaJ46mOIYQfu1B61ow0UmPJ//3sn047uZ9Bieq2nvF50lmcQUIx7yHh7VeUEJHN
         CALAcKF7jpQ7DwhGBotMLfr9Z0AgWp4bXka3af6WasjMR7Ib+QIpXoasc/STB4LzQiDz
         ys/9a4whTK/QX2lvIhSw1Nflae1p6z3ooKArBSyc6LbkZv9EgO416zXwKJWC7lxkkuzc
         JCYYO4ydHb4VzfmEvp+iHkTISk8SlRL+9C2DTMTIn6muFQ/70ZQA5cLzA8ZlTVtjWAsT
         aITCGfsDm5xRyQV0g/H2EbjmgeLTBMcdvMYQZ/O3V3nrlwMgVoHqqLLxqS4PePQaaGuZ
         ljhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005127; x=1780609927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Inb/xKxFXd5Gq+skEkeIfv78O2SJYuecAkaftJOgBi4=;
        b=lTTuJyJe5paJxbrFyShkA7guBeBlJgcUlXtTzmwb1EY0E113Oo+iIxplaA0ukRzwHn
         n5w1J6J/yfBCWuRHLR/TQp68Cto9o0u8jS8pYt/HOaLM2ImcrhnCbK7ETuch34tc2U6i
         L1JOUZqJPLhWlvXkNa23CVhtETRRUeYCuHGtUG2O4k4XeGRL8hFZBMA90HNXK6nnRIVd
         MYKq0TxzYMi3+5u+GK4J/bxH9c8RMC09igHTMLs97RKazb4rC813Iu/2+HBe+J4fLat7
         pwSKJZsuTw8U/bP7sol1XLusdKRbpwXQD3NDdDoD5+eMIUIBnPK08980KB07f+IbjiK3
         aFMw==
X-Forwarded-Encrypted: i=1; AFNElJ/2ZrLgB1IpIeYa/N/b5FBmkuOpv8jB/WdKoXSsr1mw62lRAhV3PX9Otjd/nDBJdUlVyLXlyrcRW0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMnNSXlXVu1ZQA5q4A2cjz41yB7FqfUIH6pw1cBRaluizgRa1c
	vLJ0ghy7Fw/dAz6eB5WX0F7dOh+zuuC5o5CVpqafob3zO7Pj0magukyas+3zB/zm8hizai4rwPB
	xzi6k4sxzrCBJRZrv3epC7fnDKBxTNgM=
X-Gm-Gg: Acq92OHJAlALfCNHhtp/GLMkl4YXQnKqdaVLL+F2bF7KTrwKPUdRQmyMXvjWp7COiot
	VDozIQYxdhziHa1gTzzb8XKs2tDuduhxRfrfQgC9Be0+rdNzVmeD2M3m4iPczM2EW5/lK2aUJza
	pkBSV89eE34mf6rYLKojh/TUxWv9fmUuvFqH/z1HAsjbBnwqKPdhYGfP14RiruBiPnH8FfYme65
	a1fuqL/+iwJsyMBEcHj9N7Xx9DGL+yYQGsUAfl7DUZ0meM1zrZKbmIjqkjekcMEMMk/G6Jj+WV8
	hy00iTgL4LEu+vIHmko7bjNsbqFOxLC5uFiVudLH3u40XOM0LzeGhTGOiPDI+fM8bRMc8NNr+xW
	qVYIwyFudYyg9OG6EQRddZ/+daHj6xerHBA==
X-Received: by 2002:a05:7300:a984:b0:304:3c33:7afd with SMTP id
 5a478bee46e88-304eae25163mr79142eec.1.1780005127399; Thu, 28 May 2026
 14:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
In-Reply-To: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 23:51:54 +0200
X-Gm-Features: AVHnY4KsYVj2Jopx_r3QMdCgeZbmquWS2iLzmSMqMdc_bkNyvnbcslo9ojp-pAQ
Message-ID: <CANiq72=tdv2xVLnXaYuvOLXkAYBdFnTFPohKxb9Tc-3QC0Zs9g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update ndesaulniers
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
	gosst-kernel <gosst-kernel@google.com>, 
	android-kernel-team <android-kernel-team@google.com>, 
	kernel-dynamic-tools <kernel-dynamic-tools@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 11:41=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> change-id: 20260528-im_back_baby-1ade32dc049e

I noticed the change-id -- welcome back! :)

Cheers,
Miguel
