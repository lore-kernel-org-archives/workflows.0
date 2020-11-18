Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD99C3E8C5
	for <workflows@archiver.kernel.org>; Wed, 18 Nov 2020 17:59:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4722E221F8
	for <workflows@archiver.kernel.org>; Wed, 18 Nov 2020 17:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkpIk3FX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgKRR7W (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 18 Nov 2020 12:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgKRR7V (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 18 Nov 2020 12:59:21 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44DBC0613D4
        for <workflows@vger.kernel.org>; Wed, 18 Nov 2020 09:59:20 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id l11so1420314plt.1
        for <workflows@vger.kernel.org>; Wed, 18 Nov 2020 09:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=ok3+0Y0T2Dz7Q9lweMO782L+adfnQJlFCSXdNPikMus=;
        b=mkpIk3FX98Ma6SwC7F7oS3LJuG8Vy8IxKWQvXYpPsX0UYeLbEIFWbhm/br/MlwPeea
         S0CpVZsiIdWIqp+tEsfvYMsLr3miccZFZF5k4sROaZj7gTeTADi53GS8ZzqEWmSH6xfu
         LmNtRTnn65YFt6tJ95gAgfG1rftQq1YnE8aOAH7dfabvgcxJBbirWfDM9o+zTBxGSHI6
         4cN85eP1mHJcUXvL2WxzE+CXoepu8Whb53eVS8xW3QAXxqfMi/LZOR0y8bc5I+AJKg6D
         Ru0T2SLYxjH+rNFgyx4LsIyryknCFjECrnwidkmHoJGVmrft/0NNhDsD1ZavwK91sSUs
         4WpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=ok3+0Y0T2Dz7Q9lweMO782L+adfnQJlFCSXdNPikMus=;
        b=JInHo4jP93HDCg7w0QH+sIIXR3CVqgVktAegqHnLhbpjI286eoc7/Ebat3aT2ueQCd
         6nJ+9niBYZ0x/l8dwQ+3KU4e+ecu1Sm9e06yVslAOTVsi80/bP5N9cKPdYzzd8ExJHUH
         EDXyzn+ar6LYEjDU1sVbNdxu5lKUvyMP/3H0MA5kiWrwQ4S+EfAbg0zYPw3wEm8E0JsB
         rorZMwsozfzDmYDCE8b79mcYl+3kxBZxx5yu2dbOi8Rk1dfs5Elw0Kxq6VCI36MB2VG0
         oXbSsa7+J4tmr2e3TNSFWvuO2R3SXWxPaE3xa17Hti/SF/R3HMFtnjmVoax5/hze8Khh
         BJUQ==
X-Gm-Message-State: AOAM5338vzNbU3HZx0LiB2hg1Hdqv2cqhRWP9XX9PX+408bCTP1mC/Sh
        28JQsDHpYUhH9dTco2PmP1adtGamYcsh5IrG/OWggF27xw==
X-Google-Smtp-Source: ABdhPJwYzERcX5otomcXL51IpuwYF+aRAuvTNveOgA8AFz3x35jY+wgoEjc8nrDVJFzFJM6lxWn5kWiPvBNetmAaoTQ=
X-Received: by 2002:a17:90a:1b84:: with SMTP id w4mr223219pjc.15.1605722360538;
 Wed, 18 Nov 2020 09:59:20 -0800 (PST)
MIME-Version: 1.0
References: <CAE90CG5h0RqNs8N7qbZzajYK9A3eY0LWHqLfzX7Z-v-aef4R2g@mail.gmail.com>
 <20200105081550.GB1667342@kroah.com>
In-Reply-To: <20200105081550.GB1667342@kroah.com>
From:   Evan Rudford <zocker76@gmail.com>
Date:   Wed, 18 Nov 2020 18:59:09 +0100
Message-ID: <CAE90CG5MQM+8qX0F_RHmHwrh3fP1oxbtTym_tv-UhW2K3pYD-A@mail.gmail.com>
Subject: Re: Is the Linux kernel underfunded? Lack of quality and security?
To:     Greg KH <greg@kroah.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Thanks for your detailed response, I will try to address those points
one by one.

Am So., 5. Jan. 2020 um 09:15 Uhr schrieb Greg KH <greg@kroah.com>:
>
> On Sun, Jan 05, 2020 at 04:49:32AM +0100, Evan Rudford wrote:
> > The problem of underfunding plagues many open source projects.
>
> Does it?  Citation please :)
> And compared to what exactly?

Linux might be hard to compare with other open source projects because
of its enormous scale.
But anyways, I saw many different open source projects that were
underfunded based on their "GitHub-situation".
Even large projects like "webpack"  seem to suffer from underfunding
right now. Here is a citation for you:
https://webpack.js.org/blog/2020-10-10-webpack-5-release/
Also some "medium-sized" projects like
https://github.com/typeorm/typeorm tend to be underfunded unless a
company is willing to sponsor them.

> > Although code reviews and technical discussions are working well, I
> > argue that the testing infrastructure of the kernel is lacking.
>
> Does it?  No one can argue we are "doing to much testing", and more
> testing is always wanted, and happening, can you help with that effort?

Well, yes I would help, but it seems to be hard unless you are working
for one of those companies who are actually doing kernel-testing.

> > Severe bugs are discovered late, and they are discovered by developers
> > that should not be exposed to that amount of breakage.
>
> Specifics please.

This is perhaps only relevant for some specific users.
When I see a critical bug report, then I always ask the question:
Could this bug have been catched by a test-suite with reasonable
efforts compared to the size of the project?
Or is it such a weird corner case that no test-suite could have
realistically catched this bug, other than by pure luck?
For most projects, I tend to lean towards the first answer.

> Remember that Linux runs on _EVERYTHING_ so testing on _EVERYTHING_ is
> sometimes a bit hard and bugs only show up later on when people get
> around to running newer kernels on their specific hardware/workload.
>
> > Moreover, I feel that security issues do not receive enough resources.

This is perhaps hard to argue because the competition isn't good.
To be honest, I feel that neither Linux nor any other "major" OS is
reaching "high" security-standards.
It is a fallacy to think that the security-situation is good just
because nobody else is better.
And of course, rewriting Linux is nearly impossible, but I doubt that
Linux will ever become "truly secure" as long as everything is written
in C.
Let's face the reality: C is an excellent systems programming
language, but it is like an "unprotected chainsaw" with respect to
security.

> Again, citation please?  I would argue that right now we have too many
> people/resources working on security issues that are really really minor
> in the overall scheme of things.
> greg k-h

I agree that the current security-efforts might not be well-directed
for the overall scheme of things.
However, I don't think that security has "too many" people in total.
It might be true that "minor" security-issues are eating too many
resources, but there are still "non-minor" security issues that are
not yet addressed.
