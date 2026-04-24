Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325383161A4
	for <workflows@vger.kernel.org>; Fri, 24 Apr 2026 08:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018689; cv=pass; b=hj8VjMa0UkznIYDiBmXDqwtuSMoRoBIlTed2+oiDn0nDeBrqc6WSs4pLU5FSuy3Tt19kJyPe7J/F5D/2+HNdEHNcS0r1+eSmTlM6DY8J5VAbpzrt+jJjV/2eADEQfg2awm26U+SvgDn9dk5OjtZCQvA1c118oMtZuC0GgRZrAgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018689; c=relaxed/simple;
	bh=shpYQ9KZLbr6N3HVlTPITJ076laxtxRBnaiK8rmbhhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YSgFe9+pkbgp/rD0dnLp7/WFfakJoRk6R+mCvpolXuac0i2rj7kZIsS8NamZ3S/thM1SzlWKbNoVEQ67E8zfBugeERVquLO/vxs4/BJ/0v1oW4OnYkMONUOkASty/zTQC6u7/+VQwy1Xk2tVVBDkzrdwRvxXipUwGO0rEFfuE9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KdGQ+rOk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UFE09HNo; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KdGQ+rOk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UFE09HNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777018687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=shpYQ9KZLbr6N3HVlTPITJ076laxtxRBnaiK8rmbhhQ=;
	b=KdGQ+rOksMmtNSNpYp7CmknQkKu04JQoI2Szr5eK0qd/KR5uV3VyK9iHh8JC3BKLQll1FE
	0Zn8cyypmqzphga1c/ivjXe9nqDjDKH1VGOHQeSOrWlhGcEDfipOcJZlLkgPWiaCL3iAFf
	m06ieyw1d36sZ/X4AoO7R/a6JtHp1ME=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-wOR8jIreOWmkns2Cbb6ySQ-1; Fri, 24 Apr 2026 04:18:05 -0400
X-MC-Unique: wOR8jIreOWmkns2Cbb6ySQ-1
X-Mimecast-MFC-AGG-ID: wOR8jIreOWmkns2Cbb6ySQ_1777018685
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-794d80fea59so142486067b3.1
        for <workflows@vger.kernel.org>; Fri, 24 Apr 2026 01:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777018685; cv=none;
        d=google.com; s=arc-20240605;
        b=lFy3dxRRf3tGG3e/4W9ke99fi0BJTpc150z2k/c1inhu+bmqjBIKEyJKTxeCjHngCy
         YUWeQ9z1yGWfBtbCQFmy/U24jupgrwvd2mfjwHppAyF3nEeFFVADrwOj6OGU2Os7qrFK
         uZbKf/wuejtqnGwQZsMjTtUto+/ct1zusZQkeJXMnezpDj++eZ4D/U00Lag5Hekfm6rs
         ECxsIzPjL8wdEjG9Zx+ZNHb2Wi8Hc/e4K4jsRvz2R8Ck5sxBM5+0GMfGxdXECVG2H29y
         R4mbFSVgbz9b7OOzGimgdyXielG0NlXTXBnxxaGa3VzLucJbXQRrGNw9vP9B/ZxgGN9x
         2uoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=shpYQ9KZLbr6N3HVlTPITJ076laxtxRBnaiK8rmbhhQ=;
        fh=1/INBzvncR446dkap1NcnTJRMJ0A3vgVl+j5Prb9uus=;
        b=h/HTyAG5nNKb510kP65/IhwquKbx0mgRUvsRarwKkfVX74V80Xkixqs0kL7BOAGuHD
         fEHQpxYM+bVNPgiJrPBNpstXPMY7LPblTlGXTYfyPX736aSfI//maXEYRqNS34U2QnJJ
         XovQ8lPkRiyCFUONEue2kbyx7WzKPlgETdEiLN0Db7KLquqEuQY6dUvIvV86f+lQV5os
         ySlQEZ+iGs4Py0Q7EwRQIFSaIr+WUh/6rT34w6ooEpmFXQbc8/yKo0CvYAQidzAlZFx9
         AiWVWLK5MzYLF3HTWS1TKoynSlI4VoduunC9O6pm1bIKHtCnurS6gpSh2H4tp3XgcalO
         XLDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777018685; x=1777623485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shpYQ9KZLbr6N3HVlTPITJ076laxtxRBnaiK8rmbhhQ=;
        b=UFE09HNo4IGvA8BUZdlOUfb5zSlXe1AzSU3lpqk9eEWyX/ESq1QT64fOcmWUKlybCd
         sk5NholQlm5fwRG/RzNqL0i8tdBdEIDic3/1WfOqSGgmMTEWxaSwoUc/TjJj5Gigrl86
         fib5FKeNBDtEAEAdonFGPNDj2pxqVdFzZ0LI1RKkE0terFZzTLOHiWXVYo4y93Qmlpzn
         LPt9zxwWmz41MWYORXZmQZivzcPzn2Ti7pAmcudKpl0UzOZhuF8DLgB+CBFciUl7jeFi
         5MxiLj4PoNvKquSqbkIAxeMLTtrNAXtDvxXjLrhXdkL9B4qPdWGsemdSOD1rsyYqEdgY
         FRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777018685; x=1777623485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=shpYQ9KZLbr6N3HVlTPITJ076laxtxRBnaiK8rmbhhQ=;
        b=p7vbnJNbtv7OgvJYB5RdaUYzpJ8ttmlcjCgwrAhKsG2aIHmRKFrJ4VRLbdMcZEmbAt
         i5N278HHkpXNfr0DzYuzVYGBLprdI04wMlT9hRW2HlUd31Ocea7OqHSNV9WG/uVb6HsR
         BI6IqRbFPe8q9jWzLIe9vMQNMQO37pld/vSns/toTT/CYlcL67NsrCru1kbbcjQD2K4M
         R0fkn9Akv0V+oMfAFXo1VMiSBvjRHCBt5ajMYxBLf/VIvNhBQnnhy/RsZGty6yYmlXBR
         v1MhbyLrQwHJVLhTItVfpOeQ8CFoothp7UZesqo0QunhG+KzcAd+Ne3zEy/HuyXrn8Ja
         CQNA==
