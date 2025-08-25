Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BA026E175;
	Mon, 25 Aug 2025 17:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142247; cv=none; b=nIFWi8kebPC6Ffxh4OQwKTVByEGoUQsUFhxfrjEFy31MWuAkE++lQvnFELaIlsZev0eftsmHwkbg7V1LayzfeDFkTTsA1pOYu3Zn7TS7wmZNfnuabOZtWRHUyRVivmOKg4JXAKrFYfLGvE/iJG+6itTtkqs1Zc9aoR4yABTL00c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142247; c=relaxed/simple;
	bh=lz/vtaNLA1irUmT+ADzkgy3QqEusslG0LLplIKRTOZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKbP3aOxizsYsv6Q+nYx9fByRKZOVzAYOy2NTpmibeE1TYym7UGmWTJnYazqJy9MJhAuVWYmjX32PFAZ+4I73xx3zcjmzHRiik82vpblOlUonKZymnvGSKuF7BWqFjRtmJKo5/XTOpIvPTKOWZFX1qalvNO9qvMExJWmB0PmH+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dmha486e; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dmha486e"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61c3360bbaeso2686119a12.1;
        Mon, 25 Aug 2025 10:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756142244; x=1756747044; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HOt2WdWgfmIt264RtiHKtTdiUuhGCVPrX6tVa175yUA=;
        b=Dmha486eJ4LIKB5eyDAnjZfi23UzZdRZWnrSDq+P/i3mcSPGiQ4Ior/QvDwpyyY8K9
         /0W5tLThRSVmAJUcQaGAl9lFz8R4C096+4sYXiqa0X/l5WfhpB7/hhuUVbNNWkXiB3z+
         8WFGZhT0iKh57/k+8pUUe+35J/Xt5meRpsh5Ls9xWSzQ1TM++yPTnZGZMh+Hs0SUYVdG
         T9TeYlZIQHp+fXi22x51a+T9X9KwGPpgx7jfskmI26huloCeserapv11HrA9zb4vPyxH
         w0fsZs+jp2eSEYyGyUIHNXjLlqp9TSDQZqRD5GkD/IVVt63ChxNyLmf0WUhz37LvdCA8
         n2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142244; x=1756747044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOt2WdWgfmIt264RtiHKtTdiUuhGCVPrX6tVa175yUA=;
        b=mciYrIzC1N+VNuiNDlQ7OWF5IsLA4juqmijIqCH3a0AYNv/mqxY+DNVPCHlpDnPqrR
         KNx+v3JbM/ig8XZs3pAgj5q953fI770X0oCu+qbCU8qCITe9HdJhzZpV+XXWMHF6cQ13
         E5qnKpEiBI6tJ5ytZJI9ttSy/UEkM9sTG/fdudLK5GRN4sY03FKspEzxDQQ9zLYBrAWN
         J7anvGJPGCT4kMkJOKnISYB2Fvd+yHIkRhZxs86SYX8td8GCxpx6z6lfGOkTjS5UouhF
         uVna6kCD6g4Co6B2Jybn2Aa/xruBkJDwAoBLUD1y7jgjuHWYN8DmWRgtJVdLldQPZBgO
         +O0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtcs00vCodQIQLK7C04B7isSfzz7d4tufX2l6wjf/4wLwrFqnZaLFzssbFmC6NOJUOd59P1ouNe84=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEvDUJC+Wyeg2dd9td3aNlXjHIu18Gkctj2X6g4mpqrVdXu3bR
	pfoWVbDQXTy6BSGxeRcxQ2aPNl3O3vGV7qmIYuUevGoa3haY22TvduNVHwwkWArYgE6w/8GmIeJ
	E8iQ2gsBdmEqL0QrlBx6LmtMjFit4cq0=
