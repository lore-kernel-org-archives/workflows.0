Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96C1348C61
	for <workflows@vger.kernel.org>; Fri, 29 May 2026 08:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042701; cv=none; b=eUdKzENfMBtpWug7gC5LDP9J2vM0aIu4Xn2CnuuJOh/EjZ+CTBX8/EkJAAneqbUYpyvkSSi5DLnRGDxZaq0K+xJi7E/msyxXUyjsRTyEce+HaEJHqQQCLglPleaXq1CYhFYvVsBA4NuU4SjxYHEo3XHzjkoTCMA6kZHPGuDFC4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042701; c=relaxed/simple;
	bh=U6STYFc1MSV2t8PYiQhu3Ra9FUPADWa8sNTge/8tcUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6IGvJiPX38NOR04dAMxMJezOJMiyrqbmHWFLzuxCmbNjPospTD4MaoWpArBF2mgBqv27qw7TNsYxsWr/A53kGd6CA+XfID5ykYmEyyMrg/uCDj3fn6daqyeW7BKqxPijqj7yqgUTZ1DACzeQgTqlDBuo/1uywo2U+B/kLl1N20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-575267e3398so10814468e0c.1
        for <workflows@vger.kernel.org>; Fri, 29 May 2026 01:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780042700; x=1780647500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y9alDc2PG7AUKpxvXQsiRJG2TJjrrZTsIKTRjeEkVAY=;
        b=a1F++aP+B7h2JonfRT1lw4LYeUsRrMqXFx25EelRAwZE7HFiqR/RXzyKdBqysyIhx8
         XDZwze7aesGzM1FthyrqhCF1F+aSmA2Tb9DhZx6ynDe9GEd4+UL1lrsVBZxZ5PLUVRF4
         +ZVJ/rxLN3930lZXCB30p4wu9+wH5wdlathvPn2kCzCBg4Q00spIstSMzEbdLSdXSFCg
         V/KzwhmegIg85rPnRbZGQiIjBBMtZfD1cFO9NNWzSTaYC0mDU7u9eyypccxrBtB+NjsN
         tperCEG/rMdJCLZmq3nLNf3fBt/JNyNu+v6V3p2E41HbL8RiVjAzWWwN5ZI1rjUGhnjQ
         jjbw==
X-Forwarded-Encrypted: i=1; AFNElJ/oGWPD6nyUKytgFHSsl+rwsWILoqLQnppz8gkCa4yL5ARoPFuEbEaGpySS9YLv114aRuYThgwTrw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdU0KiucKEvJ81kpCGgzysgbuIiLS3GiAQI3MtoOuXN3Ki2ym+
	XvLihJKz8cxPhNZGDWq73OaHYjad6LprEtmYaItIV9FLs6ZDcJYgdDZmVzaQo6UlGcQ=
X-Gm-Gg: Acq92OFpNT+37DXKpTkpoyEudXBTkufBG6v8f/QrfqFklc0UVAlhG29DLLAWYYziRUb
	bUSdRe3gaPuMuNh33gYvdY0GA9rfgkCJ8uSQs7jeQdZ3QR7OVnmO1i860CoDHBLSlow9V3O3pxe
	s1jlCD0EdISrZ6S4b4E8mgpWOd86Me0GabOiRaAlhMBjN+eoWAAZhB1erDnL0yhi8UODhtE23Sa
	qLrr9/4Y0IQBp3WA9ZkCpcKcUWPTptawp8+0onQtLCtIOUn5MIj/yHOI8CR0eWfGIUmm7DwD9OG
	voOboYbSjjvEQV8+oeRlYeQRkjWvSTcE12FNEp8Xom0fFLrQ0bXAkbiuir8c0bGC6PWW0JNiaZ/
	pTOoW1hTRvTJwdjQmbpPf4UMWlJo8Is6JL85OA9TNtGZ16kuGT01NV3a+F09+HReDQA4LBFnM/m
	8qBVSFpa7Tube5LMR9z72K40chVN1/IimbS4D/em9xMldZdBza6BjkN6h4ITapPf/38RqDd1c=
X-Received: by 2002:a05:6122:1817:b0:56b:815c:961d with SMTP id 71dfb90a1353d-599f64e4a4bmr525720e0c.5.1780042699723;
        Fri, 29 May 2026 01:18:19 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d3c9649asm740738e0c.1.2026.05.29.01.18.19
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:18:19 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-95697b46831so8688796241.0
        for <workflows@vger.kernel.org>; Fri, 29 May 2026 01:18:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/2ZnmlxDAhFTWigch1CPTyqNVC40TNUZDo/HZiJ2ofKJoWmCRKsesxB2w+ZNC85Pz0Rwre7vF16lw=@vger.kernel.org
X-Received: by 2002:a05:6102:3e1e:b0:631:3bbb:f23f with SMTP id
 ada2fe7eead31-6bf3dd78c59mr540627137.26.1780042698332; Fri, 29 May 2026
 01:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529081006.2019687-2-ukleinek@kernel.org>
In-Reply-To: <20260529081006.2019687-2-ukleinek@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 10:18:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRuOxznAK3HP_GSGGv+RdkTxkWb5-6xwnUs50qQnbnUg@mail.gmail.com>
X-Gm-Features: AVHnY4JEuppnDpcn_tQwKsOIJi3aBauvsKBhjusGGgi5MxkY-7ZvXd-5Sqe46dE
Message-ID: <CAMuHMdVRuOxznAK3HP_GSGGv+RdkTxkWb5-6xwnUs50qQnbnUg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Fix syntax of kmalloc_objs example in
 coding style doc
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Manuel Ebner <manuelebner@mailbox.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, SeongJae Park <sj@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 29 May 2026 at 10:13, Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org> w=
rote:
> The first parameter should match the variable that the allocated memory
> is assigned to. Fix the example accordingly, the one for kmalloc_obj got
> it right already.
>
> Fixes: 7c6d969d5349 ("Documentation: adopt new coding style of type-aware=
 kmalloc-family")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
