Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAC9C2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 16:36:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 552AF61400
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 16:36:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhFQQir (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 12:38:47 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:38613 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhFQQiq (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 12:38:46 -0400
Received: by mail-vs1-f46.google.com with SMTP id x8so3356012vso.5
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 09:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P3wHvkZCCq+CgodypF7rbvTYeyJsFpMK7ZMBECm/0x0=;
        b=U8Sgb6WebtfzTpyagRxsU+N5U8n6+czLNxYFGV598g+SLXt0z4QwAkp8yiKtrqqSo4
         sV2VyO3CpMg0/qEBDK28X6e66qvWiu0sBej8huXLsA07Ome+Lv5sc9cGKJ8jcnSbH1Sj
         2c4pH6GTvziE6w8tQpnccefx11UIn8oaifbuVfaQdYG/lAsOc4U3R6HDYTtOIPPJIO/E
         H29phAjemtVIvz+6udwn5Wwc3XVJppvjOEQop++lsHcvtzGnLSnT3jfVbyvjRpaG62/1
         mBLLzDdUR90UHGDwiXdJXNw+4Bjzf9Tz9b7nzYv47fKz4R9fdg/a4nj+9e8pdSXZPBKQ
         iE7w==
X-Gm-Message-State: AOAM5313gYbhmpY0T0QSqLXfDx846e1M01bBZPyxIEex7XeXLSibk/Yu
        TcsU+wplSYjsjvUS6Q/ucojsXTOeSiCO9xnNplY=
X-Google-Smtp-Source: ABdhPJwQQVOvg+x24BPxGgZOLsHIxLg43R3/g3K2T61PVNLxNkbVqbcwyn+4Fz1qPIP9gbjPkCEgQsuLwDrCXxbP/h4=
X-Received: by 2002:a67:efd6:: with SMTP id s22mr1589590vsp.3.1623947797075;
 Thu, 17 Jun 2021 09:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <YMsGoI0UdbmUebhX@infradead.org>
 <nycvar.YFH.7.76.2106171031220.18969@cbobk.fhfr.pm> <CACT4Y+YoHYCKaLdZFSLqKsMz1j72i=k12FVpmSo-OyB7rCorsw@mail.gmail.com>
 <YMsfXuykH6z0ZbpM@infradead.org> <20210617145728.nahkvtxapozccm6c@nitro.local>
 <20210617151659.GF5067@sirena.org.uk> <YMtpHPaJzMxmhslt@pendragon.ideasonboard.com>
In-Reply-To: <YMtpHPaJzMxmhslt@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jun 2021 18:36:24 +0200
Message-ID: <CAMuHMdVM+gfs1cS3i67=Gkm7sF889NwSpAQbXtfqzqGFZ5bjtQ@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Jiri Kosina <jikos@kernel.org>, users@linux.kernel.org,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Laurent,

On Thu, Jun 17, 2021 at 5:24 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Jun 17, 2021 at 04:16:59PM +0100, Mark Brown wrote:
> > On Thu, Jun 17, 2021 at 10:57:28AM -0400, Konstantin Ryabitsev wrote:
> > > On Thu, Jun 17, 2021 at 11:09:34AM +0100, Christoph Hellwig wrote:
> > > > Because I don't waste my time on the kind of crap that comes from
> > > > github.  If you build a separate webinterface that allows anyone to send
> > > > a proper series from a git tree that is all fine.  But github is toxic.
> >
> > > Won't this just end up reimplementing a lot of stuff that we already get "for
> > > free" from Github and other forges? Yes, I know Github is proprietary, but so
> > > are many SMTP gateways used to send the patch series. I don't see how what
> > > the GH bot would do is different from:
> >
> > I think part of the concern here is that people have some standard
> > expectations for how projects they work with on Github are going to
> > function so if people end up using Github to submit patches we may end
> > up with some culture and process mismatches which could cause issues.
>
> There are some features (or lack thereof) of git..b that I suspect
> actively decrease the quality of the hosted software. For instance, the
> inability to comment on the commit messages during review can play a
> role in the average low quality of those messages. Similarly, review is
> often based on changes, not on individual commits, which results in
> commits being badly split (or not split at all, it's common to see very
> large commits with a "fix stuff" commit message).

I thought so, too, until I received a first comment on an individual commit
in a github PR yesterday[1].

> Developers who have only been exposed to those platforms are very likely
> to never have learnt the importance of commit messages, and of proper
> split of changes across commits. Those are issues that are inherent to
> those platforms and that we will likely need to handle in an automated
> way (at least to some extent) or maintainers will become crazy (I know
> we already suffer from those issues with the mailing list-based
> workflow, but I believe it would get worse, not better, and some of our
> maintainers are already suffering way more than they should).

That's definitely not a problem that originated on git..b. Been like that
in the corporate world before.  Guess what happened after switching
from a more-forgiving VCS to git, and seeing

    Aborting commit due to empty commit message.

? ... Dummy commit messages, of course.

[1] https://github.com/esmil/linux/commit/f5b077c3e80d85b1c2749999c9f74491f69a6ceb#comments

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