X-Gm-Gg: ASbGncsMAW+7SLpjx6PC+bZZP+fEPZts1RIjfQAfIYPPhX7p8F0l8tHXjfu/V/9LYWc
	L94yjBLnv+ivIGiXD7BRGBONVLyVBAw7HY3S2iqt/Gkvfcj0/nb7bfYiTJVBdMa8ZbBUcAhZHX5
	SL71F6Tq/lKwxLnq62LoWWkDtLyPU/XLzQ0Vidvw5KNNHM1kQz5K9Bql50oOdi/gpa2EuvwPoIS
	veuSPQx4jb6iApQIjxCjPiE2FjQsMW9QlK5U//zPqgyafz28TBRBaQ=
X-Google-Smtp-Source: AGHT+IEJdPBls5tzlHdIjJxUH56ZQVIsjehvg86rgOhctTXiV+0bVZgINoCJv4h9ZMKPQoL4jzVYau0eht2j6asIalU=
X-Received: by 2002:a05:6402:274b:b0:61c:5b44:b277 with SMTP id
 4fb4d7f45d1cf-61c5b44ba38mr4666947a12.13.1756142243835; Mon, 25 Aug 2025
 10:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250824185015.6312-1-viswanathiyyappan@gmail.com> <87y0r8c7ga.fsf@trenco.lwn.net>
In-Reply-To: <87y0r8c7ga.fsf@trenco.lwn.net>
From: viswanath <viswanathiyyappan@gmail.com>
Date: Mon, 25 Aug 2025 22:47:11 +0530
X-Gm-Features: Ac12FXy4_W5223zNV2R4E_hB2Hpaw8zWvt8sB2dA_0Y6h7xR7tOjMTxHnc2vJcQ
Message-ID: <CAPrAcgP85f1unaHsLSeghPtjeNfAEtjfSXZMFrms1kyNnsMaMA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: process: Fix grammar errors in management-style.rst
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Aug 2025 at 10:40, Jonathan Corbet <corbet@lwn.net> wrote:
>
> I Viswanath <viswanathiyyappan@gmail.com> writes:
>
> > Fix various grammatical errors in management-style.rst
> >
> > Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
>
> Thank you for working to improve our documentation...I don't think I can
> apply this patch, though.
>
> Your signoff should include your full name, please.
>
Just to clarify --- "I Viswanath" is my legal name as it appears on my
official documents.

> But more importantly...
>
> > ---
> >  Documentation/process/management-style.rst | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/process/management-style.rst b/Documentation/process/management-style.rst
> > index dfbc69bf49d4..4ae05a89950a 100644
> > --- a/Documentation/process/management-style.rst
> > +++ b/Documentation/process/management-style.rst
> > @@ -15,8 +15,8 @@ to do with reality.  It started as a lark, but that doesn't mean that it
> >  might not actually be true. You'll have to decide for yourself.
> >
> >  Btw, when talking about "kernel manager", it's all about the technical
> > -lead persons, not the people who do traditional management inside
> > -companies.  If you sign purchase orders or you have any clue about the
> > +leads, not those who do traditional management inside
> > +companies.  If you sign purchase orders or have any clue about the
>
> This change is OK, but what was there was OK too
Noted

>
> >  budget of your group, you're almost certainly not a kernel manager.
> >  These suggestions may or may not apply to you.
> >
> > @@ -42,9 +42,9 @@ actually true.
> >  The name of the game is to **avoid** having to make a decision.  In
> >  particular, if somebody tells you "choose (a) or (b), we really need you
> >  to decide on this", you're in trouble as a manager.  The people you
> > -manage had better know the details better than you, so if they come to
> > +manage better know the details better than you; if they come to
>
> This one changes the meaning of the sentence
Sorry for that.

>
> >  you for a technical decision, you're screwed.  You're clearly not
> > -competent to make that decision for them.
> > +competent enough to make that decision for them.
>
> ...and this one was fine as it was.
>
Noted

> >  (Corollary:if the people you manage don't know the details better than
> >  you, you're also screwed, although for a totally different reason.
> > --
>
> In general, this kind of playing with the wording for text that is not
> actually wrong is not hugely helpful; I would encourage you to look
> elsewhere for places to contribute to the documentation.

I see. Thanks for taking your time to reply to this.
>
> Thanks,
>
> jon

Thanks,
I Viswanath
