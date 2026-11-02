Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636707;
	b=nUfA4NYLBLwgHQr8wNTYOa35WHConcnVrZ8Bm9EhCaiaPSAmcyQ5HK6fuOef5gf8l0ST
	 tg2gFiTTup1vNJsBhGbc7vn4Y+LhFW9RHtbov6OtLDe1vlNg4SdRZdM76LZbDfXbmfiFM
	 2p8Ncn8Da/SaJ03WBPnARB1+g2USV3hNIvucHfhZRk4xkDJDKE+Tg3kE5/l6+joS4b6jB
	 do1K6KCIC2TYngwhGWk8E5NceZ1sa/SnFFiPJZuv1K3hQGJ0aJHxtoGm/say5CFFM7+pL
	 WxjAragyTQhph7S0u7DObZm/V19TSC8X3SImjcuULRwVeS4/YXJLTfvkjPwwMMPCNOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636707;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=tQ/DNk7a1iTmjw2NtKHat2WmkFC7lCI9EiNUytx5K+U=;
	b=KCP5kdodz06garismihJ0BbK9k0XXVMSfuyo9kH7OxVBwMZjG+5flczJaMYO44BA+7Et
	 cdhkS+6jbn6D/ovoN4h6QmiwHGr0DEoIhraUyMhHqJ4mX4m0a6FDixEliy70C9ckc3Kom
	 7Wwv6YUl/4ig/ScJ3U+C0DGXIWtLuYd1p2+/KKbAUtc32SfeglP7xOewQ5HuZqRubvz34
	 AGE8iNiOfkLsgz3nflgNZuREmypxdXGWyDxvdPfaY8vnu01/WlwVtQMEt5X7kxOxRPF/+
	 I0CB+R/wxWErfPro7c65/gjP7C4olIH7+5pNXEjMb1ePOaOtsFUeANXjaEfDjIem4zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B20606A918
	for <workflows@vger.kernel.org>; Mon,  2 Nov 2026 16:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25B20606A918
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-996eeadfbeaso228463241.3
        for <workflows@vger.kernel.org>; Mon, 02 Nov 2026 08:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636706; x=1794241506;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tQ/DNk7a1iTmjw2NtKHat2WmkFC7lCI9EiNUytx5K+U=;
        b=GXz3K165mVPZihGHYEb/7/LnAphVJGdFxAj896hR7CiDiWN4dU4yhVk18rJ4SG2msb
         EADx2ehpNliVrvv4wstZEk756Kro6GeTODus1IHLU5Ejbw20nhhWb9zKuCqS94HPSQIn
         iQPnTruFnIRBLecXUjhsUaIW+52FYkPoDMv3IVUzr/tf4YrBgkDBVpR2uPgC0iTj6Z7K
         DlNDD+F8s0Xwd1l2Ml+NQJ3Pm8gqw2lHbyU0GN8Sfm1cRi1jtFKpJD8oTg2rvKB7YBJ8
         PbTJPHDv8lO2gse/Xs3P7MxgivTBOvrOPBZeuFnCnPGgwo7tkWyeyInKuLgsH0X3yAGl
         Z0yQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEMVar7DlMcApBznpJYfR+HpqS5IXLX/78FmNwarlGtebU9ZGOKjT5eXIK8BuQ/2ZEAwEcr4DPyVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AvmFXlAgO3DBzNNTOAIaPkDAes87j9v2VW9jYcux7i+Qa9fj2
	GLVkrJnRPEoNqZ+R+Ma4kiOj4aPJBZUtKpe9JZo1GAGR0XeDiQNGPnwN/auo8fKXb7w=
