Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7264FE743C0
	for <workflows@archiver.kernel.org>; Fri, 29 Sep 2023 03:07:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjI2DHa (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 28 Sep 2023 23:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjI2DH3 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 28 Sep 2023 23:07:29 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96522199
        for <workflows@vger.kernel.org>; Thu, 28 Sep 2023 20:07:26 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-53636f98538so1900938a12.1
        for <workflows@vger.kernel.org>; Thu, 28 Sep 2023 20:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695956845; x=1696561645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R94+FuQqsaH0naS+S/05gaVsqGwPVCr20di+DpmfQaw=;
        b=gcy3UWf3rbEK/a0rrdgRVd3HgvWG5lzHkzdk6i7NA6vyxaP224bERho2F4SFzK7XQ7
         9vbyd7n9tWZ4FVff5mbiyaWD/R2ca1Peg1WtuaTnDukHZeLwve7BpDMUGV4JlGsZgDBd
         +bFFT9YIDlmUePjzIBkkqFPtyOFlN07/AmoqGU5bFpLhAb3EwitxkZWfeiRnuwtj6njy
         q/z8QixXn71hG1sKc/5kozrUyzBjdtxaor2T6n3Ph2/6+cniwlCUYjyrYf+tUGQN3sOq
         +O7rOWkscMGoinX3jDRd2hBdwwlqnbvex8FqeVf4ZoXYTsrXjcu2ab22MwkaleJAPi9s
         Ry4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695956845; x=1696561645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R94+FuQqsaH0naS+S/05gaVsqGwPVCr20di+DpmfQaw=;
        b=i1VQVY6LkQlT4APS49v3WD2ZiRIWz0Yt2dq6VYfi5KTcF/2WQRa9/Y7cARsBCXXjFS
         kYY1Sv4r/8kI1vgob4pWq8zkvoUt+sfZdW7irW3ZsJ3aw1bgXn5cLG2Mztot431jCZUB
         eGn361kvzpVDFwoFZrUvaa/v+ZaoRantijvmXiRETIBrg5P78UdOtQ5DYyBRpMMYCN1U
         H8WVh3wxS3GuhzvNmzlQfoRlw2ZR0T+udaX/FqYHvFFzeoaH1XfQw38DhkAdoa8eMDpK
         S+kGSjfzwOv8p4jnkPVCXqQ3w3h6l/Z5sYL6XeJeGepAUFyhtcay/pqURqbT7i1cT+93
         Cg7g==
X-Gm-Message-State: AOJu0Yy6CXEF+zsgidSrPRv5/+BQrTz7mJRWHjfKRt3+NVOiXuyegWjd
        cAUVn4pEqc1CbdR3+BtrOMVTG2x81zvGZjxWiEkk+Um5jEZG7ppGRmdSYg==
X-Google-Smtp-Source: AGHT+IElb19EkQXAJT5ws9MsyM54PfkaUXP2jiLmHRE42pZPn9FPpqfsT1tn7cTnf6CsFaIGnbyMBT/OhUOI2zP9uaA=
X-Received: by 2002:a17:906:f15:b0:9b2:b85d:cec0 with SMTP id
 z21-20020a1709060f1500b009b2b85dcec0mr2712301eji.60.1695956844884; Thu, 28
 Sep 2023 20:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230928-get_maintainer_add_d-v2-0-8acb3f394571@google.com>
 <5707f3bef3ecd8220a8bf7c8b72c72c53e65b666.camel@perches.com>
 <CAFhGd8rtnvipRVAKRQAEcyGqCknVmx+bd2NMT7mCuTZjhrqULA@mail.gmail.com>
 <137a309b313cc8a295f3affc704f0da049f233aa.camel@perches.com>
 <CAKwvOdnGzTvSXf7VeyG8tPEONpqSgkDiBTmgJbUUWsRHzbc5JQ@mail.gmail.com>
 <CAFhGd8rrHp1V4NpExpdNwWV4FAdLYhixLMB5HGygNSe7NKPUMA@mail.gmail.com> <6691251158ab59ba4090de26012c34788df8f2ed.camel@perches.com>
In-Reply-To: <6691251158ab59ba4090de26012c34788df8f2ed.camel@perches.com>
From:   Justin Stitt <justinstitt@google.com>
Date:   Fri, 29 Sep 2023 12:07:13 +0900
Message-ID: <CAFhGd8rZLpfOhfmBChRTXsGkUjaCUMLiYzBcLbWE9xACK7SFwg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: add patch-only keyword matching
To:     Joe Perches <joe@perches.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        workflows@vger.kernel.org, mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Sep 29, 2023 at 11:50=E2=80=AFAM Joe Perches <joe@perches.com> wrot=
e:
>
> On Fri, 2023-09-29 at 11:07 +0900, Justin Stitt wrote:
> > On Fri, Sep 29, 2023 at 12:52=E2=80=AFAM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > On Wed, Sep 27, 2023 at 11:09=E2=80=AFPM Joe Perches <joe@perches.com=
> wrote:
> > > >
> > > > On Thu, 2023-09-28 at 14:31 +0900, Justin Stitt wrote:
> > > > > On Thu, Sep 28, 2023 at 2:01=E2=80=AFPM Joe Perches <joe@perches.=
com> wrote:
> > > > > >
> > > > > > On Thu, 2023-09-28 at 04:23 +0000, Justin Stitt wrote:
> > > > > > > Changes in v2:
> > > > > > > - remove formatting pass (thanks Joe) (but seriously the form=
atting is
> > > > > > >   bad, is there opportunity to get a formatting pass in here =
at some
> > > > > > >   point?)
> > > > > >
>
> LG G7 Battery Replacement | Guide | Is it actually a Samsung? I t
> > > > > > Why?  What is it that makes you believe the formatting is bad?
> > > > > >
> > > > >
> > > > > Investigating further, it looked especially bad in my editor. The=
re is
> > > > > a mixture of
> > > > > tabs and spaces and my vim tabstop is set to 4 for pl files. Sett=
ing this to
> > > > > 8 is a whole lot better. But I still see some weird spacing
> > > > >
> > > >
> > > > Yes, it's a bit odd indentation.
> > > > It's emacs default perl format.
> > > > 4 space indent with 8 space tabs, maximal tab fill.
> > > >
> > >
> > > Oh! What?! That's the most surprising convention I've ever heard of
> > > (after the GNU C coding style).  Yet another thing to hold against
> > > perl I guess. :P
> > >
> > > I have my editor setup to highlight tabs vs spaces via visual cues, s=
o
> > > that I don't mess up kernel coding style. (`git clang-format HEAD~`
> > > after a commit helps).  scripts/get_maintainer.pl has some serious
> > > inconsistencies to the point where I'm not sure what it should or was
> > > meant to be.  Now that you mention it, I see it, and it does seem
> > > consistent in that regard.
> > >
> > > Justin, is your formatter configurable to match that convention?
> > > Maybe it's still useful, as long as you configure it to stick to the
> > > pre-existing convention.
> >
> > Negative, all the perl formatters I've tried will convert everything to=
 spaces.
> > The best I've seen is perltidy.
> >
> > https://gist.github.com/JustinStitt/347385921c80a5212c2672075aa769b6
>
> emacs with cperl mode works fine.
>
> I don't know much about vim, but when I open this file in vim
> it looks perfectly normal and it's apparently properly syntax
> highlighted.
>

I believe a :set tabstop=3D2 will make it look weird. But really,
this whole formatting thing is a non-issue for me personally
once I discovered what the problem was. I'm not sure this
file attracts nearly enough eyes to warrant an eager
formatting attempt as I was previously preaching for.

Nick and I using vim with special tab handling are most definitely
the exception and for most folks this file probably looks fine.
