Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB49326D48
	for <workflows@vger.kernel.org>; Tue,  9 Sep 2025 18:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757440903; cv=none; b=Bz6uyF6yZYoUou+HPWSOBBf2W7U/F03G9sgAcbdu8Kf+johXwehCKvRMqp9JvFM+Zo7xukI2CAqr9iP7PF0fHuPHHn/isWp33VlskQigZ4aCrAtyuWtgENOt+dJOzVR9DUpcZgaoW6RNxodLmqoHNWn0XBDSE7jmmuoPLRoePCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757440903; c=relaxed/simple;
	bh=4jJ4vwrQYkp+N2xPfsd7uVQnm/Gczem/KStAtQyWA98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/G1Kq+kKy4S1e5zcy8NM7vucSRecR6vi7krGC8G1U+nX8vMoS2T3sS7A1p1DneBNhw+TDbjM/eAVNcuVz2H+Eg0SVuFskYZnqvkUWTzcndrfPGYGmY5mMYC6CVs+Koa1d7ru30p/HtFeinMImt2hZMGTuHl6qqRaqReTRysmdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=B0M99YJC; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="B0M99YJC"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6188b72b7caso6576301a12.2
        for <workflows@vger.kernel.org>; Tue, 09 Sep 2025 11:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1757440899; x=1758045699; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WGm5La2YGqWzfG7qHzDYQ/vd43mSA6C56DkDIwtwe8w=;
        b=B0M99YJC+7jZeTCnvQSpm3NSsdzpXOBcrqgruxl1CgrzMElTro6zFJZtyfjGmMmYcH
         OoeW3yczATgHJnIoZdscEOj/UbG+w6rC5Y4iHq8YswhQo+uLOg/j3PXjxO1R/+VH1SeC
         7L21n0c5oGT323YLihSDJVtisXC6tK07ekKwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757440899; x=1758045699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGm5La2YGqWzfG7qHzDYQ/vd43mSA6C56DkDIwtwe8w=;
        b=ixi8+JCO2DXfj6gNcEFuaOigNH7MQn8pv81YhOix4y+wG71cqwdHqdqxJNr6Id4GRA
         EYN05WFpHw/hbIHUHspaDRFsB4mOTiDfjaQ5/JMrRrdAwY3FbX/4O3Ws+sVJ7UfgfCiC
         PEwqsJNS3XqZm8Hp09KtKWdAqdQp36yWIVPTdZdxujb/UtveCaIyXa2AE/Ki8f3cgtqv
         HpVBopJ16tRCt8C1D6QA/m9ecHhE4I3YcZsS845L/BuSKCC9dEtIX1ThVv323BtmaUIg
         6aWg9GXzskQ3VMOjD7S94R3wsQGlhWyDO6gF1yiinIk4cPETs/tKF/PTuBJxD+d2kdDg
         TCrg==
X-Forwarded-Encrypted: i=1; AJvYcCUyLiRzvmljLNClMDxm+FLbY56+tf5wwKKk2rmJq2fEkYuXDtI8rc9raaSCCwq0RLHr2BcR3ru8WeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1r/vwVRv+dGSzRrEdpH8ey7R2Yt2NBv1P811XZNQxIu2qqmSk
	OrSlymUaVFrhdg0Y6OJsUK3WMND70/PagSj4L0kM7iP8qqnJpHFkb/gVxWbA0x3nEnofHkqi/3b
	QUwNqqb0=
X-Gm-Gg: ASbGncsUyjmaQ87Tih/jtPAxIU/X7lmCL9XaE1JAE0yVs9PSWOAQ0dBE24eq8W8wjxF
	7VLy/nkC5JgQG4q4esvWltjRKdSyCsvnmd6Bb9lQhefqha7EZQ30z/w77TBdqPa9M97/ISq0IEE
	FotVZtWa4qShqGE3HP8U370Saa3bQ+bt3RRto4u9R3s+Q3OphsCXsHgDE0lzWu5icxRSPQYhwKV
	cZW+9oaRRnWUgTR/MufICI4I3GFdHwV0b5TXJWu/2dVnxLDsNZ5PoWrrA+U6eYMdeJRUajMVGdI
	vq6M6gGqsc5xET5Pe7hbAlu5R03CHPzJKB5Ask9Yz7dEQBXTnrw12LdcoVxyjB+nlltQYVuojwa
	TSn7mLw8eLHKJtnQUOHMUHCyvYfkByI++KrExhXQtV/T0/cNREqwmEXhDncoR+CXKMNdPvkJQ
