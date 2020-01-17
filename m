Return-Path: <SRS0=lg0B=3G=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25417C33CAF
	for <workflows@archiver.kernel.org>; Fri, 17 Jan 2020 02:19:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2AFB20748
	for <workflows@archiver.kernel.org>; Fri, 17 Jan 2020 02:19:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="MgFg20+P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbgAQCTI (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 16 Jan 2020 21:19:08 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41450 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729730AbgAQCTI (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 16 Jan 2020 21:19:08 -0500
Received: by mail-pf1-f194.google.com with SMTP id w62so11184711pfw.8
        for <workflows@vger.kernel.org>; Thu, 16 Jan 2020 18:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=fQRc5PKaij2lzETpbimTVRrkRSxGgmhKc2Tt+6D5Xus=;
        b=MgFg20+Px2hwtjXkLOAeEMV8xTv8MRmbt+VSWng70qvmW52eEJdAznLpPM3gs36EUp
         MJ/PKBShXEamjwFeesRy3+mc0dsX6biXfDQLSy+tMN0/etITAP5YFSCvy0/kCU+rexBD
         3pj+7R7qjrk8pNTrwwlW6ZN/Wk1vq9UQxwoio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=fQRc5PKaij2lzETpbimTVRrkRSxGgmhKc2Tt+6D5Xus=;
        b=GcVYtjv3nVtUCZ6kpZf5zo0p/HD7FMWThbwCG1y6IKyNQcKnzqd7eMqhhuRwdPlZvs
         RIr9OxXBVMtX8z2oT1CHpRMH3lKaFyXD+7UzvEmoKPTzs4hDm9nSs6eKai9T7TGn06aG
         YadINcUYrsf5LuysY1U+8in2bfnR8LxQk6EIK1SbpPOD98D+f7CyyQjs7tGNwr/PJj7e
         vUvxmlW29e1Zmmv6mYt0bHFbSRTPHRTSAEyAuJMXLYz0m8IopJ4pE2amOGgjLWt9uZoY
         za3QwYVziTewOK6JoYouP3EutV2CfIaA5ALeVq3Q0EK9exQd0aPNqwUQzpyf4yRD42Jh
         9weg==
X-Gm-Message-State: APjAAAUu9zSjDM6Eg9zkbiq9gCR9jQSU1xLCQu6lpnbq6HP/l6fp6lx5
        Uy2FC3ZvmVINUC0cjCzlnUkpaA==
X-Google-Smtp-Source: APXvYqxWvGoGXFTV7PYhRAMTlC7eFOl6KJ765TlfxXz5AnCiErLqFshDhXsd1tfcvuiswU+YbMu01Q==
X-Received: by 2002:a62:1857:: with SMTP id 84mr604074pfy.257.1579227547077;
        Thu, 16 Jan 2020 18:19:07 -0800 (PST)
Received: from localhost ([2001:44b8:802:1120:c027:a666:45b5:e5e8])
        by smtp.gmail.com with ESMTPSA id b1sm16932966pfp.44.2020.01.16.18.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 18:19:06 -0800 (PST)
From:   Daniel Axtens <dja@axtens.net>
To:     Michael Turquette <mturquette@baylibre.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>, workflows@vger.kernel.org,
        Till Kamppeter <till.kamppeter@gmail.com>,
        Aveek Basu <basu.aveek@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, stewart@flamingspork.com
Subject: Re: Explore ideas on workflows improvements with Google Summer of Code mentoring program?
In-Reply-To: <CAEG3pNAg2yBk5o3qUv6gsbB6hx=nJ4ygohNe4R0CjRvaAha04w@mail.gmail.com>
References: <CAKXUXMy3_4vBeVS42c4AGYVNHzcP2iO0FxWN6MnncT0uc_ZKKw@mail.gmail.com> <CAEG3pNCgLTYrwoeA4_F9Ru-81O1dWWJ9SnnKKcWfr4nG=y2zRw@mail.gmail.com> <877e1skyha.fsf@dja-thinkpad.axtens.net> <CAEG3pNAg2yBk5o3qUv6gsbB6hx=nJ4ygohNe4R0CjRvaAha04w@mail.gmail.com>
Date:   Fri, 17 Jan 2020 13:19:03 +1100
Message-ID: <87wo9qkep4.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Michael Turquette <mturquette@baylibre.com> writes:

