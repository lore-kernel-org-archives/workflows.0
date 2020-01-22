Return-Path: <SRS0=dGQQ=3L=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF49C32771
	for <workflows@archiver.kernel.org>; Wed, 22 Jan 2020 06:19:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A019824655
	for <workflows@archiver.kernel.org>; Wed, 22 Jan 2020 06:19:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJvdFCKI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgAVGTE (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 22 Jan 2020 01:19:04 -0500
Received: from mail-il1-f180.google.com ([209.85.166.180]:43163 "EHLO
        mail-il1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgAVGTE (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 22 Jan 2020 01:19:04 -0500
Received: by mail-il1-f180.google.com with SMTP id v69so4313416ili.10
        for <workflows@vger.kernel.org>; Tue, 21 Jan 2020 22:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CHsZqhVvo/IqtKB8cMlbO6xwj4sn7xxTDf0PAZo5Q14=;
        b=NJvdFCKI8dfvZu6yLR3hgPaLy7yE1eGEHQbTYBNdY4owiUyL9KN4poy0PEQYulD9eg
         t1Ag9lC3uL3+dpJrLlDtgHxQKL4YDylqYIeLuaEHOZbS/8jTIdFr7ejs3p8J6iZ9k8w2
         AHGzalmfECAn5vNBg7KjjKycwbT2QLcoihnAmFbsSHZPV98CnGyznFdg3zFX1ENiZ0oV
         eKDzJaq2OjHEvadJMepXwVpCG1AQ+3/2SvTnQmUfjBWGoIbA6KazjjY8NjPcJrGu+Uot
         oeWew+UuYVCV3EeJ/uRkqV2suPvp77DB5vH/ikP8QbN5pNQUP1o46LxyFMaBSLzDz8gX
         ih/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CHsZqhVvo/IqtKB8cMlbO6xwj4sn7xxTDf0PAZo5Q14=;
        b=iT7unxRFGzvcuOxDOD1SMRGg/EF8eyGoCboA3htyX1FLK+0m6cjDAwXFLJI0cvYNGt
         pcdxLxswrzibHn4cRVA9qxBESzSnEzoQd5nvtX0B/XtcQrSHaOySusRJwjp4xYhZJnOU
         GVwf2a7rE8ujh0S78i8h+RCeHJhJwBVHRmoS9oqg15wIGJ2sNFmgE0Dy4sop93dnjE7v
         WhSRC57IqX3Lmt530kw/hA/Fg1wn9cY2n+KA8hDxJVnECn5C38UD2oL1t9qV1Fgk1MOM
         ZpOsgb7RHFJyxAf+c8Ov+PH55M3wYNOee9+gllJx+CTQNCYsQ0/iyIfS8tLdskoeIBCu
         ltIg==
X-Gm-Message-State: APjAAAWCBjBGq4tmgX/xWpALFaYKi6aNpNJZaoqgXdojktCsx8EB7zoT
        Q7EzH5/91ME9tEg8FU2A7i3/RKQz/iRCYzQBdmO/WUJC
X-Google-Smtp-Source: APXvYqy93Aj2MzztB06BQC9PYmBjwU0z9rlJFvjSKAIdQi1H1vi4lvnhdI6zWuR0YtQKfh53zePs0HxB8vJiYrqghAI=
X-Received: by 2002:a92:145:: with SMTP id 66mr6577023ilb.147.1579673943337;
 Tue, 21 Jan 2020 22:19:03 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMy3_4vBeVS42c4AGYVNHzcP2iO0FxWN6MnncT0uc_ZKKw@mail.gmail.com>
 <CAEG3pNCgLTYrwoeA4_F9Ru-81O1dWWJ9SnnKKcWfr4nG=y2zRw@mail.gmail.com>
 <CAKXUXMwa-4mc4zNfO=mTHCyiwhNYzQFA=HocaTZF0jeCZrnZ3g@mail.gmail.com>
 <CAEG3pNAh-LJOYegvsjKqdd3ENiJLnkDgikdDQLGpctQcz+M04Q@mail.gmail.com>
 <CAKXUXMweFAkmi+gubcvhZQjN1bWHOghFUcpAr3_tsDk-4S0Kiw@mail.gmail.com> <CAEG3pNB3pDM5fPAVTevFuzamJXvcgesDEuy3JinYhrEAu0z-fQ@mail.gmail.com>
In-Reply-To: <CAEG3pNB3pDM5fPAVTevFuzamJXvcgesDEuy3JinYhrEAu0z-fQ@mail.gmail.com>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Wed, 22 Jan 2020 07:18:52 +0100
Message-ID: <CAKXUXMyR0pk7WUBY3wqgFkNrwTMBX6+diUPeCaOHo=AWCfJvFA@mail.gmail.com>
Subject: Re: Explore ideas on workflows improvements with Google Summer of
 Code mentoring program?
To:     Michael Turquette <mturquette@baylibre.com>
Cc:     workflows@vger.kernel.org,
        Till Kamppeter <till.kamppeter@gmail.com>,
        Aveek Basu <basu.aveek@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Jan 21, 2020 at 11:15 PM Michael Turquette
<mturquette@baylibre.com> wrote:
>
> On Fri, Jan 17, 2020 at 11:18 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > On Fri, Jan 17, 2020 at 9:38 PM Michael Turquette
> > <mturquette@baylibre.com> wrote:
> > >
> > > I would be interested in learning more about the duties and
> > > expectations of mentorship. Do you have a link? If it's not too much
> > > work to add to my load then consider me interested.
> > >
> >
> > The mentor GSoC guide tells you all you need to know:
> >
> > https://google.github.io/gsocguides/mentor/
>
> Count me in. The project that I described would be a new solution or
> utility, and commits may not go into an existing open source project.
> Is that OK for GSoC? If not then I have a related project idea that
> would include code contributions to an existing FOSS project on
> github, but prefer the current submission as-is.
>

Great!

I have not check the Terms in full depth here:
https://summerofcode.withgoogle.com/terms/org
and IANAL.

As I see it:

- Mentor organizations must run an active open source or free software project.
- Have produced and released software under an OSI approved license.

(https://summerofcode.withgoogle.com/get-started/) is all covered.

Important aspects for GSoC are:

- there is a larger community for the student to announce his work,
reach out to and impact: in this case, Linux kernel community, kernel
workflows group, patchwork project team; we are well covered here.
- it is published under an open-source license, that is clear how to cover here.
- it becomes at some point a part of the larger software project. I
would suggest that the work is in the end documented with pointers to
sources etc. in the kernel maintainer handbook, i.e.,
https://www.kernel.org/doc/html/latest/maintainer/index.html, with a
suitable section on the topic. That gives a maintainer (that has time
to read the kernel documentation) a fair chance of finding out about
this tool.


Best regards,

Lukas


Lukas