X-Gm-Gg: AYBFou0W/oG0m/OJMBcAGn5GJz8RjoJ88avdZQQERoxkVBz+4856Xj8RXbcsKWVJ5cg
	p09npBRG9VghagviRWLypnj7vvutegD6by4yX+OL9pvPRbIq0h1ROqU1u8bJwjrOzTgbBsuf8w3
	r9Vd5KcEgjZ77dUams2PWwxoM2S2kwSNkUMrEY2YpRTUSEX5ov27DWjKBa/WyxzRj6uhgeHugsx
	f5CvuYgkQ9ERN95O7WXuheeB9QBJSxrIcsqzVDytC/ogcP7HKmdCyvuhqOwj2sHLbB5n9bqvGem
	LZX3O+Vc//PPmu8R7ko5D6/3pQcy2cyn4PfBCMfQrJVh0YF0wj07G17N6RyJi0HhDUoM3uu3QNw
	ugucInS8zUXw+Y8c3MSf2iVAcH0aNdiTW/2VAhXU2ERk6MWXEAdXDKTcKpAFwPMHzYn/ma7gTVv
	lM0OZFkHC1y1s0l/LPWCb/gyBw1oDIFVhh+QgLiMrJF27F4mVEoTS8CBsR/nfCk/Viu7VdAbMyL
	WhnG/LbXRSFqXUU/prX3zsgBg8Zdwi/MrM0zyPX9O62xtFdulE3bjBgrqiDcF8DFNgNBjyrT05j
	VOA42zL+IkKgR8n8lW0EOWUXshDpOiO+inqVElhd9mcF91drXeoo2PHW+SO66mGtWWjts1uyUeh
	wZKkVcw1DEyo=
X-Received: by 2002:a05:6102:fa0:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7d072670942mr4627638137.16.1793636705892;
        Mon, 02 Nov 2026 08:25:05 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d0776a824csm10428642137.11.2026.11.02.08.25.02
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:25:03 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9950a7530d9so773030241.2
        for <workflows@vger.kernel.org>; Mon, 02 Nov 2026 08:25:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxg59NyhoBoew5oo5nXfsm9zh0JCi7M22VScAbQP3RDs+o4dzVUFAUOo7leS3rnyihouElZok/AEPQ=@vger.kernel.org
X-Received: by 2002:a05:6102:15a2:b0:7cc:776:6c5c with SMTP id
 ada2fe7eead31-7d07261533cmr4465421137.7.1793636702714; Mon, 02 Nov 2026
 08:25:02 -0800 (PST)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261102093206.50b6c9ad@pumpkin> <20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
 <CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
 <87a4nrfgjm.fsf@trenco.lwn.net> <20261102150535.6c5689f6@pumpkin>
In-Reply-To: <20261102150535.6c5689f6@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 17:24:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXe1xxk2ZFJ=yr=7z1DUs3oRNfzHw1Ls1hftcGnmoNwrA@mail.gmail.com>
X-Gm-Features: AclHuK-8i5UubVSnw4SQFIo1lFtZYZ1lQPWaRR8ZSWJrkN6Qpqf7rWpkXGAuxvE
Message-ID: <CAMuHMdXe1xxk2ZFJ=yr=7z1DUs3oRNfzHw1Ls1hftcGnmoNwrA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
To: David Laight <david.laight.linux@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Joe Perches <joe@perches.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, users@kernel.org, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 16:49, David Laight <david.laight.linux@gmail.com> wrote:
> On Mon, 02 Nov 2026 07:34:37 -0700
> Jonathan Corbet <corbet@lwn.net> wrote:
> > "Rafael J. Wysocki (Intel)" <rafael@kernel.org> writes:
> > > So it occurred to me that it might be actually better to stop sending
> > > messages directly to LKML subscribers and only make it available for
> > > download somewhere and as a Lore archive.
> > >
> > > Is there really anyone depending on receiving all of the LKML traffic every day?
> >
> > * raises hand
> >
> > Some of us crazy people really do depend on it, yes.
>
> I certainly scan it.
> It is also useful to have an archived local copy that can be searched.

Indeed. Sorry to say that, but Gmail web interface search is still
much more effective than lore web interface search.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
