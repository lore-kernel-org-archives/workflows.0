Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43C11D8E1D
	for <workflows@vger.kernel.org>; Wed, 16 Oct 2024 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729085742; cv=none; b=U3UCm+QuhofXUYhtBGcFiYNnGX5ZEPN6TxoAmpkQkHNKwU7A56O8HihNYrvigMsIssTyCaKxPcMtSxFpR2w+4ikiJUWoxCjcoUuh8M/tUwGO//dcevQEtu0+Svd6DO1EAdfhUhB0NXDTK1FVrZ7rLhg1vFESltbqSAgesW0BZoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729085742; c=relaxed/simple;
	bh=W7igrC/eK2v9PvQJY3vqt5RVCwQ9nvtig+iwdm+6N48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XzlrfEGEParCnkMjb6llRd3oXOL52C9x5gN9akpgilPJD69NuraHfSNAeuaXO2P3Oq8egVg3kcLKDXNMMyu45HyAuXNOEjrFg/37UTb9zY/Cfe6upHupJT697mwUk+v7bN9YEr5rNNz+K+JD6nkiIhPnQ6RKtM5hzlHnKxBlGsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nB8SeYFY; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nB8SeYFY"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-71549d19983so3310858a34.0
        for <workflows@vger.kernel.org>; Wed, 16 Oct 2024 06:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729085740; x=1729690540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGFMMPXEklcwVgl1501lsYrVn6gGilFzAu+XllYmFno=;
        b=nB8SeYFYJUenPLbOqgQGE6STzfvRJNQeM8oj0Ttsle20JzbLVSIuAThnro+rPaPypn
         S7OLC1x/iT3oTZkLT8sMCeru47U19/iMI0TxNWp/iiUheJqAMvlyviG76i3e8D0eknoN
         fiVS/iJKNfpGEHQsMZ20ADqWWNd/QpeLWZfDi9GGIjKtXfOIWzHSHg1brOoml67Y2GmB
         sKaCGT79ffDgQL9Vzw5dUOHw75kOKKAGA2mSys8GmWWw2NGzBQds8yzTETcIgAkUkg/8
         ij8lP7tLezTuFu2M18kMvJKVLfluAUMYmzoDn1jp5DDnnYgv+/9r1nXS3KYdZrVNeZfb
         GBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729085740; x=1729690540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGFMMPXEklcwVgl1501lsYrVn6gGilFzAu+XllYmFno=;
        b=uH3SqkGo3LOUsp/BivSaXTSy6W1yPk86XQWGwtxUhjgcdbP3YySirS6HVSNU/quGva
         OSea7Sbze9DR2t2svFTFdFcu5nD/yd2mZ+KAbiVHhtUyYQM6wDn3J31tCYAhkQE6WABH
         YMRMiGRJ936pNNWHx5dF17f3+stCzql4H8Oa6j8tERu3Bmu4Z46JwqCbtdf070b6WW6G
         5vwVm5RbrZGRhtlNZ7HVyhUgk561slQJwG5IFsRqluNl2P13fO7CMRCfSZTdUPzsSFy8
         7y3nqBGvIbiKfT37zii7IZB+Lpu9/OhJ888Kg6RAVsY0KCXCfhaIJ8LSM6b+WgxqggKA
         E54Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVbb/DS5a4aTqVYxSsvsJHg1Z+bFhnGmYdPu3OnwHbqKufwfRlZ53WNlx00uKSmN6XB1fpgxeTrkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjQPoZZ1BVWHa0DsLuFjnmByO0t6mdVbFxxl+KJ1J77jkLmloG
	8ZJcp4PXORobqaMh4+ZIPxOMQPH78ReDyzNPXI3rivVhU74pacOLZHEHlbuOK7dmCtLBTU0CRmi
	05wWOTE53//4Ee3U51aQpjuusmPsASXs8fBk3
X-Google-Smtp-Source: AGHT+IEo2nUPwW3QYnS5NjXSEN6olMWQdzd+0ZaH/E4OSj3fWe9ng8TxJ6S34oZl/m/kvu2FLQCs6M+Xsq0azbm+z1E=
X-Received: by 2002:a05:6808:1905:b0:3e0:6864:52d5 with SMTP id
 5614622812f47-3e5f02584d7mr3874075b6e.27.1729085739815; Wed, 16 Oct 2024
 06:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015140159.8082-1-tttturtleruss@hust.edu.cn>
 <CAD-N9QWdqPaZSh=Xi_CWcKyNmxCS0WOteAtRvwHLZf16fab3eQ@mail.gmail.com>
 <CANpmjNOg=+Y-E0ozJbOoxOzOcayYnZkC0JGtuz4AOQQNmjSUuQ@mail.gmail.com> <c19c79ea-a535-48da-8f13-ae0ff135bbbe@stanley.mountain>
In-Reply-To: <c19c79ea-a535-48da-8f13-ae0ff135bbbe@stanley.mountain>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 16 Oct 2024 15:34:58 +0200
Message-ID: <CAG_fn=UZwpvANRFqgXX+RA3ZO_KLAcQFs0kjeim0Y75GoAgJ8g@mail.gmail.com>
Subject: Re: [PATCH] docs/dev-tools: fix a typo
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Marco Elver <elver@google.com>, Dongliang Mu <mudongliangabcd@gmail.com>, 
	Haoyang Liu <tttturtleruss@hust.edu.cn>, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, hust-os-kernel-patches@googlegroups.com, 
	kasan-dev@googlegroups.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 3:30=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Tue, Oct 15, 2024 at 04:32:27PM +0200, 'Marco Elver' via HUST OS Kerne=
l Contribution wrote:
> > On Tue, 15 Oct 2024 at 16:11, Dongliang Mu <mudongliangabcd@gmail.com> =
wrote:
> > >
> > > On Tue, Oct 15, 2024 at 10:09=E2=80=AFPM Haoyang Liu <tttturtleruss@h=
ust.edu.cn> wrote:
> > > >
> > > > fix a typo in dev-tools/kmsan.rst
> > > >
> > > > Signed-off-by: Haoyang Liu <tttturtleruss@hust.edu.cn>
> > > > ---
> > > >  Documentation/dev-tools/kmsan.rst | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/dev-tools/kmsan.rst b/Documentation/dev-=
tools/kmsan.rst
> > > > index 6a48d96c5c85..0dc668b183f6 100644
> > > > --- a/Documentation/dev-tools/kmsan.rst
> > > > +++ b/Documentation/dev-tools/kmsan.rst
> > > > @@ -133,7 +133,7 @@ KMSAN shadow memory
> > > >  -------------------
> > > >
> > > >  KMSAN associates a metadata byte (also called shadow byte) with ev=
ery byte of
> > > > -kernel memory. A bit in the shadow byte is set iff the correspondi=
ng bit of the
> > > > +kernel memory. A bit in the shadow byte is set if the correspondin=
g bit of the
> > >
> > > This is not a typo. iff is if and only if
> >
> > +1
> >
> > https://en.wikipedia.org/wiki/If_and_only_if
> >
>
> Does "iff" really add anything over regular "if"?  I would have thought t=
he
> "only if" could be assumed in this case.  Or if it's really necessary the=
n we
> could spell it out.

I think you are actually right, "if" should be just as fine in this case.

> regards,
> dan carpenter
>


--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
