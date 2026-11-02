Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643916;
	b=VC1YAnpFPTqPpl8qXyjWiRZ6LHNVNdqvpo24RCGGq2qk3Eqp7ygy9c8CA3NGugk802b0
	 3+icmuPwpq+vrAyKL8Ku0inJovfv+4GOfDvNj6aGff04Kei4mCx51cYnpxwbzjw4I54ux
	 BbwHNiVra5lluQ7OGFF2t6TZMN0VnuFX/to23pMTP8VY0g1M2FzVRM7+tr0wMLFgLNUCB
	 jdvfdQlByXfHmF+3iQ2Ygnqp22k/DZ6f1VRe+2HLBdoMI9t2Wp/OhJ/vupCjLcKRgGwyN
	 FjeyU13U8uM+BTgGoZkgB/G5k8AXjIkFj5EUc8eqgk8yoz6/UGNkDAdKSL451SYEQww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643916;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wAnfPRO2XB0Vl2lUb95pnPuAoh4Mk39LC2HpU1pttzM=;
	b=Km+/JfHwyH4Sx2KCM++6j3VLx7qfoP8v/hsPxe4xXBcRtZE7ESHEsvb2XTeW15cGkO+t
	 BTu8B75L19Yta0nKQUJlFh2LWqQl3dTS7G4e5KTHlNX/wWgZD03AlzCEy02SQxf7/sxy9
	 VzC+IZzC/DCDex560Ud8hcGEQQ++vsxOWf8Pb61q0ThTOrbHryICY//sr+3xTI/ZAjJKJ
	 I8I2EA2z+rJGdNxn1YCEWHhXIvaVmNjOaToeghoQEE3D/2r0tug373pOYyc57JFYxbigd
	 dLM+g73S0IW5Z3L6rRu7KQfjsUz5wlaswGylHK3h7UvE2eq+We52DO08BubZXPKruSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b7dvbN0Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15C8606D822
	for <workflows@vger.kernel.org>; Mon,  2 Nov 2026 18:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b7dvbN0Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCF61F00A22
	for <workflows@vger.kernel.org>; Mon,  2 Nov 2026 18:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793643915;
	bh=wAnfPRO2XB0Vl2lUb95pnPuAoh4Mk39LC2HpU1pttzM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=b7dvbN0YT7r7/9F4UDjBrbAeME2NWwcHy72kF3wF6lIJu0hBlK3GztXPGVXVsP7tB
	 5AaA/oIfT21Wlu7Lrn3x4sXQwdHD3oHBrBBmoSxnocRSgfuy6M2aBFhC2ootC0y9RT
	 3k8xLhFclJMUHXli8TJxrGvkZAXlffeSPWw1DbfckhvzjFt04FXZsVq91UsjwcEYum
	 BaKbKbOq6N9zJEb54kh6qTKqZBSIFdtUylfsoVbpo9+tNuwroSFpWaP5eTv27gwdJF
	 Q20PWFL/0gZaV1F1cbk/wQSE2dsZS39xkvLG8GZIlW/jN7si6d943l/Q7vXJSB6YrH
	 zepiilfbcgJvQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bfc2ae6e9dso2668553e87.0
        for <workflows@vger.kernel.org>; Mon, 02 Nov 2026 10:25:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwTBwI1kDy3zXkDo73O72LNpoVgowS2fMouJs8TOb5B2D0poeCm9ALZVLAI25ZKDgMUXZUBaocZ0ko=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pda/7duUgEhF4gp/g71AXN48NiAcBA3p0MYhx/ALTgPXpEGA3
	2Hq0HA2fmd5qMG5yQuKzsOITjWlIy7CWOb503d441IbXcuSRTz7rk0E5CTIU55WFMuMf9i5E8z6
	4gBS0t2PzNlx0xi9fRKZZoTMjkRen5f4=
X-Received: by 2002:a05:6512:3f01:b0:5bf:9f5e:fe0d with SMTP id
 2adb3069b0e04-5bfd95605d9mr3713221e87.23.1793643913371; Mon, 02 Nov 2026
 10:25:13 -0800 (PST)
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
 <CAMuHMdXe1xxk2ZFJ=yr=7z1DUs3oRNfzHw1Ls1hftcGnmoNwrA@mail.gmail.com> <20261102-affable-undetectable-beluga-eded3e@meerkat>
In-Reply-To: <20261102-affable-undetectable-beluga-eded3e@meerkat>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 2 Nov 2026 19:25:00 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0i5NLJATbfH_Djtd1OXPdn1=xmLKGOijZWcDR-DrWrLig@mail.gmail.com>
X-Gm-Features: AclHuK_xQeaEPyOLHKDm5st6DAiRGDAocoGXGZ-HfdjK_YDhrSOTeeQb9NOxXjc
Message-ID: <CAJZ5v0i5NLJATbfH_Djtd1OXPdn1=xmLKGOijZWcDR-DrWrLig@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, David Laight <david.laight.linux@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Joe Perches <joe@perches.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, users@kernel.org, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 6:56=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Mon, Nov 02, 2026 at 05:24:51PM +0100, Geert Uytterhoeven wrote:
> > > I certainly scan it.
> > > It is also useful to have an archived local copy that can be searched=
.
> >
> > Indeed. Sorry to say that, but Gmail web interface search is still
> > much more effective than lore web interface search.
>
> Folks, I don't want this to turn into another thread of "me too" response=
s.
>
> Yes, I know that some people still use it for a number of legitimate reas=
ons
> -- but these are few-and-far-between exceptions. I need this change becau=
se
> the current status quo is NOT TENABLE. *Everyone's* quality of life is
> affected because Gmail's throttling results in (looks) ~350,000 mails in =
the
> queue, most of them waiting for Google to graciously allow us to talk to =
them.

So honestly, I'd do the drastic thing described below if I were you.

> So, we either unsubscribe all gmail addresses from LKML and prevent them =
from
> resubscribing, or we do something less drastic and revert it to how it wa=
s
> supposed to work in the first place -- only patches without a dedicated l=
ist
> end up on LKML.

Because this one depends on people stopping to send stuff to the LMKL
and that's about changing everyone's habits.  I'm not sure how
realistic it is TBH.

Rafael
