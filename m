Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA04D492506
	for <workflows@vger.kernel.org>; Tue,  3 Mar 2026 15:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553074; cv=pass; b=Fx2A/iNR3RCIAvreop9yoIwCJiJfoK+YVTtp8JlX82+46qRUpWLug3rjPs4RSOYqCQ/dXHVP30OBcaOK4wsQsXIKFKNDte6uBleI0uJd7tZC0iiM/RDupXKF0U28z4ImJBqUDuNqhTHWG3V8OFHUMGhsl/DYVfNkn2BH8ekwvF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553074; c=relaxed/simple;
	bh=dq+MkDWvVYX4QZZAfgYCSC5ilLlxZ4vgS4PEDXlagew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/QWArHL5NGIO06v63Nge0oh4MkMWZ40RzVMzJs6D1Hy98UF0+0SyguwGV+iQS3BBBl96glyXc6lZ53lrgXTn5Eor5Jkriz/lCEjMf8o1CxEEE91bJ18uKGc7A+wcIu3zTB4a2V0nmxsAqu4Usar1anYMpiP3louGR5RvR9xYH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CRiikqoJ; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CRiikqoJ"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-89a018cbbf8so23320076d6.0
        for <workflows@vger.kernel.org>; Tue, 03 Mar 2026 07:51:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772553071; cv=none;
        d=google.com; s=arc-20240605;
        b=Ge4S/qZDWtay7YGhnDtlEEftZKEUp5sVMvf9m0OPGb0+hkEKOEncNP6mRJ088giTzc
         goi3t5SlaIaeTxmIecWGtMs3nnPvtX/pPCkXSiLjjeR4kIYmzhN6vmwfzW3qbNfdzxrr
         Qw2UgAlTmZWBIwk6DRyTsxcoLKUPb6eGmoHyogAvfw1hCw8wkyCfnj9Tve1bnKeOg13y
         f/oUu/wQWcDmgBNYhDyQG+TXEEpP8fokkmICXun99RfAgP5bBRj68bFvd11LSYy3FFDn
         aEchQDGY7YZq61zgpyv6ouxwBR0JG5SdyhIDq5U2zohe2kCsigqsl02LSWbK8quL6c70
         kZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XX2std0eOKpVnxlasP7zVX+3pxODM6r50zuPsQkksH0=;
        fh=cRM5chWASKsRBiQeVGUemGLbK5O357SJWRVLRR1Y408=;
        b=UxeduAFD5Y+axWg9t5VYmqeZP7A4TSF4EA9mR3tBXDcOm8ObFtaHYJ2xXokbfMrYi8
         y2AOUBK0+xaaU1OqsxsN2UWB1mPQDG2IEqMotAj7GciLi8pGbFscNogRWfyq5MEgUS18
         rhnYSExTRwhY/zh3wxOdkU9N31Af67sjXzObp0T9cW1EXUafT9HdomOUSwbOEo0UQI9i
         kpk4oUp+ncruz/K2t7NXNKSZ22EHpofKBChrUO5YkCVQPfwkxXq8u2Qgai8PK+QLwqsC
         3bQscL/iu9JCEDy0CuKlEu6De7kCtVyrjCRErXwhzilvmbVpykvX/yc5rrUCFGb71PUm
         ggUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772553071; x=1773157871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XX2std0eOKpVnxlasP7zVX+3pxODM6r50zuPsQkksH0=;
        b=CRiikqoJtjZ/ZSBNbyfKQ74VE9E0aHxRb9EbyiNAj5K83T3WHTVDjA1g7SIQQ3/Qq5
         8V6lEzloxWOafapRc5u+x8ykL7HH7gAocxTcU8UHLUcA1e00kpv7pWinBMI93RHj5e7+
         Dh9M1ibK36zbofQGIdDt9l76A1GCKiNLCt2oKTX14AQWP1rBDC4kjwXDc0MQipaskApb
         EaO5gYxk36KCp8/Z6nCPg75n9fhKGqjaB1QwQeMI152PfXwW4rqdXLDnCTZI211B06rD
         JxEq458i0UGFCO8HHT9u3x27hdpUx3IQJZqHvKR4ufcBUEVQwsXmAWMzQ45fK1fdcAFx
         T7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772553071; x=1773157871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XX2std0eOKpVnxlasP7zVX+3pxODM6r50zuPsQkksH0=;
        b=huporzCOd7Ma6znH7B9PUU4vWXyODj7JHfrD7VHcxhd+G6GIGWdXuZgfN74Nvtrnp9
         wxsi8hHb2mFWkO6IH/T2iLRCPfN/BxEluUIsHnjkbxCQbErzwuyZ/ZLiXPDw04nNMh8t
         nu4K8tHW4J4hdLkyaIuuk+2lCcNBzQWlHRaPv5B0O/2z/GDgPXHs4dI8MK6hPn+XsTjF
         itv/GzoihmmG0hSnZlt25tgZxmq1smkBDznl1w9l3oaATBppE6sMXPdgJ/EbtcvhrQkp
         SdNszf0FkqIc12kY5owwOu1GCfwUkvHJ1r2Nnp0hxXP+xq2kogSY2z4n2/YZMrTNC4Ys
         CDNg==
