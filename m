Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D55AC2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 14:24:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D35B60FE5
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 14:24:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbhFQO0T (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 10:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbhFQO0T (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 10:26:19 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C89C061574
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 07:24:11 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id c14so8508544ybk.3
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 07:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EqH+hc07YJO3b5LtwgtHgcDXMqMyiNDo++/+xvKgsr4=;
        b=jjP36/j+PPTlNtYPfeWlnwABXtCkE9wxuUYrnwXhOJYh6/7gxPT8CEowveL+SGUdz7
         hwSZB1G1Nzj1HyKPJxdGN/zhubYrDaRPlA26nwjB5FLRAHxKCkvFJUqxz5Dip5q15ja2
         VaCC9UX4xWz4edPS6L4kJn2e26CD2Bh5vrzDr6H8BFSeHVhKWfxLOw/JZFkCUvi1c8xC
         7fbeCi4XKpYhBAyEDEYCq0qd7TmllsYhkb/H/t68TIDaljXtOVcDcWQfyhZWH/KbechD
         qNak1jnjgd/VsKWarpgiYqnmiWNIXQc4hDDETHCUAQcsmGkyzbp4Qv4RL6S30s94GS/e
         lH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EqH+hc07YJO3b5LtwgtHgcDXMqMyiNDo++/+xvKgsr4=;
        b=m08T6orwJuPMqIsx+10yEv/OJLhJk6SOeekYo5Oz42SumCERoWdMFXq3wGgVqPxj0L
         51Y3CWf3T7rKyleNVXQFkGcTNneWtfgE6Q3XVT3lr5jlS7KZrsrhiZ2dmQg04NjHP2Z+
         HpVghCAdf/IxWokPHe7q14WHKEFx3AI7sjNEOL8ENDRTQ9mnaflQbtwx5c0x2uQI1mru
         YXG6vO8uXB5l5qkS4gzwH8eK85Li3yykyTemkndWoQ/H9+T7Xvu1hfM5Y/w1/txuCtny
         nyxFQjQF7y3r8sd2gfIKvbft+rg0OwscsquAx4iuJ+YE1ff80MmAZycZtwlK1xwt3/BE
         3VXA==
X-Gm-Message-State: AOAM533C6y3U1rlwPakMuGRy0ZBSXGph9l0QITiWUm2H+gJYfCv0Ezwv
        ykSUDLDD15KB4Ajj88Lh7Z9xjtevwwEJ9ladwS4=
X-Google-Smtp-Source: ABdhPJzlXMfrVAwVL3YAvIMwUqoErQmrF+JJKAms71TM9oMQeerBu85+1h8YsfxyUwn9sCC8MIMOqE9EAbFPhvTyGAE=
X-Received: by 2002:a25:6c8a:: with SMTP id h132mr6551374ybc.422.1623939849446;
 Thu, 17 Jun 2021 07:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <YMsGoI0UdbmUebhX@infradead.org>
 <nycvar.YFH.7.76.2106171031220.18969@cbobk.fhfr.pm> <CACT4Y+YoHYCKaLdZFSLqKsMz1j72i=k12FVpmSo-OyB7rCorsw@mail.gmail.com>
In-Reply-To: <CACT4Y+YoHYCKaLdZFSLqKsMz1j72i=k12FVpmSo-OyB7rCorsw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 17 Jun 2021 16:23:58 +0200
Message-ID: <CANiq72kW+xsCWyhaT20a2=PUjUB59ujomaarnBrTDuYo1KEuJA@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jun 17, 2021 at 11:52 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> You don't want to accept these contributions even if you won't be able
> to tell the difference on your end? But why? This looks really
> orthogonal to a person's expertise and proficiency in software
> development. Whether that's inability to deal with email, or no desire
> to spend time on that, or just personal preferences.

Agreed -- torvalds/linux may attract a lot of spam, but the LKML also
does. Any sufficiently "famous" repo/service/ML will, after all.

> On the other hand this workflow has the potential to ensure that you
> never need to remind to run checkpatch.pl, nor spend time on writing
> code formatting comments and re-reviewing v2 because code formatting
> will be enforced, etc. So I see how this is actually beneficial for
> maintainers.

Also agreed -- it is particularly useful to teach newcomers and to
save time for maintainers having to explain things. Even if a
maintainer has a set of email templates for the usual things, it takes
time vs. not even having to read the email.

Cheers,
Miguel
