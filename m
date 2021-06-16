Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEB1C48BE5
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 18:22:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C02961441
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 18:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhFPSZD (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Jun 2021 14:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbhFPSZC (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 16 Jun 2021 14:25:02 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C43C061574
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 11:22:55 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id c138so390368qkg.5
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 11:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kLEOQVc0I+dxsXcrS1kNjlxEhs2H+X1pfqnGt8AmaUw=;
        b=EMB2hPXVUW5uJiKfEGZKA7RydLcIm3hGdfzz7uDu4b2ylkUfkzON8etIeZ9I8te/Lu
         vCEPKpdE9shA9NU/swuZ6VaHKPo7/tfKrYHBslyt/dL92Mfkm0XZbyYgZbP/yd1CAGDE
         StzUnC0kILNKcr4xhW138Cy2k8OPNuoDbNw9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kLEOQVc0I+dxsXcrS1kNjlxEhs2H+X1pfqnGt8AmaUw=;
        b=au28Z8sVwEWUH0JdPe1VY4ybuPIQXcHzF3JUC8efCkIArd72sL1qQYP2tKHiwxk3wR
         FiObk3Wg1RT8mfTIWErfES/XdGYyQEiQSmSKh4PFLbAaVFbcuoIxnWfGC9cTffPDVT5c
         fBIQPCGX+gENokL8/PyBzh9X/QHD+L6e4529DDtzjnir8uCM6JkSF5TLP6w56NmEr82I
         ArlOz+ywscMVIn0Cp+0zj6HxVHXapWPynj0CQC3bqHP6Fu02EgTrObccnhPPJewP7+Wk
         rESf1hvb/KRT+uyk/CMdYWv4GqDmLm6q14XoLYSVTDffiD142FPCPlC4fR2hR2pgPAFU
         jIiA==
X-Gm-Message-State: AOAM532HO7cTax0b02lEbA8AYWo9RVomZfFeZus3DH6pTfEXqWmzBN4C
        KlLrSHHnyjzkPVxLVhCbFk97ow==
X-Google-Smtp-Source: ABdhPJwG2a/+r7ObdHvVSMZBKyb2jDPqBCECGTlWbsd7g7FUY8bonYbXwh9ckxwRW3n5+2uWfx4g8g==
X-Received: by 2002:a05:620a:15d0:: with SMTP id o16mr1451298qkm.236.1623867774179;
        Wed, 16 Jun 2021 11:22:54 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id h12sm1756577qtn.44.2021.06.16.11.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 11:22:53 -0700 (PDT)
Date:   Wed, 16 Jun 2021 14:22:52 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <20210616182252.flsdrkjuw2etwcud@nitro.local>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <CANiq72=qmGRTUYzXs_FP0Y2_pJOm=5O7bSTBwXawH29oTApuuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiq72=qmGRTUYzXs_FP0Y2_pJOm=5O7bSTBwXawH29oTApuuw@mail.gmail.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jun 16, 2021 at 08:11:23PM +0200, Miguel Ojeda wrote:
> So, in a way, I am trying to go a bit further by bringing the kernel
> development workflow into GitHub (and similar services), rather than
> keeping the ML as the main place for code review etc. I know it can be
> controversial, but hey, I want to try. :)

That's pretty cool, but I'm opposed to this on theological grounds. :)
I think there's intrinsic value to development happening outside of any
proprietary environments, especially if this becomes cornerstone to how a
subsystem is maintained.

I'm not saying Github is going to go away any time, but on the other hand we
just watched Freenode completely implode within the span of 3 weeks, so I'm
extra wary of introducing any single points of value into the development
workflow. If my pr bot goes away, it'll at most reduce the convenience of the
submission process, but not hobble it in any way, so I intend to just treat
Github as a developer frontend tool.

> By the way, the gccrs project (also in GitHub, but also following
> GCC's workflow which involves MLs) also wanted something like ML-to-PR
> direction, and I suggested to them taking a look at `b4` too.

Sure, but just be wary that b4 internal structure is still under heavy
development, so I wouldn't recommend treating it as a stable library until it
reaches 1.0.

Best,
-K
