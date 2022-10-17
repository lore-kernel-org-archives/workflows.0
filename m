Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175DDC433FE
	for <workflows@archiver.kernel.org>; Mon, 17 Oct 2022 20:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbiJQUrg (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 17 Oct 2022 16:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiJQUrf (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 17 Oct 2022 16:47:35 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C78E2BF4
        for <workflows@vger.kernel.org>; Mon, 17 Oct 2022 13:47:34 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id z8so8536086qtv.5
        for <workflows@vger.kernel.org>; Mon, 17 Oct 2022 13:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OtWVZweAAWnRcixYheN70Qvehd1+rrCwMcjYRhIlb2Y=;
        b=MZVxUi2GZh5IohthQ9cj4T4ufBqhUpgZsikK5sJpm4pg+8AQjwDWGpXkFJbTK0IxOJ
         4+857XGGY9ybPZsnTkZXdhYBMOf1bKa/N/gJacVtaAYmmr3/dZg3DlEzJswZjvaJ8j7W
         hCWA8lZpfeCTBep9CjBOyraqrtb/Flf5GHbNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtWVZweAAWnRcixYheN70Qvehd1+rrCwMcjYRhIlb2Y=;
        b=Wroyzb8BwQn6YyTJh6zwTrh7y4wY0rmhzVEeyzATKfAnTs2V+MicJgzgDs/M598FDu
         XhOXGZAGAg/IHyyxf4xTMWk530bne56a8xTY7a6Xhzo+r3KcOjRdte1R/jQhlO4y21lz
         EVoo2PMCZQwxe8bR5i3s0ao5z+HBarbcMYHFJpT5rdkoW2gJhBYZ8d6J33EW48l2rMRa
         XM8bv4vE7PtqwiGSAc9hbSVxSAfXhur23nNCtmyQrsKt3JgbqhBmA2utQISVvS7pOJ3O
         ApL+iVVBDvr+2FkEBUzkzc/NZJRoFpWTSP88CtUAeV6/eG7623BfnWxPvK2JLhvnkOWJ
         o66Q==
X-Gm-Message-State: ACrzQf1Jj7Pvdzb254/YaNo6pkDpD+LpdKrJm/ApAjJOF5nLqsGwrbaV
        4HaCa9lyoorfjwt6Lq0FaRyZhQ==
X-Google-Smtp-Source: AMsMyM6bGvvUOBD+yB2ss1Ep6dXWrACiISmGohsGN3hvvqeUTPBZj3iH2hceHJFuDnSmiAUDaKUpFQ==
X-Received: by 2002:a05:622a:1650:b0:391:b2cb:6d42 with SMTP id y16-20020a05622a165000b00391b2cb6d42mr10346836qtj.643.1666039653567;
        Mon, 17 Oct 2022 13:47:33 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id f7-20020ac84707000000b003431446588fsm588639qtp.5.2022.10.17.13.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:47:32 -0700 (PDT)
Date:   Mon, 17 Oct 2022 16:47:31 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     "Artem S. Tashkinov" <aros@gmx.com>, workflows@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221017204731.a7rixhqlqmhlntvl@nitro.local>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
 <f0412b37-fac0-c3f5-9877-0460a027e109@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f0412b37-fac0-c3f5-9877-0460a027e109@leemhuis.info>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 17, 2022 at 03:57:17PM +0200, Thorsten Leemhuis wrote:
> > Here's my counter-plan, which builds on top of yours.
> 
> Is this the agreed on path forward by silent agreement? And if so: who
> will actually shepherd this? I just wonder, as it sounded to me that
> Konstantin would be happy to take care of the bot-related stuff, but
> leave the rest to somebody else.

Indeed, I need to do most of the preliminary legwork. I will start by creating
a public-inbox feed of all bugzilla comments, which is something I was
planning to do for a while anyway. Once that is in place, I can build on top
of that to add a two-way bridge to replace bugzilla's native (and rather
limited, in my experience) email bridge implementation.

Once I have this in place, we can consider what next steps should be taken.

-K