X-Forwarded-Encrypted: i=1; AFNElJ9k8bOKV9TgGhK5aW5m39SZ9nTqKixlXiLM3TChdfokvuhDOJMMoIMUPgS0C8UmRgglUE99N7dT4xs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd9Ft892H2PLw/RQs15nG/TplMeP8unIn/xr1AARfqTHSHQalC
	e1C1zaZIXqgiYRcTgKHk+drB+EN3xr4qybAZe5mhhNSj5YYvN2PrFdikoS88+eqHunfdK4eqij+
	39mekHBB1rznlnyGFzB3lEiyqi8/czbTubPdsBbVpZCr5cWdv4tcmtdD2tyTE4f+/ylGhAoCGQo
	u8PBZoDYG09ONCwIvx3Caf6sjJ21eSgfujuPox
X-Gm-Gg: AeBDieuwVV8B0L1XC5Pgv4pYoudkrqT5lXnVLiCiZv58hKvsXuWrMbwHo8tVy2W/XOm
	jey40tJM1MMuY0xLMGl0GzLotF7IjdIHkQoDUOmsdXz6nIy9gOnX/IhHzVxp0ztf5e82YkHxpK2
	poAye0n5X3SURreUPZfQIjGv0+BH3aabq5NnPWpRLSOXgb8WHUefn3l36I0BAki4j9uoNgNviMw
	g4OQFSv2dB0kvUM
X-Received: by 2002:a05:690c:d95:b0:79e:8299:751d with SMTP id 00721157ae682-7b9ecebaa2dmr304557117b3.11.1777018684940;
        Fri, 24 Apr 2026 01:18:04 -0700 (PDT)
X-Received: by 2002:a05:690c:d95:b0:79e:8299:751d with SMTP id
 00721157ae682-7b9ecebaa2dmr304556787b3.11.1777018684469; Fri, 24 Apr 2026
 01:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-2-e8bc6e0f70de@redhat.com> <a1ddabac-8e50-4730-b936-4ddef949487e@davidgow.net>
In-Reply-To: <a1ddabac-8e50-4730-b936-4ddef949487e@davidgow.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 24 Apr 2026 10:17:53 +0200
X-Gm-Features: AQROBzCPgKA61g5jTjlSE5A3sG-gDo7X0r4wi6SlVdjlUQQBr3gtOcBVPcG2A_U
Message-ID: <CADSE00La5sN18OqEmSE7NHwHnS02k5C1Gn2+o9hy4S4zLgC7dg@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] bug/kunit: Reduce runtime impact of warning
 backtrace suppression
To: David Gow <david@davidgow.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, peterz@infradead.org, 
	Alessandro Carminati <acarmina@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 2:21=E2=80=AFPM David Gow <david@davidgow.net> wrot=
e:
>
> Le 20/04/2026 =C3=A0 8:28 PM, Albert Esteve a =C3=A9crit :
> > From: Alessandro Carminati <acarmina@redhat.com>
> >
> > KUnit support is not consistently present across distributions, some
> > include it in their stock kernels, while others do not.
> > While both KUNIT and KUNIT_SUPPRESS_BACKTRACE can be considered debug
> > features, the fact that some distros ship with KUnit enabled means it's
> > important to minimize the runtime impact of this patch.
> >
> > To that end, this patch adds an atomic counter that tracks the number
> > of active suppressions. __kunit_is_suppressed_warning() checks this
> > counter first and returns immediately when no suppressions are active,
> > avoiding RCU-protected list traversal in the common case.
> >
> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
>
> I'm not sure how much of an improvement this is.
>
> It might be worth putting things behind the kunit_running static branch.
>
> You could even add a new kunit_has_suppressed_warnings static branch,
> though I doubt anyone's too worried about the runtime performance of
> WARN() during testing, but with no suppressions, so it's likely not
> worth it.
>
> Have a look at, e.g., kunit_fail_current_test() in
> include/kunit/test-bug.h, which uses the existing hooks implementation
> and static branch to reduce the overhead as much as I'd expect we need.
> That'd also potentially let you move the backtrace suppression code into
> the kunit.ko module, so you're not even paying more than ~a pointer's
> worth of memory if no tests are even loaded.

Agreed. This patch can be removed entirely once I integrate it into
the hooks infrastructure as discussed. The kunit_running static branch
is indeed a better fast-path than the counter, and leverages existing
architecture.

>
> Cheers,
> -- David
>

