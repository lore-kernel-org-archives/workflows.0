Return-Path: <SRS0=YmVK=XZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE1FC32792
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 20:56:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E528C20679
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 20:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569876974;
	bh=IC8lA9SBT7lnHuocdf1HzrS1oIJBRdgUyK+3cZhr3oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Xq0yepY6HtA1/OVkQAAUIM6t3Rjbz6YQ4DS6T0L1ndH/Bjy/3+ACbX5cUp7RtJEWA
	 wlGfhr8W9VUfbXPzkC4ReMVgIk0sSN7hoIDzO5aLO9oBGbTmsMiCYxpwaoMD6xYtjP
	 sNPJEeNCDbBT2Pn5HUw4vIp05CoCJXGAIUxWrnfs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729880AbfI3U4N (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 30 Sep 2019 16:56:13 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:36353 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfI3U4N (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 30 Sep 2019 16:56:13 -0400
Received: by mail-qt1-f196.google.com with SMTP id o12so18877274qtf.3
        for <workflows@vger.kernel.org>; Mon, 30 Sep 2019 13:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wFY+IpAjMi9nVMPDTrcdklust1JcKSDAbh1qejbS24E=;
        b=gWAp6ityt95sI32rOIfvUWMcVyUq478EZNrlsYuan+3kp4YW2IRJdY7u9np7zVs0ek
         Ih1Y/KbJ0d+H5yTBfG7E4aHk4wBkWDTl6W86GOv/fUelzTl2q8fFZeQoOBuvKnKFlaR1
         Df0itDmBcG4UQmFLgjlP4k1z/nF6+DShG+Mxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wFY+IpAjMi9nVMPDTrcdklust1JcKSDAbh1qejbS24E=;
        b=KOV326SnHz7r8A/O32KtT8WfkepOsSmrc5gTj5sTH10Eyuf/XN0j94k88hdREpINBa
         HnSwUCVB4IV5PGpq0FWRrzG0JWlX4bbo6BFPzwF4Yj+LBcdmWdhOtPKKc1Y2pe9cfm4r
         Ux30/JLjmc+PedbWlgD2WoF5rmYNM08Q1mVRopqJDwOzNq4NC0WczSepdgNF+BwOStar
         JNepSmskkZRV2d/rG/dTL07vg4aEXRGNQF81Jheo2ICRWeZl1ONBR8+px9fulzcrrKwN
         1P7FSHt/OdhTQobyhe3rnlBlw81C1MvEqVpdPUmrOkNi6YpOK8t9wBTNZ7XwZMnWWnvH
         Oayw==
X-Gm-Message-State: APjAAAV8MLzVaKHElEuLlV1otaQDhMKGq35IpSPv9Rxo0oByGRTMo4jQ
        CC4b1ty4Jy2EqLoQUPvEExb1Ch1Vvs/Y4A==
X-Google-Smtp-Source: APXvYqxqBU/0rLyL2glQbCR7cS5kxutMDBwARMLyUCjr5/VaaqnLMw3voZVIk4Cz0hOKAV+gku/7OA==
X-Received: by 2002:ac8:224b:: with SMTP id p11mr27054666qtp.38.1569876972295;
        Mon, 30 Sep 2019 13:56:12 -0700 (PDT)
Received: from pure.paranoia.local ([87.101.92.157])
        by smtp.gmail.com with ESMTPSA id g25sm4943475qtp.96.2019.09.30.13.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 13:56:11 -0700 (PDT)
Date:   Mon, 30 Sep 2019 16:56:09 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20190930205609.GC14403@pure.paranoia.local>
References: <20190924185312.GD6041@hmswarspite.think-freely.org>
 <20190924202423.GA14425@pendragon.ideasonboard.com>
 <20190924222502.GA11633@hmswarspite.think-freely.org>
 <20190925205036.GA7763@pendragon.ideasonboard.com>
 <20190926004045.GA20302@localhost.localdomain>
 <20190928185848.76c85a9d@oasis.local.home>
 <20190929115722.GA26820@hmswarspite.think-freely.org>
 <CACT4Y+Z8_fABZSXahiGaOxKiPa+K3hxhvH8EVenuuqOs3aCwZg@mail.gmail.com>
 <20190930145123.GA4001@mit.edu>
 <20190930111532.284f7adf@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190930111532.284f7adf@gandalf.local.home>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Sep 30, 2019 at 11:15:32AM -0400, Steven Rostedt wrote:
> > (a) It's meant for a tree that has its own mailing list, but some
> > people cc LKML anyway, on general principles.  Since very few people
> > read LKML, it's kinda pointless, but people do it anyway.
> 
> I prefer this method, as I'm not subscribed on every mailing list, but
> am with LKML. It makes it a lot easier for me to see threads when I get
> Cc'd on a patch thread that's from another mailing list. It's much
> easier for me to find the thread in my LKML folder, than to have to
> search archives someplace else. Although, lore.kernel.org is making
> this better.

As a side-note, we are working to make it easier to run lore.kernel.org
mirrors (either full, or a subset). So, if you wanted to take work
offline while being able to search full LKML archives, you should soon
be able to do so.

-K
