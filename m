Return-Path: <SRS0=X7UR=3E=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64D6C32771
	for <workflows@archiver.kernel.org>; Wed, 15 Jan 2020 22:07:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80B652465A
	for <workflows@archiver.kernel.org>; Wed, 15 Jan 2020 22:07:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mTqTWox/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729142AbgAOWHw (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 15 Jan 2020 17:07:52 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:46378 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729016AbgAOWHw (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 15 Jan 2020 17:07:52 -0500
Received: by mail-il1-f194.google.com with SMTP id t17so16253915ilm.13
        for <workflows@vger.kernel.org>; Wed, 15 Jan 2020 14:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bIji/Y5pfrGVpaLkXmgOhife83YF9jQNWMIxsBW3VrU=;
        b=mTqTWox/QhvCejsjZlkLJMU4JKU0TYC0xK5fhr3fQtWnj8KC40dte5X8MRKeMtF4WU
         vhLR6KqUZSwbbgo2HAqv4bc4bhFCmf6EvUeM2RL0AlSw+urN93guTlDyHOkBmEaABE5a
         NSgqzOzK6l0xbgLWVOKMAaDc+337qsFNum+ypFeC3TuaAUqPJM5pzLvWAW6yWg02Gnnr
         XMskTaLRcbfyoSmxDsMuwEOV7ELeRTw+T8SV9TkZuZ7fmwMsRhwfEQTTpTYrbOlQ41rR
         uHE8EPMNkxmnkrbz9dwvg9wZL5/0TbW7krFcIYvWMe8zKCiJTSSNKPZXQypzvyS4oYqU
         jhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bIji/Y5pfrGVpaLkXmgOhife83YF9jQNWMIxsBW3VrU=;
        b=ImLJLjzPio4bXLLkWrH5TFZ0ELgq6T7xjEReM1jlttYhzXDQiApwbqypKbF+4m+5vA
         BTaS+QrJW584loXxaxNK+APEeHf7A5rNZQt9VfXW6vBa1lP0RjmbrSN6gAeWjSScRVgu
         sN0hd7/3ZKK3yBwfh6mPVCDaaTg68qOWsiV69IUndQEsGtb84xtLKvx0X8G5aoibEwAS
         Gw9HZ1d+5MNcutmKEzLyeuA/2yVZMU7tqHY5wLXWpCUsXvWD+3I1rq0mkpLzzYVirW5r
         5dqPJXcqLuRSZrdw7m0KQEC3BR4AkrQ9MrfKiTL/Ao4i6wNkZBYeW9PIKidTvOrsDkw+
         QHPA==
X-Gm-Message-State: APjAAAWo7egdPHrdbTdUl7Q/UFU0nmpe5TXhJ6rYgXjp7DTkLcOrDxjh
        Wtl/aWr+8Y1UWFJoxwtok49bolEF8N71BzemHQ6cqg==
X-Google-Smtp-Source: APXvYqyCon8xFu2xNthc5zDbTdXuA7w4zbYRNQRNV6lApQykAM794mp6Gw852yU9kzzCBQ55y7ZlZ9RdnSMtvCEaAdA=
X-Received: by 2002:a92:8851:: with SMTP id h78mr673541ild.308.1579126071223;
 Wed, 15 Jan 2020 14:07:51 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMy3_4vBeVS42c4AGYVNHzcP2iO0FxWN6MnncT0uc_ZKKw@mail.gmail.com>
In-Reply-To: <CAKXUXMy3_4vBeVS42c4AGYVNHzcP2iO0FxWN6MnncT0uc_ZKKw@mail.gmail.com>
From:   Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 15 Jan 2020 14:07:24 -0800
Message-ID: <CAEG3pNCgLTYrwoeA4_F9Ru-81O1dWWJ9SnnKKcWfr4nG=y2zRw@mail.gmail.com>
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

Hi Lukas,

On Tue, Jan 14, 2020 at 11:06 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Dear all,
>
> Till Kamppeter and Aveek Basu organize the Google Summer of Code
> student mentoring program in the name of the Linux Foundation. They
> have set up a page for project ideas for the Linux Foundation's
> participation in the linuxfoundation wiki:
>
> https://wiki.linuxfoundation.org/gsoc/google-summer-code-2020
>
> I believe many ideas discussed here on this list, e.g., extensions to
> patchwork, public-inbox, further bots, scripts, etc., are well suited
> to be prototyped or implemented by students in the GSoC program.
>
> If you agree and have some good ideas, please add your ideas to this
> currently still empty draft page:
>
> https://wiki.linuxfoundation.org/gsoc/2020-gsoc-kernel-workflows

I added the first entry, "Bidirectionally sync Patchwork patch status
with Gmail labels". Stephen Boyd and I use a local solution to
coordinate patches in the Linux Clk tree. Our solution requires
Patchwork + the Notmuch mail indexer + Gmail/G Suite to work. My
proposal is to remove the Notmuch requirements and teach Patchwork to
talk directly to Gmail (and vice versa), perhaps via a solution in the
cloud, running on a server somewhere, and not dependent on the uptime
of my laptop.

From my discussions with kernel devs, I believe there is a reasonably
sized Venn diagram of people that use both Patchwork for patch
tracking as well as Gmail/G Suite for email. Having those two talk
might mean that I never have to use the Patchwork web interface again,
a big win IMO, and I can just use email.

Best regards,
Mike

>
> Ideas should be roughly described in five to six sentences, possibly
> with a list of expectations on required knowledge a student should
> show for its application. Within the application period later,
> interested students have to write a much more extensive project
> proposal as part of their application, by exchanging with the group to
> refine the rough idea to a proper task and student project.
>
> Please also take into account that the deadline for the application as
> mentoring organization is Feb 5 and after that Google will evaluate
> the applications. So have the ideas (at least most of them, ideas can
> be posted up to the student application deadline) in by then to raise
> chances to get accepted and get slots for students assigned.
>
> If you have any questions concerning GSoC organisation, you can reach
> out to Till, Aveek or me.
>
> Best regards,
>
> Lukas



-- 
Michael Turquette
CEO - Los Angeles, CA
BayLibre - At the Heart of Embedded Linux
http://baylibre.com/
Schedule a meeting: https://calendly.com/mturquette
