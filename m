Return-Path: <SRS0=dR0X=3K=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BE6C2D0CE
	for <workflows@archiver.kernel.org>; Tue, 21 Jan 2020 22:15:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06C2124656
	for <workflows@archiver.kernel.org>; Tue, 21 Jan 2020 22:15:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oNck0fuP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbgAUWPY (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 21 Jan 2020 17:15:24 -0500
Received: from mail-il1-f175.google.com ([209.85.166.175]:38317 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728609AbgAUWPY (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 21 Jan 2020 17:15:24 -0500
Received: by mail-il1-f175.google.com with SMTP id f5so3617046ilq.5
        for <workflows@vger.kernel.org>; Tue, 21 Jan 2020 14:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HdW4GzeyyMoPA51gjIt+u/F0340TdFwbr5AJcZ7OwwY=;
        b=oNck0fuPsV2KiOZx+WE5/R1UTXh78L2wSaa7mcKex3Bu3VHwPSP/cDaePVD08mVFJF
         o/C5+0UoyRb+c+uSYjK5AN9tHNJlPgzkYNpEZG5GYEAELU9NQ+FYI9HulF3La78lhWBB
         QAEaa/GcY0ZYwYiB1/L//5CBiXqsXjeJikiXrRfKKXZ42ZP98iXV0b3N+9rHNQqQMJLR
         WvdBEUG6sIFybuZ7aal4bRTAJH33wGDbX53vrXlYDJwZlnXrDAAYWOhEYMN7juj1LXOn
         YAXAj4U1bx5/8LL96xSMBRjL19YwAsOCdDaxEgdaGlV7cBvMfXCX+LupPWdRWvRmGAOd
         +8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HdW4GzeyyMoPA51gjIt+u/F0340TdFwbr5AJcZ7OwwY=;
        b=sxp8wIFqp86P/ILmOCCqhzfwY+5H9kiaGcCCIdWBJyU6a79/A4iRFKpOQDYsu3kDyA
         NM6e0/HKmC8At29mApw1kRF4uZUQqpOK5U1REL9PkY2mdQ7tbBwgxEQq0XN3Q9Bw/Vg8
         x+QYle1gpr8/UoMnmsDW+9vwl+spkC5qK0az9R1nVGRVVIorgpYWEh5RnelTzI2hDl8J
         cDVrCXI2gSfQzV/VGZ3S1SILL3J1iQBoev3ejL/fEHO19O4S3JZsFG7vjDodyDIYr+Hp
         TlO2RiQI20Ev1XV4iuf7ZrCjDc+nZggs8LIFRPo2GjqhwZi0h9Cp8IyUErFRXgT505Dg
         zgog==
X-Gm-Message-State: APjAAAX3wpcdcrxVqg5Kxt7LWq00wFarOO4A+7AakNQ+ewXo6mTmQaci
        1hZNF53oCQ72CaMEfowVnkyDxx8Fl7FktVWb1y/gcg==
X-Google-Smtp-Source: APXvYqyPVB7V3yGJzXWADAPPsxgoQPcyMae4QsrWIC65BUc6YA7RSroTlISjxeg9IeaVGUIx4xs7W8tpXbzoSYtiMhs=
X-Received: by 2002:a05:6e02:102c:: with SMTP id o12mr5624330ilj.165.1579644923760;
 Tue, 21 Jan 2020 14:15:23 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMy3_4vBeVS42c4AGYVNHzcP2iO0FxWN6MnncT0uc_ZKKw@mail.gmail.com>
 <CAEG3pNCgLTYrwoeA4_F9Ru-81O1dWWJ9SnnKKcWfr4nG=y2zRw@mail.gmail.com>
 <CAKXUXMwa-4mc4zNfO=mTHCyiwhNYzQFA=HocaTZF0jeCZrnZ3g@mail.gmail.com>
 <CAEG3pNAh-LJOYegvsjKqdd3ENiJLnkDgikdDQLGpctQcz+M04Q@mail.gmail.com> <CAKXUXMweFAkmi+gubcvhZQjN1bWHOghFUcpAr3_tsDk-4S0Kiw@mail.gmail.com>
In-Reply-To: <CAKXUXMweFAkmi+gubcvhZQjN1bWHOghFUcpAr3_tsDk-4S0Kiw@mail.gmail.com>
From:   Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 21 Jan 2020 14:14:57 -0800
Message-ID: <CAEG3pNB3pDM5fPAVTevFuzamJXvcgesDEuy3JinYhrEAu0z-fQ@mail.gmail.com>
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

On Fri, Jan 17, 2020 at 11:18 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Fri, Jan 17, 2020 at 9:38 PM Michael Turquette
> <mturquette@baylibre.com> wrote:
> >
> > I would be interested in learning more about the duties and
> > expectations of mentorship. Do you have a link? If it's not too much
> > work to add to my load then consider me interested.
> >
>
> The mentor GSoC guide tells you all you need to know:
>
> https://google.github.io/gsocguides/mentor/

Count me in. The project that I described would be a new solution or
utility, and commits may not go into an existing open source project.
Is that OK for GSoC? If not then I have a related project idea that
would include code contributions to an existing FOSS project on
github, but prefer the current submission as-is.

Best regards,
Mike

>
> Lukas



-- 
Michael Turquette
CEO - Los Angeles, CA
BayLibre - At the Heart of Embedded Linux
http://baylibre.com/
Schedule a meeting: https://calendly.com/mturquette
