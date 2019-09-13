Return-Path: <SRS0=s0xN=XI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579A1C4CEC5
	for <workflows@archiver.kernel.org>; Fri, 13 Sep 2019 12:02:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 348562084F
	for <workflows@archiver.kernel.org>; Fri, 13 Sep 2019 12:02:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387554AbfIMMCa (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 13 Sep 2019 08:02:30 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35490 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387553AbfIMMCa (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 13 Sep 2019 08:02:30 -0400
Received: by mail-oi1-f193.google.com with SMTP id a127so1928803oii.2
        for <workflows@vger.kernel.org>; Fri, 13 Sep 2019 05:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=na24CslarcJWor0pReVXVwhVD5ELg7r/I1y1bqalrUc=;
        b=tj3dxmq6ED6i+y1wzvk0J7JGWzAO7RPqJOMLTt8MWnTvEkgym3xeaeLxKKKvKZslSq
         Oe3Jq3MfBS+Abns9r57ThmUyoET9u01JPpfpAjYS+Tk9jScApPNcAjTjFzZQORbEnKL8
         q5gI8IuD8B8nkVFVAwxFooGH4htp0KzBiBnV4sF2lmmvvtWWubvEsvsog3ulDdPGltsC
         me9QoOLw3MIX41dwk/Hc7ZAZ5PIQF10Crsq7c1uir2QTuPROH/zvKdDj+B5uiGcSyuLC
         PI2rFIW7v8SVdo8cgi8C95oo2Rvz4eFgn3AB2Cw4lWXjfbFu1LKxQOGQFaK+1l0DuMp2
         lmtQ==
X-Gm-Message-State: APjAAAVEKFCBvz9mrAHrXZE9lc7oNNuOmqc3bweWKNYbz7gKYP9OnsUf
        6VjdqmvVCbWCHWnnLD19E1VsgxOFtOf+cTve0Ec=
X-Google-Smtp-Source: APXvYqyjXYg9ItTJ0PE5dxRJsa24JTsw/XtuOez2Si4HPi4OPuWN5esBqM/rRgV/zrl+R+23+Ju/hIDWCwmCXDTG0Og=
X-Received: by 2002:a05:6808:8e3:: with SMTP id d3mr2598946oic.153.1568376149320;
 Fri, 13 Sep 2019 05:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <1811089.yxvLMk49Ug@kreacher> <20190913113753.GG29992@pendragon.ideasonboard.com>
In-Reply-To: <20190913113753.GG29992@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 13 Sep 2019 14:02:18 +0200
Message-ID: <CAMuHMdWKzZ3skZwqKRFURQkS9F2CCt+DD88XdMaCGJ3+vjn+Lg@mail.gmail.com>
Subject: Re: Kernel development collaboration platform wish list
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Laurent,

On Fri, Sep 13, 2019 at 1:38 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Sep 13, 2019 at 10:22:20AM +0200, Rafael J. Wysocki wrote:
> > 3. Integration with git
> >
> >   (b) Link tags pointing back to it should be added automatically to git
> >       commits created from patches tracked by it.
>
> In addition to a link, should the tag message contain a copy of the
> cover letter for the patch series ?

When the patch has a (lore) link tag pointing to its email submission, the
cover letter is one more click away, isn't it?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
