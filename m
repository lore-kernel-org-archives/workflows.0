Return-Path: <SRS0=lg0B=3G=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAADC33CB3
	for <workflows@archiver.kernel.org>; Fri, 17 Jan 2020 20:25:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B3B1720748
	for <workflows@archiver.kernel.org>; Fri, 17 Jan 2020 20:25:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOcEA5Jo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729764AbgAQUZh (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 17 Jan 2020 15:25:37 -0500
Received: from mail-io1-f42.google.com ([209.85.166.42]:37907 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727519AbgAQUZg (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 17 Jan 2020 15:25:36 -0500
Received: by mail-io1-f42.google.com with SMTP id i7so18967228ioo.5
        for <workflows@vger.kernel.org>; Fri, 17 Jan 2020 12:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wm6NE4ZCEnUaoc2RCrX+C140jAmmn8lHTH8JgwC6+iU=;
        b=nOcEA5JohthNSoWoTSPJhTMaY9XKD8jq+JPZv5/UsCipv6UtearxZyQndmRsw1NlIG
         SAoJlWuvQqwGoVKntEpY8HfjJmXIXQLwV+hHysmb+UenpE1aLaD6w/SKZWFhwnGg9Pbg
         SGBXhD4DNrtolyKEoZCllzVHljlIbVpnpLsh4ESBaC4uM+8L9DLdwaXJPGVdbGa7tQGm
         sfv87tt9XSvie4VFGlhQSJ/tRLmfVUIKDR5CLiO9XRxESHgy9JVEODIcxqlOJI/Q+F3Z
         UHcuCDDvaAqclhIfeZNOoCts2G04ZvqRQEQw4+FTSNxJAGuPOpSBlr8gdXb1NpZ7uFeH
         Y4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wm6NE4ZCEnUaoc2RCrX+C140jAmmn8lHTH8JgwC6+iU=;
        b=U2wQ3N/c2ljuMGAiJt1DZkKV4+e1pjLMpUKkIgtHW3aHs/n4tK33+AdnNE8IQmn3Uz
         65a3WeKComUY4iut/TAXxfUIhuP7GofSO7gC/GS7R/KgoWnYpjaEiG8DhoRDyTIk59kj
         dn3I/Kmka58aXDlQpbCIDW/KnDiaG/G/2qf2ADVBqLZVJLOfg62qdQ6WpC504HeZf/st
         /mqzkq4JLq7V25Q7R+lmMUv8Z8CA3P5BYLPlJrHm2WcjMn5r5szHYSau7UnECJT8xqYT
         OKat4HxLAJZcuGIJ8u1BZLDv/ZQ+NkmeH8usAwNb1rK+W/5/a9M1DF3o+oT/DfYYze2e
         aZ+g==
X-Gm-Message-State: APjAAAUs16diT25/jDyZ3xmbwsCEuN5I6JmFstxDGJmAL62b0MarblXw
        aiaZp8ObvLbE+NHXRoBphUybWnX2TKh7wBVuuyQ=
X-Google-Smtp-Source: APXvYqxwMT8uJlvjj/wraoTyhZVChoxboGzJVqRE3CWWx/QUuPo1LRV6g3+qnOdZeZnYKwmKd78056L3Pg43wHqaTDQ=
X-Received: by 2002:a5e:cb4c:: with SMTP id h12mr24350470iok.251.1579292735605;
 Fri, 17 Jan 2020 12:25:35 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMy3_4vBeVS42c4AGYVNHzcP2iO0FxWN6MnncT0uc_ZKKw@mail.gmail.com>
 <CAEG3pNCgLTYrwoeA4_F9Ru-81O1dWWJ9SnnKKcWfr4nG=y2zRw@mail.gmail.com>
In-Reply-To: <CAEG3pNCgLTYrwoeA4_F9Ru-81O1dWWJ9SnnKKcWfr4nG=y2zRw@mail.gmail.com>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Fri, 17 Jan 2020 21:25:24 +0100
Message-ID: <CAKXUXMwa-4mc4zNfO=mTHCyiwhNYzQFA=HocaTZF0jeCZrnZ3g@mail.gmail.com>
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

On Wed, Jan 15, 2020 at 11:07 PM Michael Turquette
<mturquette@baylibre.com> wrote:
>
> I added the first entry, "Bidirectionally sync Patchwork patch status
> with Gmail labels". Stephen Boyd and I use a local solution to
> coordinate patches in the Linux Clk tree. Our solution requires
> Patchwork + the Notmuch mail indexer + Gmail/G Suite to work. My
> proposal is to remove the Notmuch requirements and teach Patchwork to
> talk directly to Gmail (and vice versa), perhaps via a solution in the
> cloud, running on a server somewhere, and not dependent on the uptime
> of my laptop.
>
> From my discussions with kernel devs, I believe there is a reasonably
> sized Venn diagram of people that use both Patchwork for patch
> tracking as well as Gmail/G Suite for email. Having those two talk
> might mean that I never have to use the Patchwork web interface again,
> a big win IMO, and I can just use email.
>

Michael, thanks for this first proposal. Would you also be interested
in mentoring this project idea or should we ask and look for potential
mentors for this project?

Of course, more proposals are welcome :)


Lukas
