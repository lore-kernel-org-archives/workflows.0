Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DC1FA372C
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 09:46:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4340821D6C
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 09:46:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731106AbfKHJqS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 04:46:18 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40553 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730645AbfKHJqS (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 04:46:18 -0500
Received: by mail-oi1-f194.google.com with SMTP id 22so4706296oip.7
        for <workflows@vger.kernel.org>; Fri, 08 Nov 2019 01:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=4Idb4ADt4Vz4qbG8hmuXp+aAy3kpFmX+eyPaMSwDvuI=;
        b=Onj8e7gYZoq15NrvDftqLSoVJZuMoq3o6tqhau2ztPemEKfpcMGVnhqicInPfzbKv/
         LhfrNnvh1yADcCPFO1CWkLPWb/+puASBMnOuxiRF39blQCVnhPVqjwnM6L9dElgaTVCb
         Eww6anUZofYbBiPmUuMXdLKOYSmev5/VZ2aRdYLaYgLyJZwt/RZY2C9Ob/ziwjF11EBL
         NqljogYedIRIc2xHjVd82gb5WCqmX7mo+D3pmICcr6DHhBZqcEvWYlcDiRDog0aOqB0U
         uDKGzJ4cER6crL5FEMVLp2H+e7+i/MRtgrLQAIWhRcSniOi9REvW9O0wT0OBsrfUzXgB
         O7gw==
X-Gm-Message-State: APjAAAVDNJwonXMg8/lYQaPWA+zWDw0KWB3KEzKm1PcT2mB3zfgM6eWQ
        hGm/BbKgrPR3opm3pgS/tgdA5ToeNVhXy3tEBrxh90Pc
X-Google-Smtp-Source: APXvYqzoRfNcp/S0NQtRzkk8lYj5qeU4aayMYO62wR/vdYQ4Jsqsf+aO0a6FbBac7yMKKRLCCsQ9h3WJCF9x2i62DLI=
X-Received: by 2002:aca:882:: with SMTP id 124mr8746227oii.54.1573206377159;
 Fri, 08 Nov 2019 01:46:17 -0800 (PST)
MIME-Version: 1.0
References: <20191107204349.hqpefgp7cowj6hof@chatter.i7.local>
In-Reply-To: <20191107204349.hqpefgp7cowj6hof@chatter.i7.local>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Nov 2019 10:46:05 +0100
Message-ID: <CAMuHMdX58ztXbvSLOaLkRG6UBqhcEU1gfz_LFeM6fX5B5diF6w@mail.gmail.com>
Subject: Re: RFC: using supersedes: trailer to indicate patch/series revision flow
To:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Konstantin,

On Thu, Nov 7, 2019 at 9:44 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> The only mechanism we currently have for patch/series versioning is
> subject suffixes. I think it would be useful to have a way to more
> explicitly mark that a series obsoletes a previous version, and I
> propose this is done with a `supersedes:` trailer at the end of the
> cover letter or in the first patch of the series:

In theory, this sounds like a good idea to me.
Whether it's practical to implement it, is to be seen...

> Questions:
>
> 1. Should this be exposed via git-format-patch flags, or just used by
>     specialized tooling?

While I switched to always applying bundles from patchwork to have the
Link: added automatically, I'm not aware of a simple way to add a
superseded header automatically.

> 2. Should supersedes: link to the previous version of the patch, or the
>     first ever version of the patch? I am leaning towards the latter,
>     even though in this case the message-id largely becomes identical in
>     usage to Gerrit's Change-Id.

The previous version, as that's the one being superseded, and doing it
this way allows to iterate backwards through history.
The first ever version has been superseded already by the previous
version (if any).

> 3. Should the supersedes trailer have:
>     a. message-id without brackets
>     b. message-id with brackets
>     c. https://lore.kernel.org/r/message-id
>     My preference is b, to match with The Message-Id header usage.

I think c makes most sense, as it allows to follow the Link: in a commit, and
iterate backwards using the same method.
Else we have to convert manually from message-id to lore link.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
