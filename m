Return-Path: <SRS0=6D5N=3F=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00AEFC32771
	for <workflows@archiver.kernel.org>; Thu, 16 Jan 2020 00:59:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C82A824656
	for <workflows@archiver.kernel.org>; Thu, 16 Jan 2020 00:59:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="iCdBdsF8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgAPA7f (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 15 Jan 2020 19:59:35 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:47005 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgAPA7f (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 15 Jan 2020 19:59:35 -0500
Received: by mail-pf1-f194.google.com with SMTP id n9so9329988pff.13
        for <workflows@vger.kernel.org>; Wed, 15 Jan 2020 16:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=XrBNK2z9pMJCAIZ/d8llhjuICIitR7E7p/UEZexLw8M=;
        b=iCdBdsF8Cmuu7S2rNsGgCDvbk4ydxipmteYt7djdV7rBJUDDgeXIjigJq09NmgTh5q
         trm2tCAS7G5jbPDimhhTeOE9s/FnFrThyj6QXiFl9TsB/2UFv7SVKG8alBY19i3pAymb
         SvIs+zVAFBgzvrc3alZiTX//g7+4rWjjNEDo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=XrBNK2z9pMJCAIZ/d8llhjuICIitR7E7p/UEZexLw8M=;
        b=R0D1PXnBIL6hYXr5HyatRCsjFbqhV6RKv1+zrTQUumFnULBTa0kG6MfSCna5s4CuXk
         h4ULvwyidBJ3jKfYosLPgMxFXcudSAaHZjV0np9nSH9dcvu72v2t7cHyW6ps+9B+QhMJ
         I/X+TG8gzbrZlIIkss700HfoTKTiR1vjiFgZN1tZr4yLWCj6//FFi7QXYsbQhzoTR34Y
         3zhyiGqHPWTp6jxtIABd1fZs5OVrMzKvxZtd7vcZ9bPiT6NbdrD0YRY5qLLn94JuOHOw
         iAXh+MyhtRWZT9IPRn0yVHVgwJj3ed62FJcDATmRm6S44jwO7zHVk9o47GL5QYqIrLjw
         AzFA==
X-Gm-Message-State: APjAAAWrY22NAK2k6cR4ATWzJrRpl2Z3ytb3N9XaIwBuyQCND5jRRNz4
        dfc7djRiSk1FY0nNgcBaUtmJU8QRx2w=
X-Google-Smtp-Source: APXvYqwiJ3Q6K4k35nxGpw+G6Oea6G5OzXii8I+JNhhH/EcYCzqSwVvmrzBn0bOs0ipz4qhxb+F/eA==
X-Received: by 2002:a63:1b47:: with SMTP id b7mr35716206pgm.446.1579136374010;
        Wed, 15 Jan 2020 16:59:34 -0800 (PST)
Received: from localhost (2001-44b8-1113-6700-097c-7eed-afd4-cd15.static.ipv6.internode.on.net. [2001:44b8:1113:6700:97c:7eed:afd4:cd15])
        by smtp.gmail.com with ESMTPSA id a10sm22363177pgm.81.2020.01.15.16.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 16:59:33 -0800 (PST)
From:   Daniel Axtens <dja@axtens.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     workflows@vger.kernel.org,
        Till Kamppeter <till.kamppeter@gmail.com>,
        Aveek Basu <basu.aveek@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: Explore ideas on workflows improvements with Google Summer of Code mentoring program?
In-Reply-To: <CAEG3pNCgLTYrwoeA4_F9Ru-81O1dWWJ9SnnKKcWfr4nG=y2zRw@mail.gmail.com>
References: <CAKXUXMy3_4vBeVS42c4AGYVNHzcP2iO0FxWN6MnncT0uc_ZKKw@mail.gmail.com> <CAEG3pNCgLTYrwoeA4_F9Ru-81O1dWWJ9SnnKKcWfr4nG=y2zRw@mail.gmail.com>
Date:   Thu, 16 Jan 2020 11:59:29 +1100
Message-ID: <877e1skyha.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Michael Turquette <mturquette@baylibre.com> writes:

> Hi Lukas,
>
> On Tue, Jan 14, 2020 at 11:06 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>>
>> Dear all,
>>
>> Till Kamppeter and Aveek Basu organize the Google Summer of Code
>> student mentoring program in the name of the Linux Foundation. They
>> have set up a page for project ideas for the Linux Foundation's
>> participation in the linuxfoundation wiki:
>>
>> https://wiki.linuxfoundation.org/gsoc/google-summer-code-2020
>>
>> I believe many ideas discussed here on this list, e.g., extensions to
>> patchwork, public-inbox, further bots, scripts, etc., are well suited
>> to be prototyped or implemented by students in the GSoC program.
>>
>> If you agree and have some good ideas, please add your ideas to this
>> currently still empty draft page:
>>
>> https://wiki.linuxfoundation.org/gsoc/2020-gsoc-kernel-workflows
>
> I added the first entry, "Bidirectionally sync Patchwork patch status
> with Gmail labels". Stephen Boyd and I use a local solution to
> coordinate patches in the Linux Clk tree. Our solution requires
> Patchwork + the Notmuch mail indexer + Gmail/G Suite to work. My
> proposal is to remove the Notmuch requirements and teach Patchwork to
> talk directly to Gmail (and vice versa), perhaps via a solution in the
> cloud, running on a server somewhere, and not dependent on the uptime
> of my laptop.


<pw maintainer hat>
Let me know if there's anything you need in the REST API for this. We're
going to cut 2.2 Real Soon Now, which will be your last chance until 3.0
which, given our general velocity, will not be out until late 2020.

Regards,
Daniel


> From my discussions with kernel devs, I believe there is a reasonably
> sized Venn diagram of people that use both Patchwork for patch
> tracking as well as Gmail/G Suite for email. Having those two talk
> might mean that I never have to use the Patchwork web interface again,
> a big win IMO, and I can just use email.
>
> Best regards,
> Mike
>
>>
>> Ideas should be roughly described in five to six sentences, possibly
>> with a list of expectations on required knowledge a student should
>> show for its application. Within the application period later,
>> interested students have to write a much more extensive project
>> proposal as part of their application, by exchanging with the group to
>> refine the rough idea to a proper task and student project.
>>
>> Please also take into account that the deadline for the application as
>> mentoring organization is Feb 5 and after that Google will evaluate
>> the applications. So have the ideas (at least most of them, ideas can
>> be posted up to the student application deadline) in by then to raise
>> chances to get accepted and get slots for students assigned.
>>
>> If you have any questions concerning GSoC organisation, you can reach
>> out to Till, Aveek or me.
>>
>> Best regards,
>>
>> Lukas
>
>
>
> -- 
> Michael Turquette
> CEO - Los Angeles, CA
> BayLibre - At the Heart of Embedded Linux
> http://baylibre.com/
> Schedule a meeting: https://calendly.com/mturquette
