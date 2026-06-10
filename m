Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87AC213E89
	for <workflows@vger.kernel.org>; Wed, 10 Jun 2026 01:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781053462; cv=pass; b=Gn3W9/gcpkukSVp0gFL92EcUOEDdGMlVxzlaSlyYNxZUeC5AwYTyJJdfChTHaWk6gyFMVPkbQUK+5g08N9mHvF/+W9tDVi5j9zGmr4/i1r0zu33huw5usvZY2vxFohCl0JSudQSo4xMwydNAb1t5MUVZSLv57eoltiTD3roaedk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781053462; c=relaxed/simple;
	bh=4xThc03OT9rMdWbMfPKFLAzGxUKH3WR437iRvfZQFfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MRC7rAsyreqSs+h/4ey5uRF2OnxJzsvqGLl0Q+2ZdpIntZ/HzYhcEqLJb4L5Tn6JwJ7vEg7QNzBXkvaHtuioQ3m6/wQ5irz6WWESod/Sp0zL4j6TiuFZqKF+5Lm0SSxgH3H26JBF1IlR6uxJu3Gyb92RneDT/FUyGDJQTPAr8xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=szrsohON; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="szrsohON"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bf84a2b2077so300023866b.2
        for <workflows@vger.kernel.org>; Tue, 09 Jun 2026 18:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781053460; cv=none;
        d=google.com; s=arc-20240605;
        b=HbbBGkW3S4UutdSuGmir0onuBht0yGfZLQ4ffhMqDazmTpH9owNxv3lyFChx/xqqon
         XQJRyHReVWOiTkEpCoCsOX4BAoysNIchRk0wa5KO1GmLYMe4OqsyStW2Jjb6RyZlSlVb
         sqGZ+YjMBfdnd1XSS6QQm9cgSu7TPwTSW1I9q0D2XwpwKMPIcGQY2tWYn8WTaIk1zIHm
         Xi/3G0z1r8zBdbMihrjawTlOUxvh17n3c5Raka6mPhZt5aunQSuBApp1VAOm+mCTmEui
         ga+1F4ukBAj50waEyGz+gUwUBc1RYwDV1AsDaomS79HmD5J8UREVEFrgmLGVYx0ZbQ5e
         QXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4xThc03OT9rMdWbMfPKFLAzGxUKH3WR437iRvfZQFfI=;
        fh=AnDwt73ABuaEofuEMs7RYY70D38m9wI6J1zrnnzsgBk=;
        b=e+qppwFPzyscStFrA8va4A2hWJ22Lc+41kKURe/hj9eKrXKNvvae5LchqgFvMAJ7QM
         psYYk1uc/qE753nuYYFshtZeO6fte5kemOnYfMdwTSxm8vkvTBqj5F4Fu20K+bgvMQ2p
         RFkeSc5el+2RlhwQns3sweOEO1BsYI6XwDWeYHEQdQqkiC9Jxjn2QgksaWnArlZ5cwWC
         ZDfEe94ln+oH+9fkXeJV2F+xwoPkZLj5SZxMZ0ptYyLmtaO9BckXRou+8FEH22OuDRtB
         yq29jnWWZhhA3m3SKsa0uqm/tQIIjZGIydCPhXF2Da3Fu/rhB+6kQjVPmThqVE2E26uA
         2ijw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781053460; x=1781658260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xThc03OT9rMdWbMfPKFLAzGxUKH3WR437iRvfZQFfI=;
        b=szrsohONf6pdslu5N1fob5foXrbAIlXZipZMpbYPqHYYRINTIMuf8GSjjHa1hoh/iI
         cRxiuHEbD0QoWzlJDL9qzAiK4Ls3hEAMyNFwlZqFaFVk77StjRhXNXET/g/GANggXO7l
         gmogQRDnQb2PhkPWrTal77Lclev/C3GQzoybVP9B3JmTPQIedxzAbde/vpDruOvMM6rJ
         hMBzAh3O/wMUXaJOO17YUsOCHXzuucvJ5kQSH61f+1Yy31C7hvJ0Y74dqIpqsPPn7qsh
         BeaeUYTYo+jaVwLlxF+rL7dpUIYEfzulgARhnHOb518GfvzgqqZk/5CpRAkLpvT7S2YO
         9ZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781053460; x=1781658260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4xThc03OT9rMdWbMfPKFLAzGxUKH3WR437iRvfZQFfI=;
        b=ODAhQDsWwgmhEt5t3ilsvi9vCF3MFg3buPXOWDtG8NS+HyT4AaX/IxyP6FBhltZjU8
         m00vugx1d1aEbMzBYGdVVQSjzpE3lbO7t9phnyJuMLtLmaKVZWnDkdnuLPkDS87IVBO3
         uLim5Fu98+4TU1nk0OHBL1YFW0fPv2i6OQTOn23QwOK2sl6kuCYA14g8hb11szMfT1BD
         7et5trUOSgh9S8TLZIC7FKaMSMObs4uWqOKCu+UqRvLQVkNIoGLB8Gd2iD1EzREM5mpL
         edeGmb90LLY+v0uHcLre3hNua0EjMtJHDhjcnxmyiKWARZ7GP+to23g+PpB/Whyd31dt
         3RYA==
