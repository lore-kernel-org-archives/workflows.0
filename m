Return-Path: <SRS0=hXFv=3V=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789EAC33CB3
	for <workflows@archiver.kernel.org>; Sat,  1 Feb 2020 17:43:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50B6620679
	for <workflows@archiver.kernel.org>; Sat,  1 Feb 2020 17:43:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V5clAAU2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgBARnH (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 1 Feb 2020 12:43:07 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:50499 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbgBARnH (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 1 Feb 2020 12:43:07 -0500
Received: by mail-pj1-f66.google.com with SMTP id r67so4391694pjb.0
        for <workflows@vger.kernel.org>; Sat, 01 Feb 2020 09:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ktn7XB/6vpAx/3VZwhx4MPhXjSlYA6ThysRWtbIFmu4=;
        b=V5clAAU2ycB8AWLUtbADvSC7bnpnDCK36JjGq+GGS1FteoM7ymVJvB5rnEFZJg49Kq
         TwVUYUoX9uX6GVR/rT8TH4ruP1tvY37SKk8oEYYRam+rUEmZHfpCsSZSXsBEDPo6Nzzm
         MTpc27fYA+dBv0jsLnz+Q1OIvXu+TnFOIWU9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ktn7XB/6vpAx/3VZwhx4MPhXjSlYA6ThysRWtbIFmu4=;
        b=JnWyAegL3w32VZWW2h7dJCzAI556UlQozp6JHwGSkiyWwTjc7+UAgte7PPcra0SOcC
         Ao7fcZFH9t4eSudYh9N8QtkfBtQ4l14nJBbqpcjrgYnbXiSvOxs0yNS7qyFelniQQKP8
         jRJuHeHtn17FkLP2KKfgKtpL/vkvDnmq1mOElq/tQGKvNwkG/rfGWwUYSEpbZJ6IARRE
         OUj11p8WZr692xS4kmsMN8qwtHSgEgRWa0zJLni2wNNicxVqJMpjAbiFfA16hJYRr8kQ
         +uT5B/JOZ6/oSXp07Wjt67Q5vef3q5yq2lTx6ePgRs7fjCs/DoZcyejMLstxzt8urMDX
         NCHw==
X-Gm-Message-State: APjAAAVLsQUSurni0qVChGlcneki3lWSbkgqxxbF0DRk3X+gspm/9AXS
        F2K5qyCnaaQa5SO+V7Ud1utbHVysna4=
X-Google-Smtp-Source: APXvYqzKjMN3CfIs8Me3nD9qi4d0fmJocLLGyGLMALLz8Tm8RCfpUm6XnlxVI3GNDYsT36Myue/JyA==
X-Received: by 2002:a17:90a:a881:: with SMTP id h1mr19505633pjq.50.1580578986560;
        Sat, 01 Feb 2020 09:43:06 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p28sm14648221pgb.93.2020.02.01.09.43.05
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2020 09:43:05 -0800 (PST)
Date:   Sat, 1 Feb 2020 09:43:04 -0800
From:   Kees Cook <keescook@chromium.org>
To:     workflows@vger.kernel.org
Subject: Re: get-lore-mbox: quickly grab full threads from lore
Message-ID: <202002010941.B3F47C3A1@keescook>
References: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Jan 31, 2020 at 10:01:05PM -0500, Konstantin Ryabitsev wrote:
> You can see that the git command it gives you has a different branch and 
> parent info, which should let you do an easy diff between two branches, 
> one using v6, and the other using v7 versions.

I love it -- I've been missing this between gerrit and patchwork, and
now I don't need a GUI at all. :)

> Please give it a try and let me know your feedback! You can find it here:
> https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/get-lore-mbox.py
> 
> It's a bit raw around the edges and I keep finding corner-cases, so it 
> would be super interesting for me to get input from people actually 
> trying to use it for managing patch series.

I'll give it a spin; thanks!

-- 
Kees Cook
