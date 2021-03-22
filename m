Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91D2C433DB
	for <workflows@archiver.kernel.org>; Mon, 22 Mar 2021 17:17:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75F48601FB
	for <workflows@archiver.kernel.org>; Mon, 22 Mar 2021 17:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbhCVRQy (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 22 Mar 2021 13:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232077AbhCVRQj (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 22 Mar 2021 13:16:39 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F688C061574
        for <workflows@vger.kernel.org>; Mon, 22 Mar 2021 10:16:39 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id f12so12918632qtq.4
        for <workflows@vger.kernel.org>; Mon, 22 Mar 2021 10:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=AOzWwNh9Z9Q2fPxgCHDYPxpc0oqGNwrpuGjPzRTDOYM=;
        b=SUPXIeJkm8BeqFPeZOhFyudDzS8X+Q3bXG7r/aza6Z9TpqZXVn/JWTdHwTjt7pO1Di
         2mdLRNSeZt0mL+p9bkjlJ12mu38eSVhX/qcLwxXOaJ3V4NU/7rpg65aRD1C7wHvTWmHk
         jT/MgB55wcXIxwl63yMiCJDwSsui3U08+dwDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=AOzWwNh9Z9Q2fPxgCHDYPxpc0oqGNwrpuGjPzRTDOYM=;
        b=QJXuQXSyvvRpQ4VJI6bWQMTfDybN0dySXbZ/fqDBqEVpHbRI0G9rJ5Hr1djm+uvLLx
         r853v9SnXuB7llvosDoIxLacW/6/XySzPB6kfXUZMJS50wcJCqYPcbaySe3GTk32ptNA
         aqH5OrdMTBi2r+ldNig5+9HRsfTJlbMG5zP9rVkd9lx6lqnqqAUz2q0bl8RMa6GuBMKe
         7nNDHNf1BCjZJvCK9wrCWd8xKm+R3d71ldP69CCApYrAZ5d7K/S8GeWDCLo3nYkJLwTv
         l+zPX0DXf1zfdXFkUTW/dnz0JkXga5B9u3eyvxe5ZGH+11m3h1RL2TDaVqlPDBIxY29K
         gTnQ==
X-Gm-Message-State: AOAM532rJrfAReoULVKy8gARwbZNSxw3+aYiqTTDHz7R57IstkT37VR/
        3GrI5xm+HG7q6VrBWybgq3kQDg==
X-Google-Smtp-Source: ABdhPJy/CiFfBssEItdA5oVBV2QXfAv2XhDWbXT90l7G5Lo5Ba8ddKwgyAendg7ze94cnMR379PEvA==
X-Received: by 2002:ac8:4a19:: with SMTP id x25mr850552qtq.271.1616433398205;
        Mon, 22 Mar 2021 10:16:38 -0700 (PDT)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id o197sm11087024qka.26.2021.03.22.10.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 10:16:37 -0700 (PDT)
Date:   Mon, 22 Mar 2021 13:16:36 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        ksummit-discuss@lists.linuxfoundation.org,
        workflows@vger.kernel.org
Subject: Re: RFC: create mailing list "linux-issues" focussed on issues/bugs
 and regressions
Message-ID: <20210322171636.fkep2lby6gnve4su@chatter.i7.local>
Mail-Followup-To: Thorsten Leemhuis <linux@leemhuis.info>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
        ksummit-discuss@lists.linuxfoundation.org,
        workflows@vger.kernel.org
References: <613fe50d-fc9c-6282-f1f3-34653acb2ee9@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <613fe50d-fc9c-6282-f1f3-34653acb2ee9@leemhuis.info>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Mar 22, 2021 at 04:18:14PM +0100, Thorsten Leemhuis wrote:
> Note, there is a second reason why ksummit-discuss is CCed: another
> reason why I want to create this new list is making it easier to find
> and track regressions reported to our various mailing lists (often
> without LKML in CC, as for some subsystems it's seems to be custom to
> not CC it). 

FYI, there will soon be a unified "search all of lore.kernel.org regardless of
the list/feed source" capability that may make it unnecessary to create a
separate list for this purpose. There's active ongoing work in the
public-inbox project to provide parallel ways to follow aggregate topics,
including query-based subscriptions (i.e. "put a thread into my inbox whenever
someone mentions my favourite file/function/device name"). This work is not
complete yet, but I have great hopes that it will become available in the next
little while.

Once we have this ability, we should be able to plug in multiple sources
beyond just mailing lists, including a feed of all bugzilla.kernel.org
changes. This should allow someone an easy way to query specific bugs and may
not require the creation of a separate list.

I'm not opposed to the creation of a new list, of course -- just want to make
sure it's aligned with the improvements we are working to make available.

-K
