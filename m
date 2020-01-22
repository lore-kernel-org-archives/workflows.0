Return-Path: <SRS0=dGQQ=3L=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7621AC32771
	for <workflows@archiver.kernel.org>; Wed, 22 Jan 2020 22:22:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 390BD24673
	for <workflows@archiver.kernel.org>; Wed, 22 Jan 2020 22:22:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KiW4p3Hd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgAVWWi (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 22 Jan 2020 17:22:38 -0500
Received: from mail-il1-f177.google.com ([209.85.166.177]:42588 "EHLO
        mail-il1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbgAVWWh (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 22 Jan 2020 17:22:37 -0500
Received: by mail-il1-f177.google.com with SMTP id t2so634584ilq.9
        for <workflows@vger.kernel.org>; Wed, 22 Jan 2020 14:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Otga2RQzOqZCgG1DrT3OBus/EF+H9q1uOa6YtWfR9w0=;
        b=KiW4p3HdLRrLpDnIZVSAOxwUZgUhRLadlIaIm36X51XJk/4MYKuj4hr37VVXTmb0A+
         Iq4GPfkMUD0Qtnh3O/4L2SkVrZsH6pWkTnqbdbTV3VEfn7NISZKS1Wz4PDDvvvCpGp8L
         YO+TDrdy69pyRpQfgz4CzipN28+fTz+lE12S1YMVXGOSSo0mPSbIlITCvAcdUI7zdSQh
         lDbywi6+l9Dfp3vrme18aCxsCWuxjdvXkFrTKQhVj+xB6doHTdL3zEeacA2//C9L8LZK
         cMvM5xbdv/sHWTUkaAqIbnn9FE4Raml+YxmDH3zn2heKgj7ZTVLIoUruq5SOq7vy9WvS
         KYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Otga2RQzOqZCgG1DrT3OBus/EF+H9q1uOa6YtWfR9w0=;
        b=I/hPC1QDRS3bDcOU+9RzNvbHVup+64oE3fRNgQYIMMZQz7N0rIBuTf3d6DHmCbtcT4
         HHbb8hqcIdxdBhmAj4tIji18hnAcMaqNJSZWctrbbilBCr1LZSZ2Be85+6qSMdT94vIW
         T5oCumCxGPKVlzCzh6HY8FyBMq/ajAkMv7EApeXHUnILkz2RKO2JxsuuF8197xCap+Se
         5UznYUS/IG3O0mu883CnCLkpF9ugVkQkp9qpCqCSMdW1OgO8Dg6LICYFgSiaDlDiB/Za
         YmYp8RAK0k96pCFPavfJ01DzWg5xNqAJHoKvbU7XONtX+gfOuosKMAzmVFeRcN5fMujk
         NVdg==
X-Gm-Message-State: APjAAAUHhUKbU2deHhNBNzU8JjUD+tN8wsksCMPJmPs/rMBvStK9ETya
        jU2pSi+DfU+f3I9au/9OjzNNeY0KfvmEFD7zdpcGpg==
X-Google-Smtp-Source: APXvYqyaAvm8sEtN4QXaZUj6QSwJlG+AVo4+ds3nDo+6IoOkigHiwz2k4958zcEYDyL/MKsS6dsgb9x0z2LwQUg3BL0=
X-Received: by 2002:a92:8851:: with SMTP id h78mr9824185ild.308.1579731757052;
 Wed, 22 Jan 2020 14:22:37 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMy3_4vBeVS42c4AGYVNHzcP2iO0FxWN6MnncT0uc_ZKKw@mail.gmail.com>
 <CAEG3pNCgLTYrwoeA4_F9Ru-81O1dWWJ9SnnKKcWfr4nG=y2zRw@mail.gmail.com>
 <CAKXUXMwa-4mc4zNfO=mTHCyiwhNYzQFA=HocaTZF0jeCZrnZ3g@mail.gmail.com>
 <CAEG3pNAh-LJOYegvsjKqdd3ENiJLnkDgikdDQLGpctQcz+M04Q@mail.gmail.com>
 <CAKXUXMweFAkmi+gubcvhZQjN1bWHOghFUcpAr3_tsDk-4S0Kiw@mail.gmail.com>
 <CAEG3pNB3pDM5fPAVTevFuzamJXvcgesDEuy3JinYhrEAu0z-fQ@mail.gmail.com> <CAKXUXMyR0pk7WUBY3wqgFkNrwTMBX6+diUPeCaOHo=AWCfJvFA@mail.gmail.com>
In-Reply-To: <CAKXUXMyR0pk7WUBY3wqgFkNrwTMBX6+diUPeCaOHo=AWCfJvFA@mail.gmail.com>
From:   Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 22 Jan 2020 14:22:10 -0800
Message-ID: <CAEG3pNBvpT3VZxVr1TG7kf9qpTD-rWGu3qsLBLDKM0D5zBs1eQ@mail.gmail.com>
Subject: Re: Explore ideas on workflows improvements with Google Summer of
 Code mentoring program?
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     workflows@vger.kernel.org,
        Till Kamppeter <till.kamppeter@gmail.com>,
        Aveek Basu <basu.aveek@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Jan 21, 2020 at 10:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Tue, Jan 21, 2020 at 11:15 PM Michael Turquette
> <mturquette@baylibre.com> wrote:
> >
> > On Fri, Jan 17, 2020 at 11:18 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > >
> > > On Fri, Jan 17, 2020 at 9:38 PM Michael Turquette
> > > <mturquette@baylibre.com> wrote:
> > > >
> > > > I would be interested in learning more about the duties and
> > > > expectations of mentorship. Do you have a link? If it's not too much
> > > > work to add to my load then consider me interested.
> > > >
> > >
> > > The mentor GSoC guide tells you all you need to know:
> > >
> > > https://google.github.io/gsocguides/mentor/
> >
> > Count me in. The project that I described would be a new solution or
> > utility, and commits may not go into an existing open source project.
> > Is that OK for GSoC? If not then I have a related project idea that
> > would include code contributions to an existing FOSS project on
> > github, but prefer the current submission as-is.
> >
>
> Great!
>
> I have not check the Terms in full depth here:
> https://summerofcode.withgoogle.com/terms/org
> and IANAL.
>
> As I see it:
>
> - Mentor organizations must run an active open source or free software project.
> - Have produced and released software under an OSI approved license.
>
> (https://summerofcode.withgoogle.com/get-started/) is all covered.
>
> Important aspects for GSoC are:
>
> - there is a larger community for the student to announce his work,
> reach out to and impact: in this case, Linux kernel community, kernel
> workflows group, patchwork project team; we are well covered here.
> - it is published under an open-source license, that is clear how to cover here.
> - it becomes at some point a part of the larger software project. I
> would suggest that the work is in the end documented with pointers to
> sources etc. in the kernel maintainer handbook, i.e.,
> https://www.kernel.org/doc/html/latest/maintainer/index.html, with a
> suitable section on the topic. That gives a maintainer (that has time
> to read the kernel documentation) a fair chance of finding out about
> this tool.

Agreed on all points.

Best,
Mike

>
>
> Best regards,
>
> Lukas
>
>
> Lukas



-- 
Michael Turquette
CEO - Los Angeles, CA
BayLibre - At the Heart of Embedded Linux
http://baylibre.com/
Schedule a meeting: https://calendly.com/mturquette
