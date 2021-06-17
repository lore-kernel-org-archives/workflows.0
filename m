Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F3DC2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 14:57:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22E15610A1
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 14:57:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233001AbhFQO7y (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 10:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233058AbhFQO7l (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 10:59:41 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78BDC06175F
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 07:57:31 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id x6so1803676qvx.4
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 07:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/IqBr3NA/lWdfJ6FoEna0xJ2q9DkTIf8JPGTcmVk06A=;
        b=Ji6E3/koI4UgDu5JD/goUkbeoFlIpE8vozbFo04Le+8Lit3mzP5dpThbuGsc0koUIu
         405SjfRw1iCoWbpmAK63rMxZ5zDm7x8Q35BBSBCarIJOock/KD1ASq2+6zj3MoKwFURH
         NKX7nH0Ow+6Pdd6Yj+vimnU2OpygcvM02pgO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/IqBr3NA/lWdfJ6FoEna0xJ2q9DkTIf8JPGTcmVk06A=;
        b=JFGC3nQ+qLv8tOgskWMiUO9X7fCEzvUoB7Oar3fdy9FJTmvZE8DyhvAzBaOd72TFIs
         ZBp48iEtRCcZBFsaH+18DB9IBKamPSgUEX2VofWgJsiWJljdQCK8qmLJkr9OTFOnNW44
         zgZJQEyM5LIcF4+U8z7RyvSHoO36YLmA2uM1X8x56t3rnlz7mTYv1QjRAU8BEEC8sE6Y
         E3rWfq0qbD8m4qtyG3bzO3oF1pZgOWIuIkxV4DJ76UKLaDvYBGvz18dt+lFspZ7t2ALm
         kpL7LDcjw9DGZbe7Xd5+rtHMDXfgnIVLjkrgxzxVL6ufHk2Nc7O2qyHUezQ5RVhuJtOC
         Mtyg==
X-Gm-Message-State: AOAM5308fHPX8AkYct62tCHLhRa+b+XE2LA6NwAzdej+DPeQSs37m84/
        Y2woK64q3i4/P+ATP+VYu4sxKA==
X-Google-Smtp-Source: ABdhPJzdP0KE9uJSGjintjvnr78mJKyOgP7ldctfli0gopZLBPCkw/1j5wNMAu3ZugXgr0rUraz7lQ==
X-Received: by 2002:ad4:5f0e:: with SMTP id fo14mr193406qvb.42.1623941850789;
        Thu, 17 Jun 2021 07:57:30 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id d124sm934448qkf.54.2021.06.17.07.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 07:57:30 -0700 (PDT)
Date:   Thu, 17 Jun 2021 10:57:28 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>, Jiri Kosina <jikos@kernel.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <20210617145728.nahkvtxapozccm6c@nitro.local>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <YMsGoI0UdbmUebhX@infradead.org>
 <nycvar.YFH.7.76.2106171031220.18969@cbobk.fhfr.pm>
 <CACT4Y+YoHYCKaLdZFSLqKsMz1j72i=k12FVpmSo-OyB7rCorsw@mail.gmail.com>
 <YMsfXuykH6z0ZbpM@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YMsfXuykH6z0ZbpM@infradead.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jun 17, 2021 at 11:09:34AM +0100, Christoph Hellwig wrote:
> > You don't want to accept these contributions even if you won't be able
> > to tell the difference on your end? But why? This looks really
> > orthogonal to a person's expertise and proficiency in software
> > development. Whether that's inability to deal with email, or no desire
> > to spend time on that, or just personal preferences.
> 
> Because I don't waste my time on the kind of crap that comes from
> github.  If you build a separate webinterface that allows anyone to send
> a proper series from a git tree that is all fine.  But github is toxic.

Won't this just end up reimplementing a lot of stuff that we already get "for
free" from Github and other forges? Yes, I know Github is proprietary, but so
are many SMTP gateways used to send the patch series. I don't see how what
the GH bot would do is different from:

- a developer uses some proprietary IDE to develop the code
- they send patches via their Exchange infrastructure

As long as we don't make proprietary or cloud tools any kind of dependency,
then we're not painting ourselves into any corners. As I mentioned earlier,
I'm also working on a version of the same bot that would work with pull
requests generated with "git-request-pull" and convert them into patch series
for review -- this would be a suitable alternative for people who aren't
interested in using Github.

-K
