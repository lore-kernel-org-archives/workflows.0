Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F259F1173C
	for <workflows@vger.kernel.org>; Tue, 12 Dec 2023 23:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGp0UvHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675ABC433C7
	for <workflows@vger.kernel.org>; Tue, 12 Dec 2023 23:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702423802;
	bh=WTD2o0zcbXVF2fFDXS838V53B9qAqtLeuLU/99pFs8w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CGp0UvHecsrlSIU3jnYBYe77/5Qva/ULhrVc3BitWwxfCw0vJVPHr3gXScV95ke2W
	 +BrgW3RO4pRKtlZH0aVQ2PnffLGdihLNShsFeXQbfXxAlocfzH9SAQYAt5K8p5ozrv
	 mb9RMzVM9Pt3KtrKEM7/0j6w3yToPOVk3qxb8Tk4490hM6NAYodPafRJ5TWVROnEGg
	 pbeJlf3KbpLhaLmLQSmI/iD7sZXbcXTDi3A4dF8h4k5YEU2onJL4QEI/rlVoJKOgCU
	 du7ESgBDsPZK60Gl7y3aTE7EyJRfmgQUDvzLcOCkuOAlxkuIA0DEpAwb0MCtr4Sggi
	 1fhij4WfhULIg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50c02628291so6659057e87.0
        for <workflows@vger.kernel.org>; Tue, 12 Dec 2023 15:30:02 -0800 (PST)
X-Gm-Message-State: AOJu0YxtN2LwQGy6kITL/dfcvXTVjAsgbnfTPI3ESBMWKrtG2vpwBPlM
	mqrjqmBP56+lj37vN6RtOSR+82N68MMVL9WujA==
X-Google-Smtp-Source: AGHT+IFiYJ4gPT80dz3/3CR9QqN+nKtXgDPagWY1TcSNyMUiWE16h0gG48KaboLw1Ft39QJEf+kvNrn1heUNEIY3gVU=
X-Received: by 2002:ac2:4351:0:b0:50e:f9a:9df8 with SMTP id
 o17-20020ac24351000000b0050e0f9a9df8mr89641lfl.41.1702423800604; Tue, 12 Dec
 2023 15:30:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128001028.M189230@dcvr> <20231128-classy-brown-muskrat-7f07b1@nitro>
 <20231128173509.M955004@dcvr> <20231128-pretty-sidewinder-of-pluck-a61b0a@meerkat>
In-Reply-To: <20231128-pretty-sidewinder-of-pluck-a61b0a@meerkat>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 Dec 2023 17:29:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLc2YEhJYe_Or264drdtkDXPJOf+VwbNHUHqcrt41bxCQ@mail.gmail.com>
Message-ID: <CAL_JsqLc2YEhJYe_Or264drdtkDXPJOf+VwbNHUHqcrt41bxCQ@mail.gmail.com>
Subject: Re: extra search flags and params? (ispatch, replycount, ...)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Eric Wong <e@80x24.org>, meta@public-inbox.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 11:49=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Tue, Nov 28, 2023 at 05:35:09PM +0000, Eric Wong wrote:
> > > I understand the reasoning, but I'm not sure we should be trying too =
hard to
> > > make public-inbox a patch tracking platform. What makes lei great is =
ability
> > > to automatically find and retrieve entire threads -- I feel like we s=
hould
> > > leave series tracking to other platforms that already exist (patchwor=
k,
> > > patchew, etc).

patch tracking platforms might want to use public-inbox to get the
patches in the first place.

> >
> > I was thinking more along the lines of readers just trying to
> > find trying to find non-patch discussions.

I do this time to time to find things I miss. Since I have patch
tracking, I don't miss patches.

> Ah. I think here is enough to just say "s:* AND NOT s:PATCH" without
> introducing additional xapian indexing parameters. Though, perhaps the we=
b
> interface can also gain a "collapse threads" view?

There's also [RFC 1/N], [PATCHv5], or just [vN], so:

"s:* AND NOT (s:PATCH OR s:RFC OR s:v1 OR s:v2 OR s:v3...)"

But when someone does "[RFC] Things I want to discuss" or "blah blah
patch blah blah" it won't work. It's fragile and inexact.

We already have find certain patches with dfn:, why not find all patches?

Rob