X-Forwarded-Encrypted: i=1; AFNElJ9gqca6lxpZMDL72Lo8t6+nBeV5g6kPgtbGiFZrErshcppwchuQqqHjEKu0vk841bmmsFm9y0o2U/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWenKXCMQZDnNtgbPQdNo6d8sNGpCJMw2rXXpLX0XRUUH7sXTz
	eYIXz7ivwhxSBA6SocaR/gAqA21uksc/fS+zGCAX4EgNaVccNvSgTknauT1Uq3C0Rn+N1+KSR4G
	mHjou18kinMd/frkE4QGLhcrcQpZkyzc=
X-Gm-Gg: Acq92OHaEsaJKThHK/eEWtJBQ/wPdSxrObmorCjTwELuDACDVpprsQdaYKToguo9HTY
	RNhvQ1d/2hkOl42Yzz8ADe4Q0A49fQ6Je3n+zqwPo1MZ3y4OBH/SFD6Vg1R2kSH5TOpsHKyaVLM
	mCwe4tFnRK3mEgI2OhOHDFO/82vcuv1CX8aUJXiXnsg96PJ3xXUdeiaOfpiDB2xG6xmc8KhMeET
	XTi1mTsYj18l6svNgMdgnFjd3ddtRf+vEA77Db+iS8Bjjs/tI17ufUa3qtKAM28vPAkvKMsoZ4l
	PgQZOXjOZG/LQ8pVOQ==
X-Received: by 2002:a17:907:180d:b0:bee:426:87ec with SMTP id
 a640c23a62f3a-bf373406e26mr1072354066b.23.1781053459895; Tue, 09 Jun 2026
 18:04:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509094755.2838-3-w@1wt.eu> <20260609083305.2382925-1-safinaskar@gmail.com>
 <2026060955-zesty-cucumber-1a49@gregkh>
In-Reply-To: <2026060955-zesty-cucumber-1a49@gregkh>
From: Askar Safin <safinaskar@gmail.com>
Date: Wed, 10 Jun 2026 04:03:43 +0300
X-Gm-Features: AVVi8CesfF4bLT9_Snc2YXPWKoSW60IqNZaAXq7DWSN-_1Z-KtDb-T9FSYBGXYU
Message-ID: <CAPnZJGAKHu4rR8+W67KRQYVwRqi3x2Y+iWwhG7a2bY7oEawhfg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
To: Greg KH <gregkh@linuxfoundation.org>
Cc: w@1wt.eu, corbet@lwn.net, leon@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, security@kernel.org, skhan@linuxfoundation.org, 
	workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for answer!

On Tue, Jun 9, 2026 at 11:44=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> > - If unprivileged user prevents privileged user from suspending
> > system, is this security bug?
>
> Physical access of suspending a machine feels like an odd threat model
> to be worried about :)

I think you didn't understand me here. I meant the following situation:
unprivileged user without physical access was somehow able
to prevent privileged user with physical access from suspending
or hibernating the system.

--=20
Askar Safin
