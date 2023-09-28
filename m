Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F6DE732E5
	for <workflows@archiver.kernel.org>; Thu, 28 Sep 2023 15:52:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232046AbjI1Pwb (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 28 Sep 2023 11:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbjI1Pwa (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 28 Sep 2023 11:52:30 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D65CEB
        for <workflows@vger.kernel.org>; Thu, 28 Sep 2023 08:52:28 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4053c6f0e50so127636285e9.1
        for <workflows@vger.kernel.org>; Thu, 28 Sep 2023 08:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695916346; x=1696521146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foVf5TV1MmYsP7PedGF8V/NHFqHve2xNubfmQ3LV2g4=;
        b=tvWQEmqFxsVIS/BF4LzTeA7treVv5t5yHUyTzUkEeOrM3tFnq/GkYbgB+CX2NYjSik
         bO2hjgim4OaZ2hxJZFWReBkqr2pixgFlSYjpZrnm6rUodBXPrBulAgLWAImCe3+vxTCM
         CFHrhtW+UnncxkFXBa6QBkaaLvk92fVf1mIWYJAp3Wik/cRJeFSlwWqRPJOQ6jv+9qou
         btpfiyvf5NlXvlca+kOQHG4vnrGHUGuVWnOAtydmqpyaI+jWY0numxgAjW7YDM6+hgbd
         mRqTWtdY/hoc6Mbo/J1QN/FyL4LKcgW6eT9QPVRvibXWcfqKjo+aQkur9n6g53z0vPsp
         3WhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695916346; x=1696521146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foVf5TV1MmYsP7PedGF8V/NHFqHve2xNubfmQ3LV2g4=;
        b=jeT1oPlc5VgBnQF09q/FuW5gLVs7h55nrdrDvMiCthT3MEbImc65Z3JwNx+KSJ2oU9
         Hypg1v8QtWcSE13cAqhy+0+BZ2r/NMb7oWYn+m63bpn8U/bZdw8WdvBZxaMj93lShIQA
         oFxvUXMFYvrnmmTSqa7qc/HehK6+yMhEdoKHAogsPFaCUdykGLnw4filXyXA649Cd8HB
         XlCZiEl5vhJhe7qma64aqkcM4y/k2aUo+0NFWLgRxJWRZVLm1P0Oh8a36xh9ld9d3qYO
         YGACYbz4Q9XyPbZmYYk+bSgj6XEZR6gqZ7DV3Ye7hcDUWj++71W1oaKwlmxHJ4q2Y/lK
         s4Ag==
X-Gm-Message-State: AOJu0YxjRyEuzpaG5gazpXJ1HEql2LKw92vZaGcuzdrgdY1r9XGsUJUz
        eI69MRuXVlyDsmfoidCG597AIcjXF9j1zH4fHloVog==
X-Google-Smtp-Source: AGHT+IFZjhxkEjiaXp2zigCJ7tc2I6455jijXEKgoD9JgTP2Y0UEY5UScbCjY5Sj4DCn07iZsNn312ihcg5GHjZeZXE=
X-Received: by 2002:adf:f108:0:b0:313:f783:262b with SMTP id
 r8-20020adff108000000b00313f783262bmr1652155wro.26.1695916346402; Thu, 28 Sep
 2023 08:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230928-get_maintainer_add_d-v2-0-8acb3f394571@google.com>
 <5707f3bef3ecd8220a8bf7c8b72c72c53e65b666.camel@perches.com>
 <CAFhGd8rtnvipRVAKRQAEcyGqCknVmx+bd2NMT7mCuTZjhrqULA@mail.gmail.com> <137a309b313cc8a295f3affc704f0da049f233aa.camel@perches.com>
In-Reply-To: <137a309b313cc8a295f3affc704f0da049f233aa.camel@perches.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 28 Sep 2023 08:52:15 -0700
Message-ID: <CAKwvOdnGzTvSXf7VeyG8tPEONpqSgkDiBTmgJbUUWsRHzbc5JQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: add patch-only keyword matching
To:     Joe Perches <joe@perches.com>,
        Justin Stitt <justinstitt@google.com>
Cc:     linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
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

On Wed, Sep 27, 2023 at 11:09=E2=80=AFPM Joe Perches <joe@perches.com> wrot=
e:
>
> On Thu, 2023-09-28 at 14:31 +0900, Justin Stitt wrote:
> > On Thu, Sep 28, 2023 at 2:01=E2=80=AFPM Joe Perches <joe@perches.com> w=
rote:
> > >
> > > On Thu, 2023-09-28 at 04:23 +0000, Justin Stitt wrote:
> > > > Changes in v2:
> > > > - remove formatting pass (thanks Joe) (but seriously the formatting=
 is
> > > >   bad, is there opportunity to get a formatting pass in here at som=
e
> > > >   point?)
> > >
> > > Why?  What is it that makes you believe the formatting is bad?
> > >
> >
> > Investigating further, it looked especially bad in my editor. There is
> > a mixture of
> > tabs and spaces and my vim tabstop is set to 4 for pl files. Setting th=
is to
> > 8 is a whole lot better. But I still see some weird spacing
> >
>
> Yes, it's a bit odd indentation.
> It's emacs default perl format.
> 4 space indent with 8 space tabs, maximal tab fill.
>

Oh! What?! That's the most surprising convention I've ever heard of
(after the GNU C coding style).  Yet another thing to hold against
perl I guess. :P

I have my editor setup to highlight tabs vs spaces via visual cues, so
that I don't mess up kernel coding style. (`git clang-format HEAD~`
after a commit helps).  scripts/get_maintainer.pl has some serious
inconsistencies to the point where I'm not sure what it should or was
meant to be.  Now that you mention it, I see it, and it does seem
consistent in that regard.

Justin, is your formatter configurable to match that convention?
Maybe it's still useful, as long as you configure it to stick to the
pre-existing convention.
--=20
Thanks,
~Nick Desaulniers
