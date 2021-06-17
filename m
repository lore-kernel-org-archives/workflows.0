Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F34C49EA2
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:09:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0ADB613B9
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:09:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233148AbhFQPLd (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 11:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233129AbhFQPLb (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 11:11:31 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228A3C061574
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 08:09:23 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id t9so4958330qtw.7
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 08:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=udh+AVsfEJRHPJEvi+TM9KYUPYsqJpJ02vqP6th0NsU=;
        b=bRabKhR8mp4GDCAX2vKeLFxWgqzNduRphVVnGf6hHrrdQRKpTkHg17LWBlx6k1gASd
         VxI1eZxKWaTJZcnHfqBnQCeOSFPNtHhywhBGqmoQdlRMn1RszubVD00mdrZULq4oFipv
         LKgLbSuq8I8RoH1FTL6PzbWI41pPI8rwnFoyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=udh+AVsfEJRHPJEvi+TM9KYUPYsqJpJ02vqP6th0NsU=;
        b=YkGHDw8Uv0WZ+N+xsPuJNzBhI3zOhBx1b832veIO0A/YhQ7sUfd1nclRy+NhmT5Lu4
         NeMzgV+ClMwTbxiR5+960DnWwicytiITyMddicvlxbochEE2So8Nl0Nlv1EitUmB+nF7
         2Hn9Yd5NVWGyz4bFz4E5ThZU0IDi6z4oV88WpeYBxMMnh8++ADq1I/k+BEzOQfLsAzRI
         aL1T+9IwuPYTBDaevVTaxUOfSk8cIeibHhjoAgXZLpUJ2aQ/hkhTeDB0+J9C2fl0s5jc
         n7uf7DUdPgv76dbgQi4m2RIXMLuwTBYJRKJoeoUC2D5TEw0rq6OAMeXH3DrMyPZ8bqS8
         /hrg==
X-Gm-Message-State: AOAM5322Fp4V9sWbM2zOsVLKeDKkN1BIyWnA4+nVaW1lo96r+4vYNBZq
        kO6fgCclGWf24/2ZiHAKW8hY/A==
X-Google-Smtp-Source: ABdhPJwMNXmT4LXLf+tnPqkEoUSG/CWBz/pSqO1yfjDIHwKR4oUsce2qYSak7Aydku++bcgjE5vExQ==
X-Received: by 2002:ac8:5943:: with SMTP id 3mr5661176qtz.368.1623942561364;
        Thu, 17 Jun 2021 08:09:21 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id r22sm3356090qtm.82.2021.06.17.08.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 08:09:20 -0700 (PDT)
Date:   Thu, 17 Jun 2021 11:09:19 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Linus Torvalds <torvalds@linuxfoundation.org>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <20210617150919.k4v3qpurxj2t4cr4@nitro.local>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <CAHk-=whEZ23h_Gvg3aOuQgXbUjxn6gwvcS2dHawkPgpDwKmssw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=whEZ23h_Gvg3aOuQgXbUjxn6gwvcS2dHawkPgpDwKmssw@mail.gmail.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jun 16, 2021 at 01:24:52PM -0700, Linus Torvalds wrote:
> Yeah, I've had to turn off all emails from github because it's too
> noisy. Github also makes it very easyt to "invite" people to be team
> members, whether they want to or not, so I'm a "member" of random
> projects. There needs to be some way to make this _very_ much opt-in,
> not "anybody can do anything whether the target is ok with it or not".
> 
> I do think that having a way to generate patch series would be good,
> but I really really hope your robot would have
> 
>  (a) some limit on sizes
> 
>  (b) check that the commit messages are well-formed

I'm hoping that these 2 will be handled by Github pre-flight CI tests before
the pull request is even given the status "approved" and processed by the bot.
It's much easier to separate meatballs from the flies before they leave the
sausage factory. :)

> I've seen a lot of github code that doesn't have the Linux kernel kind
> of "good commit messages required".

Heh, and then there are pull requests like this one:
https://github.com/torvalds/linux/pull/779

It's a single commit that changes 44,000 files, so at least it would be easy
to catch this with pre-flight checks so the pull request never receives the
"approved" status.

In other words, I am fully aware of a lot of potentially negative outcomes of
this work, and I hope we'll be able to add sufficient anti-abuse measures so
it doesn't create useless work for anyone on the receiving end of the bot.

-K
