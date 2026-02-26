Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31A62820A4
	for <workflows@vger.kernel.org>; Thu, 26 Feb 2026 01:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772068607; cv=pass; b=TJ97CKjWKjKLcaHBZjwvGRdED49jqg9ac7KSeEryzaoF+27Op/qv028XJrMgpGAf/4nBVNzb6kdo+CSt827tLEHM4Cip0ZvzSxy4vH5G208fm6f947BRJ/ycqXQ03FN3oyxY8uzGXdiVoIJqq7Cvd3Ou77jqBg6zDwb8P8C7BiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772068607; c=relaxed/simple;
	bh=yNkI4YWmaAljUXNb/JaJlb6xE3bkHC16f5NuG+JMwV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MoXYoJqbUvT1I+HN3FgmVz5Mhto21uSPcX5A6gqhVoPegg0BNZl83JJ7iZj+qzrkKRgVsqzD8GqLYQhHt/kD34gfn0WpGQGOVQlstzI5lAWTMnMbHsaLugzhzbq/C+KssOIBNkDhXw/cqZkXeXMQPHmdSMuIH9iGblset7rs9BQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KdpumB+C; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KdpumB+C"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1275750cf9cso257821c88.0
        for <workflows@vger.kernel.org>; Wed, 25 Feb 2026 17:16:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772068605; cv=none;
        d=google.com; s=arc-20240605;
        b=ZKGxG6qQev9EkRgMUtoLkqXEzUUzXeeqiHO3ZE79pDFsMk03xULS1c/9bmADtxik14
         qR42/xJxRy1fnlphh2CdMrF6Ddf6281HQ9vDuiPk3WuLDQ5+/gj+viicooXWAVg1TEPz
         d7RRRakhwqkm/St0U8Yp1ZYqCR7e0bYaG9V9is+hctn7i0mDXrE7cazr7dMjSsPafIRb
         ky+tRzQ/JnOvDain/DFyFKTQ9EmXAEqg70lK7NDeU1Ek4auBT06hlllNSHbvnrHSnWRx
         gDj6WBDTciOfdIgiJFczoPz1Ol9dG09y6qZOCumPMWZlnT/qxRVBSNBU3FV6kamBbBEI
         KPYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vRCpYCv9LhOitz1IfzI25VOPlvd9PoDqej+x+FrWu+Q=;
        fh=hvVSwC17WJ/6SPbeT4Ek29vIFEjHyI5kTEPAqu9vGv0=;
        b=b5kMAtlE3pj1BS+9Y6bbIDppQwkzVziKF1PM4Hi0EAZl9FHxjscD1Vf/2zWLKzUicL
         zGm3Yl0IpWPZOOpXAgjk2j+yh0kmDzVZR5TNEXKUhzEtP86WSSnXJuoszT4bg8J0nPT9
         2+c5HU32zfQAcsUDJKhH59UycuxRCmPadzE2OTh/PdxiKoEDzdmsSEfFfEPEMxF3aDy7
         AVm72c30oGYl8L59kUQ+QskEdxXSNMc3BjxaECu2lcZtHRZSB6jH4GjQeKE6YZU8tEiH
         ThokYyQIqi9kCqBQRpgSDcXHaHWfSK2yz8SLHBoVuKcwwZ9QsIkDiPp/rV9CSNkj9mdz
         w2HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772068605; x=1772673405; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vRCpYCv9LhOitz1IfzI25VOPlvd9PoDqej+x+FrWu+Q=;
        b=KdpumB+C/BgZn8/iBWqtDE6WQga9ze3cQ00eb/x5wkKRiOlQtDA665nqae13H8Wopa
         wv/FzIwB4sGLRa0Vi1LzgXVQOlSN3cVOLGZQVpKQWdtU2Tzgg1q2Fn9nLQSGAFVLCueN
         LVBNPPfwq4+zuUGAA54h6xa2WnNZzgIaond0DwIntoiBeNZyQrsqH8yUKDaP0TBEhlIG
         sCel2lbnDs/ieP4ybYfiOCFcxYsshTHB2JlBrjppOu6lFKMNucPw/FNmZttLBgFl4PPs
         Kq9vQg8MbrNEB/rwpy9IJ+Y/FFute6qqs5uSkByDbb7BNus1QPzOqvJlojt60m1+salp
         B8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772068605; x=1772673405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRCpYCv9LhOitz1IfzI25VOPlvd9PoDqej+x+FrWu+Q=;
        b=sCrwtQ7SVNUYlw76TE3DuW13dJSGyYGKfRe7270+whJHY56A1fb0jcRcyDitLtUazo
         efAF7uCrW3kLQQpUtJ3LlkT+TgZZlZoZKslTtPon0isqULtg30bZQYKSlakl9QngAN8N
         +ZJxD9i7yJchmNxfal/yTbh4bIpO9Ks+ABbTcwvSu7jv+5CPE/LAffLE3rDoLCR4eCEd
         s6KxuB9Y/8tV3nLV5AfZ6HtJGWIv75YhMdAOgGleIc6RFd6ezOEF78zscVNqkyKizIXZ
         XoJ4Lzk35MtABwFOhHK0TZsXHvnx4azVc3CcrUMacZ089V+MlMSjESr8dyp7zZxkxlIt
         gtYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwygt7P/SHDJz1IVSKt2MTwclQiAKXIMhmEXoeY40catPL4rKsKyfIiCPE+25wse0Kuq8Grkk+dbY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5bwUErnEyVVjsHMQmcBOsIoU86QT0EpxVXQWTWjm+wnJEa4tP
	oiZ3DsIOphxgHsZNG2J/aSzS8yTS8sWh9bq0Ikn0HEDa4nnAhCtajxXAHIAp+e4IrH+UH30Q+si
	rmEnHY8OYN53k5lgy2lYeetGUUKmxYenxQWCCv9iQ
