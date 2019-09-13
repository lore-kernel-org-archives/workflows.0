Return-Path: <SRS0=s0xN=XI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A0FC49ED7
	for <workflows@archiver.kernel.org>; Fri, 13 Sep 2019 12:24:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D7DA20678
	for <workflows@archiver.kernel.org>; Fri, 13 Sep 2019 12:24:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728618AbfIMMYM (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 13 Sep 2019 08:24:12 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39882 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbfIMMYL (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 13 Sep 2019 08:24:11 -0400
Received: by mail-ot1-f65.google.com with SMTP id n7so29205539otk.6
        for <workflows@vger.kernel.org>; Fri, 13 Sep 2019 05:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aoJKPSWDijtGfSqfctuM+QKwUdu8OO3xQLBl3jVc3s4=;
        b=SHcEEyEGRwkp99FZarleR1//5EZI/C8CyTzyZIK78QcwHhZ4ILXMF0C7I40/y7qYkg
         JOETbPHNKdm88KnxP46+HAVKXcAR5JzoyhYbDHR7xFCjSWO0NToIaCRYqHErkRZ3ebWN
         fn4Gf2YZl7pykpn1o4GiK8iOj3Y4SXXtgLmGt9mQjb8tQluoTFrHMc4sV/OfnYQKg6Hp
         lZTMUBeWH+D1FGmBB+Vn0oS+epCfBB5n79JsIk0E9DYZ04X50WA+LarhqTjg1T4k9MoZ
         sq0hd6xvoJLGRcAXezo7aiNufRP9ZZoxLvJ9a2lSzqYW5+BtHjZaA1hN45tTmEnwepZd
         W53w==
X-Gm-Message-State: APjAAAUkEH7KTWFZQh+CxXi6vtIr3efO1m7AynMEgbgs0RWi/cXxBTDf
        K3Y90IiLu//U6+qfFMY/fvIf/LCHR0cbAoA20IMj5g==
X-Google-Smtp-Source: APXvYqx6Ga85Zlz+dB8nVJ1AC1QIChn2mDS3zUDJUqbDZjaAbiDJM3eWH0u7a5AXWMOa+SuUHaxOOaMqwmGZpdC+5ks=
X-Received: by 2002:a9d:5a06:: with SMTP id v6mr19039114oth.250.1568377450979;
 Fri, 13 Sep 2019 05:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <1811089.yxvLMk49Ug@kreacher> <20190913113753.GG29992@pendragon.ideasonboard.com>
 <CAMuHMdWKzZ3skZwqKRFURQkS9F2CCt+DD88XdMaCGJ3+vjn+Lg@mail.gmail.com> <20190913121516.GI29992@pendragon.ideasonboard.com>
In-Reply-To: <20190913121516.GI29992@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 13 Sep 2019 14:23:59 +0200
Message-ID: <CAMuHMdW3Nca8S1OcJPPPbxZPOKvoN-5SYE_QR3Kh-ukWFFTuAg@mail.gmail.com>
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

On Fri, Sep 13, 2019 at 2:15 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Sep 13, 2019 at 02:02:18PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Sep 13, 2019 at 1:38 PM Laurent Pinchart wrote:
> > > On Fri, Sep 13, 2019 at 10:22:20AM +0200, Rafael J. Wysocki wrote:
> > > > 3. Integration with git
> > > >
> > > >   (b) Link tags pointing back to it should be added automatically to git
> > > >       commits created from patches tracked by it.
> > >
> > > In addition to a link, should the tag message contain a copy of the
> > > cover letter for the patch series ?
> >
> > When the patch has a (lore) link tag pointing to its email submission, the
> > cover letter is one more click away, isn't it?
>
> It is, but it's nice to save that click if it has no cost :-) Storing
> cover letters in tags makes it easy to reuse them when submitting new
> versions, that's my main personal use case. Being able to read cover
> letters offline is another interesting benefit of storing them in tags.

Oh, you mean git tags?
I think Rafael was talking about "Link" tags at the end of patch/commit
descriptions.

If a series is merged using a pull request, the cover letter could indeed
be stored in the git tag description, and included in the merge commit
description.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
