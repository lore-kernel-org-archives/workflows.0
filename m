Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C79E743D9
	for <workflows@archiver.kernel.org>; Fri, 29 Sep 2023 02:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjI2CIH (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 28 Sep 2023 22:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjI2CIG (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 28 Sep 2023 22:08:06 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF831A2
        for <workflows@vger.kernel.org>; Thu, 28 Sep 2023 19:08:02 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-405524e6769so826425e9.1
        for <workflows@vger.kernel.org>; Thu, 28 Sep 2023 19:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695953280; x=1696558080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpJvrW7U3xIffjqcwESsvsx+jvDlYI20BWsEDJIfKsE=;
        b=2mEH4vX2MW9Muivxe5HnYD0D9xKlG7iFWifZZmlmkg61RvoSAI7p1LzGG0z0NZbX59
         GhSigpX7EF2e6wrKBQBONwQtNBGW4a4IA5we4eeGeOI+bCcqEvOYbjOHChN8pSKOd2NJ
         OQbUWVE810bKYvKkUoQQw8Xb1Dfy1r125Z2BfZbzDi/Yqvrra4Xjx1LPqvVxTHl6xaNE
         2AAud50EfMp5Zaxq0ytKKqvL5oD9cOac1015NGFIGDwlz6XXN9FiVnhDOKvsD9bpgjFi
         WAhP/yFPdcrL/+1yFMiqTtBPZWjIyt1mCSl6tL88ZOz1cNtWWoBOBihys4V/31JrytO1
         YYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695953280; x=1696558080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpJvrW7U3xIffjqcwESsvsx+jvDlYI20BWsEDJIfKsE=;
        b=rQzcdCsdj5RhweYn1kueWlNYY5kWWlgH5rwRxqQZWDuRc1y7KiYGcxW6TBRCh1o+7c
         FBFgpKQmu7IhRyTwU9/jw56dlVfmn2bzVWtdBRMVPto6Zg8KhTyOSbQhWTUC3ZjG4p+S
         EX8ExGXaXgoGZWLoQtxAda0I/+LMdncPNjS6C57L/wkoIm4nbSAtWAuHuxxA+cjYwehu
         8x7FjCDPJUOTpsQEbDK4q8wkStSxSJlTlCBDoJ8JGn/o4vniBAEltdLd8u6fpnlKRr9p
         zNiE44uXabZkijZ0Kx7q7eml0oi2RYHWCfBpwbj6edCLh6p6DlP9PUgBo8FCqtIMC8hO
         w0Ug==
X-Gm-Message-State: AOJu0Yymttpq+fRj3FBwYfeDzGpSDXJykxK4vY+YkJ6Zk56H+aJQID86
        ggEUxvJBLHsw9qOT2nIM4HCwgN0djqLX3X6dNN2vng==
X-Google-Smtp-Source: AGHT+IFyoQ45G0/xSiJVIsjcy4eWKEwZ/2vhbS/D95tXQxzUqaJAJuRIh3RZM++LVJ05Ro/8eSB9olgdUNOmkr0SiWg=
X-Received: by 2002:a17:906:c146:b0:9a5:dc2b:6a5 with SMTP id
 dp6-20020a170906c14600b009a5dc2b06a5mr2604319ejc.35.1695953280532; Thu, 28
 Sep 2023 19:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230928-get_maintainer_add_d-v2-0-8acb3f394571@google.com>
 <5707f3bef3ecd8220a8bf7c8b72c72c53e65b666.camel@perches.com>
 <CAFhGd8rtnvipRVAKRQAEcyGqCknVmx+bd2NMT7mCuTZjhrqULA@mail.gmail.com>
 <137a309b313cc8a295f3affc704f0da049f233aa.camel@perches.com> <CAKwvOdnGzTvSXf7VeyG8tPEONpqSgkDiBTmgJbUUWsRHzbc5JQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnGzTvSXf7VeyG8tPEONpqSgkDiBTmgJbUUWsRHzbc5JQ@mail.gmail.com>
From:   Justin Stitt <justinstitt@google.com>
Date:   Fri, 29 Sep 2023 11:07:48 +0900
Message-ID: <CAFhGd8rrHp1V4NpExpdNwWV4FAdLYhixLMB5HGygNSe7NKPUMA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: add patch-only keyword matching
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
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

On Fri, Sep 29, 2023 at 12:52=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Sep 27, 2023 at 11:09=E2=80=AFPM Joe Perches <joe@perches.com> wr=
ote:
> >
> > On Thu, 2023-09-28 at 14:31 +0900, Justin Stitt wrote:
> > > On Thu, Sep 28, 2023 at 2:01=E2=80=AFPM Joe Perches <joe@perches.com>=
 wrote:
> > > >
> > > > On Thu, 2023-09-28 at 04:23 +0000, Justin Stitt wrote:
> > > > > Changes in v2:
> > > > > - remove formatting pass (thanks Joe) (but seriously the formatti=
ng is
> > > > >   bad, is there opportunity to get a formatting pass in here at s=
ome
> > > > >   point?)
> > > >
> > > > Why?  What is it that makes you believe the formatting is bad?
> > > >
> > >
> > > Investigating further, it looked especially bad in my editor. There i=
s
> > > a mixture of
> > > tabs and spaces and my vim tabstop is set to 4 for pl files. Setting =
this to
> > > 8 is a whole lot better. But I still see some weird spacing
> > >
> >
> > Yes, it's a bit odd indentation.
> > It's emacs default perl format.
> > 4 space indent with 8 space tabs, maximal tab fill.
> >
>
> Oh! What?! That's the most surprising convention I've ever heard of
> (after the GNU C coding style).  Yet another thing to hold against
> perl I guess. :P
>
> I have my editor setup to highlight tabs vs spaces via visual cues, so
> that I don't mess up kernel coding style. (`git clang-format HEAD~`
> after a commit helps).  scripts/get_maintainer.pl has some serious
> inconsistencies to the point where I'm not sure what it should or was
> meant to be.  Now that you mention it, I see it, and it does seem
> consistent in that regard.
>
> Justin, is your formatter configurable to match that convention?
> Maybe it's still useful, as long as you configure it to stick to the
> pre-existing convention.

Negative, all the perl formatters I've tried will convert everything to spa=
ces.
The best I've seen is perltidy.

https://gist.github.com/JustinStitt/347385921c80a5212c2672075aa769b6

> --
> Thanks,
> ~Nick Desaulniers