X-Forwarded-Encrypted: i=1; AJvYcCVXYs4jrCy55xz0vZ290+Z2/xAB/56JAV82il1OVC5lk2MPyTqOXJNS1aJJbiJbqAsVTAHeLCjkl5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpYaWUiQ8oGZr6RqKMQs7phBk7kNw5cR7xP4gyipuPHWxBSGkS
	A8YgD1ApVd3P6F25+grp+MSMC2aUuNFnjzdW+Np9iN4eHCeiU17PpC82BNrytOABBcqGElcE29i
	Eg1NhNamenhHHO6fECDxUpKwKkxU80XTaJ3EgS2bZ
X-Gm-Gg: ATEYQzxKgAnSARE6GDCGf812KJT3H3t64l5jB9PT5G8wMJWT3G9HagBgQZnDenqAJMf
	+fbT6CzKgFilyEfQ3cvttuB6CFLCJIMA4AkBHDvCaA67XG8sPpYXRX6tA1pYQ2u+Z6ODRI2f05L
	VO9/x/LSjFc/yz7+UiOfsFKn7yNJT8v+HZn1XHnO/bTUFBNYk93AmxFeDVq6kJckwgwXz5XT5K4
	kIDBycCpk3MibAfwFW9Sj8Czpg1b6/OmiNPMF4vRcxxcePDErA5J7XrSOLIrZlqhza3q7n406jQ
	mo8cH4NUbSFD0ZKr4L94tl88S6YNr75SURXx4A==
X-Received: by 2002:a0c:e083:0:20b0:899:a655:1e1c with SMTP id
 6a1803df08f44-89a0a89f981mr24703846d6.18.1772553070977; Tue, 03 Mar 2026
 07:51:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225203639.3159463-1-elver@google.com> <CAG_fn=WAwHUpoay2kY6rkEZQGYxoDGVJYf5B59Y80ht7++Lmqw@mail.gmail.com>
 <CANpmjNNfz9TQcnZWkTXEAzVNdUAAYfBv0-FB-e7oV5PCfsYR5Q@mail.gmail.com>
In-Reply-To: <CANpmjNNfz9TQcnZWkTXEAzVNdUAAYfBv0-FB-e7oV5PCfsYR5Q@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 3 Mar 2026 16:50:33 +0100
X-Gm-Features: AaiRm50oFjbSzRbajGzbxbdZNPrSH3B1_BNVoEG05ijQc5OU5p9gEg4qp---aio
Message-ID: <CAG_fn=VczquLYh0zs-Rh51=B=J0k9EUtdoqrKncKy-n5jHxFEg@mail.gmail.com>
Subject: Re: [PATCH] kfence: add kfence.fault parameter
To: Marco Elver <elver@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-mm@kvack.org, 
	Ernesto Martinez Garcia <ernesto.martinezgarcia@tugraz.at>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 4:23=E2=80=AFPM Marco Elver <elver@google.com> wrote=
:
>
> On Tue, 3 Mar 2026 at 12:20, Alexander Potapenko <glider@google.com> wrot=
e:
> >
> > > @@ -830,7 +835,8 @@ static void kfence_check_all_canary(void)
> > >  static int kfence_check_canary_callback(struct notifier_block *nb,
> > >                                         unsigned long reason, void *a=
rg)
> > >  {
> > > -       kfence_check_all_canary();
> > > +       if (READ_ONCE(kfence_enabled))
> > > +               kfence_check_all_canary();
> >
> > By the way, should we also check for kfence_enabled when reporting erro=
rs?
>
> Not sure, I think it might be redundant - I don't see a way we should
> get to the reporting path if KFENCE is disabled. And if there
> currently is a way to get there, we should check kfence_enabled before
> (such as in this panic notifier now).
>
> > > @@ -1307,12 +1314,14 @@ bool kfence_handle_page_fault(unsigned long a=
ddr, bool is_write, struct pt_regs
> > >         if (to_report) {
> > >                 raw_spin_lock_irqsave(&to_report->lock, flags);
> > >                 to_report->unprotected_page =3D unprotected_page;
> > > -               kfence_report_error(addr, is_write, regs, to_report, =
error_type);
> > > +               fault =3D kfence_report_error(addr, is_write, regs, t=
o_report, error_type);
> > >                 raw_spin_unlock_irqrestore(&to_report->lock, flags);
> > >         } else {
> > >                 /* This may be a UAF or OOB access, but we can't be s=
ure. */
> > > -               kfence_report_error(addr, is_write, regs, NULL, KFENC=
E_ERROR_INVALID);
> > > +               fault =3D kfence_report_error(addr, is_write, regs, N=
ULL, KFENCE_ERROR_INVALID);
> > >         }
> > >
> > > +       kfence_handle_fault(fault);
> > > +
> > >         return kfence_unprotect(addr); /* Unprotect and let access pr=
oceed. */
> >
> > If kfence_handle_fault() oopses, kfence_unprotect() will never be
> > called, is that the desired behavior?
>
> It is - consider multiple kernel threads running into the same OOB or
> UAF. We should oops them all, otherwise this change is almost no
> benefit.
>
> > >         /* Require non-NULL meta, except if KFENCE_ERROR_INVALID. */
> > >         if (WARN_ON(type !=3D KFENCE_ERROR_INVALID && !meta))
> > > -               return;
> > > +               return KFENCE_FAULT_NONE;
> >
> > We explicitly don't panic here; guess it should be fine...
>
> Yes - it's a KFENCE bug if we get here, the WARN is fine.

Reviewed-by: Alexander Potapenko <glider@google.com>