X-Gm-Gg: ATEYQzy0ath0MBpJJJIwuigJryaEjdu4IVn7yda/gsiPTZwJy3xNJM6E/gzwaSEMKXI
	1lHq9QxbeOfMpurYKg2fCSrWAbNYxqh3fq41zAus/icuWz4EtFGKML87v8iUAdhb973j99++KSq
	9vybuJPbMbnKEfVEtMMSNj6zZqtTbPpt9kRE+1+hpHgnV6Mqw99sJE25+dxUyUeYov6OOSpnxQK
	kluLSuWRP0XPrnKnE2pKXbItf50N8AWQ/xKWtpYEuvo+5FHWxGrARZK89498te7nfbqJlO1C0Fa
	T1PNnimZwBzS+ImUPqlcC3LZJZBhtzXC5lJkZAY=
X-Received: by 2002:a05:7022:48c:b0:124:9fd8:4b99 with SMTP id
 a92af1059eb24-1276acbdfbfmr8853747c88.14.1772068604514; Wed, 25 Feb 2026
 17:16:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225203639.3159463-1-elver@google.com> <9476ab2ff783c77ff4f1d323fad3e356bb172fcd.camel@surriel.com>
In-Reply-To: <9476ab2ff783c77ff4f1d323fad3e356bb172fcd.camel@surriel.com>
From: Marco Elver <elver@google.com>
Date: Thu, 26 Feb 2026 02:16:08 +0100
X-Gm-Features: AaiRm52Q6kRNA7CHrMLsOWSgdbnXUE5vCnkOPGyFzwQOTRVlJEfjChemViCldxw
Message-ID: <CANpmjNM4kwRGU7mxZPtPnD2-Q2u2E5K9bLuHiZYkPkB4JETeJg@mail.gmail.com>
Subject: Re: [PATCH] kfence: add kfence.fault parameter
To: Rik van Riel <riel@surriel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-mm@kvack.org, 
	Ernesto Martinez Garcia <ernesto.martinezgarcia@tugraz.at>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Feb 2026 at 23:26, Rik van Riel <riel@surriel.com> wrote:
>
> On Wed, 2026-02-25 at 21:36 +0100, Marco Elver wrote:
> >
> > +static int __init early_kfence_fault(char *arg)
> > +{
> > +     if (!arg)
> > +             return -EINVAL;
> > +
> > +     if (!strcmp(arg, "report"))
> > +             kfence_fault = KFENCE_FAULT_REPORT;
> > +     else if (!strcmp(arg, "oops"))
> > +             kfence_fault = KFENCE_FAULT_OOPS;
> > +     else if (!strcmp(arg, "panic"))
> > +             kfence_fault = KFENCE_FAULT_PANIC;
> > +     else
> > +             return -EINVAL;
> > +
> > +     return 0;
> > +}
> > +early_param("kfence.fault", early_kfence_fault);
>
> The other parameters in mm/kfence/ seem to be module_param,
> which make them tunable at run time through
> /sys/module/kfence/parameters/*
>
> Why is this one different?

That was my first thought too, but after much thought we should not
make this changeable after init, see below ...

> And, does this one show up as /sys/module/kfence/parameters/fault?
>
> Having the ability to tweak this behavior at run time, without
> requiring a system reboot, could be really useful for people
> unexpectedly triggering kernel panics across a fleet of servers,
> and deciding they would rather not.

It's intentional - having the ability to switch it after init means
we'd have to remove __ro_after_init from the kfence_fault setting. We
risk having the system administrator's choice being overridden by
accident in the exact situation where we do not want it to happen:
either through memory corruption overwriting that global flag, or it
might give an attacker the ability to circumvent the oops/panic
setting, if they manage to reset it. KFENCE is not a mitigation, but
this setting is meant to give a knob to reduce the risk that someone
takes advantage of KFENCE's heap layout - until now, KFENCE only
reports and continues - the actual buggy access happily proceeds.