X-Google-Smtp-Source: AGHT+IFoGJLm2b1xeSsC6LAZxSyiSL29uF1r7I7odw0voYi1jIAuM8gBui2h8eLNdQsCJvnw9ytPjw==
X-Received: by 2002:a05:6402:3596:b0:629:949c:a677 with SMTP id 4fb4d7f45d1cf-629949cb13fmr6669089a12.16.1757440898691;
        Tue, 09 Sep 2025 11:01:38 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c018007casm1644395a12.35.2025.09.09.11.01.37
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 11:01:37 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb78ead12so832769666b.1
        for <workflows@vger.kernel.org>; Tue, 09 Sep 2025 11:01:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXnwkWW/BWQqGAuMMI4ov/ClBpeF2//GKF+lMFYi2s5LsSwBUcUvrak7Krci8AX+we6aZKMlFCIKI=@vger.kernel.org
X-Received: by 2002:a17:907:3e8c:b0:b04:522c:e0f7 with SMTP id
 a640c23a62f3a-b04b16bf0fcmr1058187066b.47.1757440897220; Tue, 09 Sep 2025
 11:01:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905-sparkling-stalwart-galago-8a87e0@lemur>
 <68bf3854f101b_4224d100d7@dwillia2-mobl4.notmuch> <5922560.DvuYhMxLoT@rafael.j.wysocki>
 <20250909071818.15507ee6@kernel.org> <92dc8570-84a2-4015-9c7a-6e7da784869a@kernel.dk>
 <20250909-green-oriole-of-speed-85cd6d@lemur> <497c9c10-3309-49b9-8d4f-ff0bc34df4e5@suse.cz>
 <be98399d-3886-496e-9cf4-5ec909124418@kernel.dk> <CAHk-=whP2zoFm+-EmgQ69-00cxM5jgoEGWyAYVQ8bQYFbb2j=Q@mail.gmail.com>
 <68c062f7725c7_75db100eb@dwillia2-mobl4.notmuch> <u7jigxix5g3l274ciqkrcvg64fnrqute4vaiwn4tftfzs3cwzv@o4fyr7guogzj>
In-Reply-To: <u7jigxix5g3l274ciqkrcvg64fnrqute4vaiwn4tftfzs3cwzv@o4fyr7guogzj>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 9 Sep 2025 11:01:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=winCxfCXfTgjfhdqkp2EXrx7fbrGookkHuAtT3Lp5xT1w@mail.gmail.com>
X-Gm-Features: Ac12FXx5QpA-3kwbUKV6WpHs60phw1MkKolvZNXPDmgvvKpYtrNovzWPkJMVvUI
Message-ID: <CAHk-=winCxfCXfTgjfhdqkp2EXrx7fbrGookkHuAtT3Lp5xT1w@mail.gmail.com>
Subject: Re: Link trailers revisited (was Re: [GIT PULL] io_uring fix for 6.17-rc5)
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: dan.j.williams@intel.com, Jens Axboe <axboe@kernel.dk>, 
	Vlastimil Babka <vbabka@suse.cz>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Jakub Kicinski <kuba@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Caleb Sander Mateos <csander@purestorage.com>, io-uring <io-uring@vger.kernel.org>, 
	workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Sept 2025 at 10:56, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> It doesn't work reliably. Often enough maintainers massage the patch
> a bit while applying to fix minor nits and patch-id will be different.

Honestly, if you massage a patch you should probably mention it.

THAT is the kind of thing where it actually makes sense to say
"modified version of XYZ" and pointing to the original.

Look, at that point it's actually *IMPORTANT* to explicitly state that
you didn't actually apply the original patch.

This falls clearly under the "don't add links mindlessly, do it
mindfully" heading.

          Linus
