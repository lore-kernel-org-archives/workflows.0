Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43EE1CD1E4;
	Sun, 12 Jan 2025 17:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736701819; cv=none; b=c/ZP8tkX+42iNTqG9g+aeXm0MmTd54+YbPXTjWsMkfV643BMqRTp6DlIecApzxqWGuUZBFLBmOWZ/qiu40R4/7vhMUNG5QY3VvQZHVm22K4o2jBoZY3ClR4VZh76H7PISaCphUKiqy76mevgUH+3vYvzhJFbG9i/l9WUaXzIvAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736701819; c=relaxed/simple;
	bh=gJ+RuvagMf8tl1xcnIOZN+Mj3mQMfvDjzmgmDAhHNVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aIFSfN0LJcyyswzJwU3nGrq9psQB0/SWLTNc72+Fit+zUTzUKRjGtSvqsfY668ia5Zp2JLWPcthZfBJ5eZY6uPB2FL1Pj8yzSvlEAtwm4gdiSnZ92HpzLXhsYuCdotvlTAGVY6/wvjhlfSDURnab4KMVNWCyW/QUYDGNqwCAKEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7N1uuf9; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7N1uuf9"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f440e152fdso837493a91.0;
        Sun, 12 Jan 2025 09:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736701816; x=1737306616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJ+RuvagMf8tl1xcnIOZN+Mj3mQMfvDjzmgmDAhHNVY=;
        b=U7N1uuf9NcHMH0P9DjuEK6v6FKCWcTvuo7icxor/HkqKxaujSJWaCYPsyh+qaHeTTp
         EIw2zFsuSC6WTE+unb1bgmtKv5T6+/N9F8UU4zzawnu4ddBlIgmk9WkVErt05jzLx0Em
         fChEhpiJH3DSnD3ETWc1WvDIVrjZtlFdccCtiyj6QNJVIJyrwzDJ9hhivedAoMgynYAO
         rLz7CZ1MkXFG5Fgoc62qjQ3ZVu5qdmrvFq1IloOONmbSiPKEbbYYBbfAd04846mQ26v0
         ReEaGY7cqWpWfWC8sZhzfDcCACZxeLVsSCEyXT12I3HSuEE/5ReOgrbV8IUS9Cejw2H6
         HHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736701816; x=1737306616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJ+RuvagMf8tl1xcnIOZN+Mj3mQMfvDjzmgmDAhHNVY=;
        b=kRwc3JUX6YTPrR97BGk8PhTX5fXYj7FtPhlsEUYqgTRhgs3fLTkaXdSkQeqlhBh88l
         ik0lPBMEfnQlfqhDfg/BrAjpGOYmv4rcqd49ABcZWLy+GNlKIk9E0bPCCcRmBkQEKKCu
         YuMavcTLr9LLPEkCmAzpNwaK9XVq9NBs7lK+5lDeVt94Taysu+5wkkK0oKpz/qxgbtDP
         5qa5CCaQ0vASlKYjzqHbTQubHiwYT8wx+q95VUVvZ90Dgv/3qinNaT5nIMjCc2Iu/erq
         M4+P0e0fp7FPssZW95WLZerwc2SWOFFdzoko5jWxbZja+hsXMiFuIsOuUKdKR2cHFAoS
         3iUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAY9I2sex8KQkuY3IRcXb6u/6KjORcRQaa6twjEv5Qs6L81/4A0yJD/s6aGrBt9Ni5L5RDfOCk5J00kdiS@vger.kernel.org, AJvYcCVBL2/YEsmfk7lhuH+UEBVZra/qauM/nsxLuDYV8veEfR6IvA3znjRLoog2x89EOJ/z4dg0ZSBa1mc/@vger.kernel.org, AJvYcCW1ksiuMIMNOU0Wq05wKUW2zSEY8O98qWET5WCnFudzyW1W5Jhg5LimVR1Q3To/kCxizLnUUBBx/tg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWD0ul9d7pMHUVzAkbnPcpDKc/GNrv/1xU6b/IyuMa9oR0E8Yw
	tr/Ccm6QnrAT96ce5TT+rM+9unRGlokR/AvlmRK8AbyxyOJYUPHT6LMNkGfrUdnsgbvLQUx56EK
	WIg2e49F5vFhUvS7D66nGiBecNd8=
X-Gm-Gg: ASbGncvGO0iEUhg+S36hyd3MOgrGFiSMYJvslcQEJceeVukOxzXpxRg1ebBKYz/6JDX
	Z87oNXwCc6nG+QjrWPo4/EbiSqLMbP7Pb+pntNg==
X-Google-Smtp-Source: AGHT+IHxoxUQSPlBOqQ0zh5ZIpFG+rt0AMgT3xRUQJwHEFqbYPbyKn6L/j9REv91zMAhFmPNH1dQSh8ewB3F2mgpwRw=
X-Received: by 2002:a17:90b:538f:b0:2ea:5e0c:2851 with SMTP id
 98e67ed59e1d1-2f548e3c0c8mr10050369a91.0.1736701815909; Sun, 12 Jan 2025
 09:10:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250112152946.761150-1-ojeda@kernel.org> <20250112152946.761150-3-ojeda@kernel.org>
 <CAEg-Je81VAYecajUjYVJKBJUT+YqKemWsWEoWFgOcF=vtfPRPw@mail.gmail.com>
 <CANiq72kQOrvi5=1RUScEpov79RNzA3vna9KW6MoYmj8XJZhpQQ@mail.gmail.com> <CAEg-Je9Cs54SkvhzbSq=2v2QYMo=mwUuGqFcs6cvi7nFgw6+Ug@mail.gmail.com>
In-Reply-To: <CAEg-Je9Cs54SkvhzbSq=2v2QYMo=mwUuGqFcs6cvi7nFgw6+Ug@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 12 Jan 2025 18:10:04 +0100
X-Gm-Features: AbW1kvahoCxgDriEaQ0jzXg-Xw-OJQLOMZcGEkZHdji6mnUF75v6llzV78Fsi7U
Message-ID: <CANiq72=GsHUARPZqdj8TSzHLoW9SHDK72D10s2vhTN1OEW58oQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] docs: submitting-patches: clarify difference between
 Acked-by and Reviewed-by
To: Neal Gompa <neal@gompa.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	tech-board@groups.linuxfoundation.org, Steven Rostedt <rostedt@goodmis.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, 
	"Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2025 at 5:36=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote:
>
> I've had my Reviewed-by tags silently ignored or deliberately stripped
> because even though I've done a technical review, the maintainer does
> not believe that I did. Therefore, what I am saying is that
> maintainers seem to speciously decide whether an Acked-by or
> Reviewed-by tag is appropriate or not *after* someone has sent it.
>
> This is the fundamental problem I have right now. This decision is not
> the maintainer's to make, it is the submitter's.

First of all, if you are referring to other cases that I may not be
aware of, then I am sorry to hear that! Things like this can cause
friction sometimes.

Sending tags is OK, but the author/maintainer ultimately decides
whether to pick them up. For Reviewed-by, I would think it is rare
that it gets ignored -- after all, maintainers usually love to get
that tag.

If you mean the case that triggered this patch series, then (as far as
I understood it), the maintainer was OK with picking your Reviewed-by
and Tested-by if you sent it, but not your (bare) Acked-by. That
seemed reasonable to me, because the rules are a bit unclear around
the latter tag. This series tries to solve that part, so that in the
future one can provide an Acked-by with a suffix in a situation like
yours.

Cheers,
Miguel
