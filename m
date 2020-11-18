Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E213CC5519F
	for <workflows@archiver.kernel.org>; Wed, 18 Nov 2020 19:31:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6991524180
	for <workflows@archiver.kernel.org>; Wed, 18 Nov 2020 19:31:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEEiBlSC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgKRTbA (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 18 Nov 2020 14:31:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgKRTa7 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 18 Nov 2020 14:30:59 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D35C0613D4
        for <workflows@vger.kernel.org>; Wed, 18 Nov 2020 11:30:59 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id 81so1913440pgf.0
        for <workflows@vger.kernel.org>; Wed, 18 Nov 2020 11:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=8MBHL6Aq251/Q5pSvcCHaHY0DEJawQTcfvbLO/aZ8JU=;
        b=NEEiBlSCHlwE8TYllALxqYRdEtDgYG/UByC30yX+HrZ0q54cPpZQvl0V9Aaq0RC0WR
         4Ss6sL8u0VNCqzS8hh6WPnl6/SOq6yMIE/nWwlYIlOCaIlakVB/AtgFKU874dT+628qi
         /RD2A4zbraYE0uAmQvFXsVvzjq8GbYeuXy9fPIHehUGni83oGp7rF7KsKTYMh0sXT0sm
         R/lamaip0t7Df0pEkWkudmCrDNc1rWVp/u4//6qD0Ip9ERBCddSJzwEm8ssh1MRAf8Hg
         4aVFOO+DYqRMEJSt5DkGD3coA2Nj43xOqxVSjrvQVnx1InSgUMjm2fXlLncdi1kJSuyL
         +B0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=8MBHL6Aq251/Q5pSvcCHaHY0DEJawQTcfvbLO/aZ8JU=;
        b=MM+ega4MhqKg1mje9rkMrYSl3X2bNnPY4ulJdv8g7c+ONf//p2c6WDZrGU9eoJqGI5
         743W6c+AF0QLbmLoydZfTxIr1tN/PVqbkqlAHaN99QBV09uDEzi0EMGdZeDzpf55ngVo
         KKq8p7Xs7eq7PwFr8IcCY9QSVZPZnOa8HAFXCf2c+SYDEcwue7bKoEmO+uh0wIURsPsa
         uhw/c56YyP80wN3G9AvSenEfx5WVwJNZTCnwQovH+y5odm7zCQ39Uoic88vcEdKmeq4o
         SZCrPkZgrxC/AFaroCRnRPlkP/P2MiRMRGyMjVoPgkTB03lgEtr8I+M/daNdj4ONtKQ9
         jn3Q==
X-Gm-Message-State: AOAM5318H/zVktJeXr73nK11tmC0HiLQVuN2Ekb+sfKUzTV+8HGYqwAB
        16RmwWLrQWflI5BTUZFACmP7bGTiPP0oeifBu/X3N+I8jQ==
X-Google-Smtp-Source: ABdhPJwiuBJmTQqLGpDYmvDHPYic0ZgEoi6rYgVI4wfGbf2gNBjdsQveeb1Vkd1Zf+XnnrI2tq0EfNUZLC0prFRPXcE=
X-Received: by 2002:a63:9d4e:: with SMTP id i75mr9792830pgd.47.1605727859348;
 Wed, 18 Nov 2020 11:30:59 -0800 (PST)
MIME-Version: 1.0
References: <CAE90CG5h0RqNs8N7qbZzajYK9A3eY0LWHqLfzX7Z-v-aef4R2g@mail.gmail.com>
 <20200105081550.GB1667342@kroah.com> <CAE90CG5MQM+8qX0F_RHmHwrh3fP1oxbtTym_tv-UhW2K3pYD-A@mail.gmail.com>
 <20201118131322.7bae7622@gandalf.local.home>
In-Reply-To: <20201118131322.7bae7622@gandalf.local.home>
From:   Evan Rudford <zocker76@gmail.com>
Date:   Wed, 18 Nov 2020 20:30:48 +0100
Message-ID: <CAE90CG4N+orfJ2PUygWk3T8LDN+mHEjRz7qhz29MsyH9DOzv3A@mail.gmail.com>
Subject: Re: Is the Linux kernel underfunded? Lack of quality and security?
To:     Steven Rostedt <rostedt@goodmis.org>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Am Mi., 18. Nov. 2020 um 19:13 Uhr schrieb Steven Rostedt <rostedt@goodmis.org>:
>
> On Wed, 18 Nov 2020 18:59:09 +0100
> Evan Rudford <zocker76@gmail.com> wrote:
>
> > This is perhaps hard to argue because the competition isn't good.
> > To be honest, I feel that neither Linux nor any other "major" OS is
> > reaching "high" security-standards.
> > It is a fallacy to think that the security-situation is good just
> > because nobody else is better.
> > And of course, rewriting Linux is nearly impossible, but I doubt that
> > Linux will ever become "truly secure" as long as everything is written
> > in C.
> > Let's face the reality: C is an excellent systems programming
> > language, but it is like an "unprotected chainsaw" with respect to
> > security.
> >
>
> I call "bull" on the above statement. This C isn't secure, is just a
> blanket statement. Yes, C has issues, and so does assembly (which there's
> plenty of that in the kernel). But with the amount of static analyzers and
> fuzz testing going on, the typical C bugs that are in most projects are
> well discovered in the Linux kernel.

I fully agree that Linux uses many fuzzers/analyzers that are not
typically used by a lot of C-projects.
However, to claim that C is still "good practice" would be an insult
against all the research on memory safety vulnerabilities over the
last decades.
We should not trash all this research just because many programmers
are more convenient with C.
In other words, I argue that we should avoid a hostile environment
where new research-results are destroyed just because some people
think that this is "not practical".
Rust and other languages were not only invented as fun side projects,
but because the knowledge of today is way better than the knowledge
back in the 1990s when Linux wrote the initial kernel.

> > > Again, citation please?  I would argue that right now we have too many
> > > people/resources working on security issues that are really really minor
> > > in the overall scheme of things.
> > > greg k-h
> >
> > I agree that the current security-efforts might not be well-directed
> > for the overall scheme of things.
> > However, I don't think that security has "too many" people in total.
> > It might be true that "minor" security-issues are eating too many
> > resources, but there are still "non-minor" security issues that are
> > not yet addressed.
>
> Funny, I find that the biggest threat to security today is coming from the
> hardware. Issues like spectre and meltdown, and everything to do with
> parallel programming is going to be the new age of cracking the system. And
> ironically, C and assembly are probably the best languages to counter it ;-)
>
> -- Steve

I believe that Spectre and Meltdown are kind of orthogonal to many
other security threats.
Yes, I fully agree that Spectre and Meltdown need to be addressed, but
I still consider arbitrary buffer overflows in parsing libraries as
more dangerous than "typical" Spectre/Meltdown threats.
