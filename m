Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4E937B018
	for <workflows@vger.kernel.org>; Tue,  3 Mar 2026 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772551420; cv=pass; b=hG9dHTqGzoZWB5UizNQSF9hfq20GsKsSiBZcnROOU2miczkupR2QHR+i/p/U2jsHb3A9DcPAV/WuNhwH6ee8J8aZWQZZiaVg6O3MN068e1OhiCbFOjUtyDcks+huasaF7wjiAND+RWH5kTd16Go+5MMu+b55tbKwarLp/DPCF0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772551420; c=relaxed/simple;
	bh=+hOYBjv2tr/ICJLAtXLjMEmSe6vKJHH7uOfwrf8crZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=trVgzME3k2plmYwVNu1o6GbOIcgAiPcdNftQTJSqZ1qC1HehicUiJELBoJZxfMqyCKQoY+rmLyQwYuSfDSq0XX/i9V4N9oLD6yz2Q+33UxrX9JdS1BlYuXZToECozqrB87YeNBYcaQqf9T2GMoJ3ZMS2SNz2NIOuppfGE2jG85A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U88FcJaW; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U88FcJaW"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-126ea4b77adso7393974c88.1
        for <workflows@vger.kernel.org>; Tue, 03 Mar 2026 07:23:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772551418; cv=none;
        d=google.com; s=arc-20240605;
        b=XBuf+fK7KwmSFNqliVFT1VyGhVIg5CH94eRO86nrG40Nmo8/NcMwsW2LGb7BetDKwv
         UdeYoG3nP75VWjim7ru0XZg9YWgHzaf30+tRmulFMCczVUP/Sn6arqQ2FrbxD2dSE4qe
         xRsXlL53/81JztSI+C1NSMrPF+a98svne5mIiGpopC7rf1M5k5rb0LN4goVRV825Jwv3
         EdPHB+eFIyd3oZ7Hpp6e+ctlnTvLbj+RzzjVc1hjFUSlPPYvrrDfvlEyawvrUXhYBUCw
         PRcxAiHaLUQF8ztbe1DS9FATOR5bqawZSrdUUY2Ueb3uLcTR8WLEjF23y/ncyLHcXHd/
         sGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PIHHMa2z4DUfmfcEzutr+tGhOCrJS86irFkaV0WK1+Q=;
        fh=JxDPaWwEGCLRkE3gdYyOSF+YeZ3gMK+mS+4U8MId/4M=;
        b=eeFKnCQAVVbBNr4GmHAv3NLu6LCiyw9KpBStzVeoJWc+CNSMJFQ4cOmE+d3RDzbIj1
         MAFluh/JURzBTuK4Ru6VIVRirJmHsQ9rYDo6cj85ul+w36V1JaMIDU+pZVUfACVWLQDW
         h9UM2F5cbkl664vXue/vf8k5F6W14FnKGJgFKtX2ob1JPekKEsArQg8Ydf1QGXBr+HPx
         LATaRV4YCwvqS4SxEE3sKrVCroDsj+okBnIWCjLxluUoRGRQiUi8GP86Nd6ch5Cxafi/
         v3FNpkNM3V9QLjSTb+tKTV//NMW73PIufS64H3vlBZ5ghyv0HvHaxpopbmpTGFDNXu15
         lVGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772551418; x=1773156218; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PIHHMa2z4DUfmfcEzutr+tGhOCrJS86irFkaV0WK1+Q=;
        b=U88FcJaW3s9Qv0RpQpbEQ2vwhTTsJorREAmemt9SHtCKMkGIXT4fP2yyJKj0rVSOaX
         0nu/yYTgaHvOo+j9FKH944C6BGzaW8pSWRgExmlfDiwJZIVEu6bVK6mYlXieTO6fjP6o
         sH9P3duZr13zRcxwkyGT37Gg2Un/4awQBbtLSaClhw8DwUUaKZ/RTOwTq69Lu2xLMoeg
         gnml+e2/+2duMASrCzJw6ByQ8lIqH2eZN0w+INFgL9pigY9WAUMSdv/DVDoce0MWYZw8
         7BwxcvMWC4l96BHk3jYPobJ991X1Zuev4az0QIZvIbdSzOiizKACXSKsFnPPpsL6Y3uJ
         qYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772551418; x=1773156218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIHHMa2z4DUfmfcEzutr+tGhOCrJS86irFkaV0WK1+Q=;
        b=h0OSRHzLLCR9tOxhCYO+0MyyQ7Wa9MbVcNpgza5d38dD3GPX0Oa1vJpXSLlS4/pGoA
         vZ3/ar/ZWp1pDwFBfiD9Wbpf7UPKmFZMKJevZm1Q4RycrEQJOyFw5gAQ3Py7nFuVdS8V
         /jXtk74UwBtr8OBmDxJ0lgs47gJmSiEh5Ua9EU0Uy8vusNP3lgBge51FfyKr/2++9v4n
         7P53IdJyBvoVsYZIRVjL9iP1B0H+kmGSsN1R0I+RvYmGbOuHlO0wzIgphb5vTf0/HG6i
         /RQtzYSEcPyoPsvitdMeDg57okWqVV6Ud2ORBbPP8UM6Mjjv4FuldYMMk9vIyN+tg6iO
         Reag==
