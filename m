Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADD4C4CECE
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 07:30:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 18BD12064A
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 07:30:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbfJNHaf (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 03:30:35 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45022 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728811AbfJNHaf (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 14 Oct 2019 03:30:35 -0400
Received: by mail-oi1-f195.google.com with SMTP id w6so12903158oie.11
        for <workflows@vger.kernel.org>; Mon, 14 Oct 2019 00:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i0G2GrKOjk++xSNsDf8nNan7JKwlfWylQVgolmbHnbg=;
        b=JJwrPBlnVI8PsSWl+g6V17RIUi3zYlmHK3ZkNpQQcKOKQoE+Zgq6Mtd70CZnUPjo4d
         QYMknaqUYskqHmLFNzkGgPk/UbN/RFI3KdZxI5W+I1647tZVkPDRvV8lzBfquX8Iwoln
         zNOPTdhEuylYWNK5IIvwPS8SCL7Xwcu4rPh6naVwBSlkcT+hzJXErtkkxpTurcRXPy8F
         IID5ouP5Li54mZdTva33OgAVJHVElBUym/3tTXYHwY+f/sJUlgzX1xC4fztyX0CrnoSe
         seDc0i+kWtsqQDCw95sAeI22OUkSt4pnrv+OIA1nRMhClZmUwOOWeEOe+WlgrDHj6YEB
         GebQ==
X-Gm-Message-State: APjAAAVB+PIEEM0yJebUtu6P3Ra5I33AGkO5eK2vxMDlZp2kd0a48tn8
        VWCL8t17gNWrdOHwLmlD1VdradMBYG0Kl+t9eU1jAg==
X-Google-Smtp-Source: APXvYqyvn6sdB/s5yYCoAZojeFFzJmucdKx9LMgPvD+AObCcW3Fm1pLUFbptI1ocILaYJjiC9kqs1Olhnd4R0kOTJvU=
X-Received: by 2002:a54:4e89:: with SMTP id c9mr22157310oiy.148.1571038234435;
 Mon, 14 Oct 2019 00:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com> <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
 <20191011212308.xk7xcvfamwnkwovn@dcvr> <20191011213553.g3pleurh5uomumi7@chatter.i7.local>
 <20191013233930.GB13089@dcvr>
In-Reply-To: <20191013233930.GB13089@dcvr>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Oct 2019 09:30:22 +0200
Message-ID: <CAMuHMdUWCZSt4khKajise_UrRJxHS2a=LL334u8Y938PfK2rQQ@mail.gmail.com>
Subject: Re: RFE: use patchwork to submit a patch
To:     Eric Wong <e@80x24.org>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Eric,

On Mon, Oct 14, 2019 at 2:12 AM Eric Wong <e@80x24.org> wrote:
> Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> > On Fri, Oct 11, 2019 at 09:23:08PM +0000, Eric Wong wrote:
> > > > (This is the same reason I generally disagree with Eric Wong about
> > > > preserving SMTP as the primary transmission protocol -- I've heard lots of
> > > > complaints both from kernel developers and especially from people trying to
> > > > contribute to CAF about corporate policies actually making it impossible to
> > > > submit patches -- and no, using a different mail server is not a possibility
> > > > for them because it can be a firing offense under their IT AUP rules.)
> > >
> > > I'm not opposed to a webmail interface tailored to kernel hacking
> > > which does stuff like checkpatch.pl and get_maintainer.pl before
> > > sending (similar to your patchwork proposal and
> > > gitgadgetgadget).  That would get around security appliances
> > > but SMTP would still be used in the background.
> > >
> > > Or offer full-blown HTTPS webmail + IMAP + SMTP access like any
> > > other webmail provider + checkpatch + get_maintainer helpers.
> >
> > Well, this is the bit where I say that it may not be allowed by corporate
> > rules. I see this all the time in CAF/Android world where companies
> > *require* that all email goes through their SMTP server so that it can be
> > properly logged (often for legal reasons). And it is often equally required
> > that any code submissions come from person@corporate.com and not
> > person@free-email-provider.com for License/CLA reasons, so setting up a
> > webmail server is not a solution either.
>
> Aren't they still allowed to submit stuff via forges the same way
> they'd use a potential hacker-oriented webmail/SMTP/IMAP solution?
>
> Sometimes I see @username_COMPANY-type names on forges, but
> AFAIK it's not very common.
>
> > This is basically why SMTP sucks in my view -- and it's worthless trying to
> > pick fights with IT departments, because they are told to do so by lawyers.
> > So, I want to take SMTP out of the equation:
>
> If the open source community can fight to get GPL accepted, I
> don't see why we can't fight or subvert dumb corporate policies.
>
> > 1. provide a way for someone to submit a patch using a web interface   (but
> > still in a way that From: is their corporate ID)
> > 2. use individual git feeds as a way to send out patches instead of   always
> > being secondary to SMTP
>
> username-COMPANY@users.kernel.org could probably work if they're
> required to use @username_COMPANY on forges.

username+foo is the standard way.

> We can also find creative ways to subvert corporate policies:
> For example; if their policy specifically prevents outgoing SMTP,
> "git imap-send" could be used.

IMAP may be blocked, too?

Bascially the only thing you can rely on is HTTP(S), through a proxy,
possibly with HTTPS inspection through a company-specific trusted
certificate that allows MITM.

> If their policy forbids using external "email" services, we'd
> name it "Kernel Hackers' Messaging System" or something of that
> sort and say we use an email bridge :>

Anything named "Hacker" may be blocked, too ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
