Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E594C14659A
	for <workflows@vger.kernel.org>; Tue, 15 Oct 2024 14:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729002789; cv=none; b=Apbj+ohvjhwuWbYlh39sRCCsKuL53y6DStUNf6Ii3+fKdD+k284Blv1usnh6VUJVa1c338JaKAkxT4zElUm/jSLJtQEZ777Erhe850vVfbkooeQp68/JJDOQjoQPq5Zjh0hd8VWoG2lWnAN5pEOtWiPcoa1SRJ6A0xEOhHSZHqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729002789; c=relaxed/simple;
	bh=cispWMbOcCPkOtixYU/J3EAO8QBZS+85mmwIXWPTglI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sgEzqAj2c0+kIWt8lTNmDooLeZAbS+191urXfAd9n6rWLoSVO2+9v/NK6tMRNz685E6DA8mO752I2mN5kWzETSMJ1TNryYPpHK3luwVfwhJGgljMn5xVyZpKZghLylkJuVtRmR6yXqisKo09EvGacUEG0H+6HrfV/tL1I+3ATXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gfeqcZ2C; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gfeqcZ2C"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e2972abc807so551795276.3
        for <workflows@vger.kernel.org>; Tue, 15 Oct 2024 07:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729002786; x=1729607586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYbi5gZJ4OrZjgdOZozfnDl/MQxnlNPVWNQhf6fR4f0=;
        b=gfeqcZ2CWvVbAasFznspjOcugD28srEpnDEuLEYIcm8bREJtkzERKBlbivN6L+E/PE
         6ZqR0uNdEJG7qaYupwOWSGpZO2coweQ7CwYdX0aNSETBnmNo1JWDz1Bx+7hB02pms/yq
         Wb5DBAUV6yFmGgBjWAqlS7widg42xq7ylrDOS954MSU7oxPqLT4h9emAg9K7tcaOHkYL
         x1LdhH09+SAM/7cCG2zAet00frpQhWOcE+NG+FoUgR4cbLRQn2yhsORTNJOofPKv/+Lq
         GtO/pCXmVVxfQ/K2K63zS5NT9GBbn19prflIKaryXKyQXunGI5H0932OKJh/WPKVHYF0
         GBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729002786; x=1729607586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYbi5gZJ4OrZjgdOZozfnDl/MQxnlNPVWNQhf6fR4f0=;
        b=UZmGxI7AjSfMMjigyQ+6iOGBe0Fdui4Tv04dWLlDWWSq6Wz8ylJdMM/dFtOKm3Oihn
         O8aTkDMJ7lSCxULpuMAduO0mDlJnubHYVsDKrQTKKoisFkS045XN8HnIEKN7yvSwjq0g
         ALPNSlSAXDKCjhHCM7eZKdyDlr4N0CQTvlTFKpiQSEn9i5auQSmJdQcvgZOYlIgqhlBx
         aAyKb66aZowbV3JU++HYJUC716WSDxgPrqCOKtvqcZahWMvDykwsxrwR7HbF/tFDgFua
         xsaxxKyvt/jhPB4aHOc96sujc7PpX8GyQ8pXJ9ClUiI8bmcCmDRzhcd8rO7S9CsxKVD5
         AaFg==
X-Forwarded-Encrypted: i=1; AJvYcCVxbFm5AayvdPy15s02P+sNEM6bCawcf4f5ucpTORHF4JuIV5PKMhsN8TKeNoZVH1+GQeNfXN60xMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNsu/7ZB+9lAvzXkC1vQPHi7RHI40Q+3lh+4mdE9+tHSUPCSFO
	WeHM0XHDFPV8hRsxdZIMaO+YRclyiC+yFAV8485HiNTc8n9vVNPxrXYKIQzs5vdSiMlfU2mF7vo
	j/8i4IS+eWy8ULYwzW8EjqzSw8tvO4NN1xTnZ
X-Google-Smtp-Source: AGHT+IFZs56aAHhGD7Dtb0kDtkQdr1ZZUSIQiPFpxpiO5HWv5d7OB4424EZKwAZ4IMnzuRzHa4IKV/3BReaO30E2D7I=
X-Received: by 2002:a05:6902:114d:b0:e29:3923:9934 with SMTP id
 3f1490d57ef6-e297830bb05mr532299276.26.1729002785701; Tue, 15 Oct 2024
 07:33:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015140159.8082-1-tttturtleruss@hust.edu.cn> <CAD-N9QWdqPaZSh=Xi_CWcKyNmxCS0WOteAtRvwHLZf16fab3eQ@mail.gmail.com>
In-Reply-To: <CAD-N9QWdqPaZSh=Xi_CWcKyNmxCS0WOteAtRvwHLZf16fab3eQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 15 Oct 2024 16:32:27 +0200
Message-ID: <CANpmjNOg=+Y-E0ozJbOoxOzOcayYnZkC0JGtuz4AOQQNmjSUuQ@mail.gmail.com>
Subject: Re: [PATCH] docs/dev-tools: fix a typo
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Haoyang Liu <tttturtleruss@hust.edu.cn>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	hust-os-kernel-patches@googlegroups.com, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Oct 2024 at 16:11, Dongliang Mu <mudongliangabcd@gmail.com> wrot=
e:
>
> On Tue, Oct 15, 2024 at 10:09=E2=80=AFPM Haoyang Liu <tttturtleruss@hust.=
edu.cn> wrote:
> >
> > fix a typo in dev-tools/kmsan.rst
> >
> > Signed-off-by: Haoyang Liu <tttturtleruss@hust.edu.cn>
> > ---
> >  Documentation/dev-tools/kmsan.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/dev-tools/kmsan.rst b/Documentation/dev-tool=
s/kmsan.rst
> > index 6a48d96c5c85..0dc668b183f6 100644
> > --- a/Documentation/dev-tools/kmsan.rst
> > +++ b/Documentation/dev-tools/kmsan.rst
> > @@ -133,7 +133,7 @@ KMSAN shadow memory
> >  -------------------
> >
> >  KMSAN associates a metadata byte (also called shadow byte) with every =
byte of
> > -kernel memory. A bit in the shadow byte is set iff the corresponding b=
it of the
> > +kernel memory. A bit in the shadow byte is set if the corresponding bi=
t of the
>
> This is not a typo. iff is if and only if

+1

https://en.wikipedia.org/wiki/If_and_only_if

Nack.