X-Forwarded-Encrypted: i=1; AJvYcCVsjzYQbHo/PNQFyvCT3aCi9snYtn1CiYPWTC9uWp9lZrFB2uK05Kh0A+9psYS7F+MVE6qucE+bd3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDR9rqhRP1RY0jo9vwaRU9hbj49FqvHjVrjUVdbV6wGd0FMFbV
	npfEuYlKwHQP1k79okagE9Z8cNVOljYbF5hoxre3FqmWk257PGkPbpKiBFwWybUFoL5S8gUjNm0
	W4yDp1wyCe1+Hms2TXftReSkckQudUR79cuvOwY1n
X-Gm-Gg: ATEYQzyb/L7oQEn8UzGDXTtSfdV2UzbrkDZWaL4WCxvXbsU8q5HFafOp4bo+fod8QEB
	5gPJcZloABJlPYm2gqI1WvE3HXOoVqW3y62eojKQOfdKsdZDukjQ8a9POplwcydHDtb40ejQtph
	oh7JiI2BD8sfRwy7D7iDklxgUM07ORowvLf0EaO6DXURH1UQSSm0pXftAUAKLLgnVVBlDOw38KO
	DrK9IBrgtLolYjWikSF/JtceM9Sx+a5NJ2dJgt8Zj8BYtzaRDjDP7nEGaneqiFQQQmFVbZfa7RY
	zUlgIp5gFXY1UzCDuR3+98jEzK+SJ3rYX/NWMFs=
X-Received: by 2002:a05:7022:4581:b0:127:867f:2449 with SMTP id
 a92af1059eb24-1278fb68797mr5039051c88.1.1772551417377; Tue, 03 Mar 2026
 07:23:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225203639.3159463-1-elver@google.com> <CAG_fn=WAwHUpoay2kY6rkEZQGYxoDGVJYf5B59Y80ht7++Lmqw@mail.gmail.com>
In-Reply-To: <CAG_fn=WAwHUpoay2kY6rkEZQGYxoDGVJYf5B59Y80ht7++Lmqw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 3 Mar 2026 16:22:59 +0100
X-Gm-Features: AaiRm52TnSdEwOc95PvpVa-fbDTzQ1yxTDERFj9HFe2UexnD_a7PDTE86NyKr14
Message-ID: <CANpmjNNfz9TQcnZWkTXEAzVNdUAAYfBv0-FB-e7oV5PCfsYR5Q@mail.gmail.com>
Subject: Re: [PATCH] kfence: add kfence.fault parameter
To: Alexander Potapenko <glider@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-mm@kvack.org, 
	Ernesto Martinez Garcia <ernesto.martinezgarcia@tugraz.at>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Mar 2026 at 12:20, Alexander Potapenko <glider@google.com> wrote:
>
> > @@ -830,7 +835,8 @@ static void kfence_check_all_canary(void)
> >  static int kfence_check_canary_callback(struct notifier_block *nb,
> >                                         unsigned long reason, void *arg)
> >  {
> > -       kfence_check_all_canary();
> > +       if (READ_ONCE(kfence_enabled))
> > +               kfence_check_all_canary();
>
> By the way, should we also check for kfence_enabled when reporting errors?

Not sure, I think it might be redundant - I don't see a way we should
get to the reporting path if KFENCE is disabled. And if there
currently is a way to get there, we should check kfence_enabled before
(such as in this panic notifier now).

> > @@ -1307,12 +1314,14 @@ bool kfence_handle_page_fault(unsigned long addr, bool is_write, struct pt_regs
> >         if (to_report) {
> >                 raw_spin_lock_irqsave(&to_report->lock, flags);
> >                 to_report->unprotected_page = unprotected_page;
> > -               kfence_report_error(addr, is_write, regs, to_report, error_type);
> > +               fault = kfence_report_error(addr, is_write, regs, to_report, error_type);
> >                 raw_spin_unlock_irqrestore(&to_report->lock, flags);
> >         } else {
> >                 /* This may be a UAF or OOB access, but we can't be sure. */
> > -               kfence_report_error(addr, is_write, regs, NULL, KFENCE_ERROR_INVALID);
> > +               fault = kfence_report_error(addr, is_write, regs, NULL, KFENCE_ERROR_INVALID);
> >         }
> >
> > +       kfence_handle_fault(fault);
> > +
> >         return kfence_unprotect(addr); /* Unprotect and let access proceed. */
>
> If kfence_handle_fault() oopses, kfence_unprotect() will never be
> called, is that the desired behavior?

It is - consider multiple kernel threads running into the same OOB or
UAF. We should oops them all, otherwise this change is almost no
benefit.

> >         /* Require non-NULL meta, except if KFENCE_ERROR_INVALID. */
> >         if (WARN_ON(type != KFENCE_ERROR_INVALID && !meta))
> > -               return;
> > +               return KFENCE_FAULT_NONE;
>
> We explicitly don't panic here; guess it should be fine...

Yes - it's a KFENCE bug if we get here, the WARN is fine.