> On Wed, Jan 15, 2020 at 4:59 PM Daniel Axtens <dja@axtens.net> wrote:
>>
>> Michael Turquette <mturquette@baylibre.com> writes:
>>
>> > Hi Lukas,
>> >
>> > On Tue, Jan 14, 2020 at 11:06 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>> >>
>> >> Dear all,
>> >>
>> >> Till Kamppeter and Aveek Basu organize the Google Summer of Code
>> >> student mentoring program in the name of the Linux Foundation. They
>> >> have set up a page for project ideas for the Linux Foundation's
>> >> participation in the linuxfoundation wiki:
>> >>
>> >> https://wiki.linuxfoundation.org/gsoc/google-summer-code-2020
>> >>
>> >> I believe many ideas discussed here on this list, e.g., extensions to
>> >> patchwork, public-inbox, further bots, scripts, etc., are well suited
>> >> to be prototyped or implemented by students in the GSoC program.
>> >>
>> >> If you agree and have some good ideas, please add your ideas to this
>> >> currently still empty draft page:
>> >>
>> >> https://wiki.linuxfoundation.org/gsoc/2020-gsoc-kernel-workflows
>> >
>> > I added the first entry, "Bidirectionally sync Patchwork patch status
>> > with Gmail labels". Stephen Boyd and I use a local solution to
>> > coordinate patches in the Linux Clk tree. Our solution requires
>> > Patchwork + the Notmuch mail indexer + Gmail/G Suite to work. My
>> > proposal is to remove the Notmuch requirements and teach Patchwork to
>> > talk directly to Gmail (and vice versa), perhaps via a solution in the
>> > cloud, running on a server somewhere, and not dependent on the uptime
>> > of my laptop.
>>
>>
>> <pw maintainer hat>
>> Let me know if there's anything you need in the REST API for this. We're
>> going to cut 2.2 Real Soon Now, which will be your last chance until 3.0
>> which, given our general velocity, will not be out until late 2020.
>
> Thanks for the support Daniel. The current solution that I use is
> based on the pwclient tool, and I have no idea if that uses the REST
> api under the hood or not. If this project gets picked up by students
> in GSoC then hopefully they can provide feedback to you on any API
> enhancements.

Ironically the pwclient tool is one of the last users of the old XMLRPC
API, but we're hoping to convert it eventually.

>
> I do have a working setup on gitlab that I can share, but again this
> assumes Notmuch is part of the toolchain.
>

No stress at the moment, I'll get in touch if I need more info.

Stewart Smith also had a similar setup:
https://www.flamingspork.com/blog/2018/08/22/pwnm-sync-synchronizing-patchwork-and-notmuch/

Regards,
Daniel

> Best,
> Mike
>
>>
>> Regards,
>> Daniel
>>
>>
>> > From my discussions with kernel devs, I believe there is a reasonably
>> > sized Venn diagram of people that use both Patchwork for patch
>> > tracking as well as Gmail/G Suite for email. Having those two talk
>> > might mean that I never have to use the Patchwork web interface again,
>> > a big win IMO, and I can just use email.
>> >
>> > Best regards,
>> > Mike
>> >
>> >>
>> >> Ideas should be roughly described in five to six sentences, possibly
>> >> with a list of expectations on required knowledge a student should
>> >> show for its application. Within the application period later,
>> >> interested students have to write a much more extensive project
>> >> proposal as part of their application, by exchanging with the group to
>> >> refine the rough idea to a proper task and student project.
>> >>
>> >> Please also take into account that the deadline for the application as
>> >> mentoring organization is Feb 5 and after that Google will evaluate
>> >> the applications. So have the ideas (at least most of them, ideas can
>> >> be posted up to the student application deadline) in by then to raise
>> >> chances to get accepted and get slots for students assigned.
>> >>
>> >> If you have any questions concerning GSoC organisation, you can reach
>> >> out to Till, Aveek or me.
>> >>
>> >> Best regards,
>> >>
>> >> Lukas
>> >
>> >
>> >
>> > --
>> > Michael Turquette
>> > CEO - Los Angeles, CA
>> > BayLibre - At the Heart of Embedded Linux
>> > http://baylibre.com/
>> > Schedule a meeting: https://calendly.com/mturquette
>
>
>
> -- 
> Michael Turquette
> CEO - Los Angeles, CA
> BayLibre - At the Heart of Embedded Linux
> http://baylibre.com/
> Schedule a meeting: https://calendly.com/mturquette
