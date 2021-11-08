Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050E7C433F5
	for <workflows@archiver.kernel.org>; Mon,  8 Nov 2021 21:36:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D77F8613B3
	for <workflows@archiver.kernel.org>; Mon,  8 Nov 2021 21:36:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238056AbhKHVjB (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 8 Nov 2021 16:39:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238055AbhKHVjA (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 8 Nov 2021 16:39:00 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3DCAC061570
        for <workflows@vger.kernel.org>; Mon,  8 Nov 2021 13:36:15 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id j9so12813287qvm.10
        for <workflows@vger.kernel.org>; Mon, 08 Nov 2021 13:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ky/FsnVeSPZ1qFTpV9ggGkC05PrJ0/S9MnEDYsj0xQc=;
        b=GxzvY2JMLq9wLxYf0tFRKzNjc0L75IN7itFeQvLQ4Hi0YkuXDa3I6x+ccXLYhydT5V
         VQ37N1P5QbjL83zCR2zhqLcRzedTfBTrreuLWEUZ4pRjSZQ0UkuLYMCLGO+aIylQgbBl
         dkoF0OrvnPKNYPolnApsbd7j3ZcHCzDKosY6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ky/FsnVeSPZ1qFTpV9ggGkC05PrJ0/S9MnEDYsj0xQc=;
        b=D5pNdoQphA4116kEHdDMBtTSSHcZu5cCKGvbkPltPgvDUSpHrNbSV/7ZjhTZAMwl8U
         dyFqXv1w9rwBKvvvyhRRa/qQX6p6Qc16AkRAzglIfJQXXLF7fMmFDSSm4667rttHHQS7
         19Y/ax1/rgE+2Xyqn3vK38Qz5v6T6wsCKyjp92DT1ZePR1y3XK+1tPdNKD5i8xnIPDo1
         lvsut8uEkIjAOEfxXZqvww7im5yWgKZCdKea3gVRduE1TDruaNC9tZAii7riUTDSoHgH
         LVxCLUMyLyohZzdmfKBT2x1ducC6qmrYAxYklxZzEk0r7rbpnki65tYKUhvEsksnzeRy
         GZCw==
X-Gm-Message-State: AOAM530fY4mQNTyZWoMjCQhdDIjp8tb+Zqu6s8EvB+f7mcWt5pMQU+TC
        hTWz9aKr3Vnid/nC1nK5+jO+wA==
X-Google-Smtp-Source: ABdhPJylm2ddqLL68rQdm3IVyr33iWWaR/RGYT50f58lNgohBzCASXTlm9AEIyq1PV4HmyEh1fs6ZA==
X-Received: by 2002:ad4:5f88:: with SMTP id jp8mr2083466qvb.57.1636407374987;
        Mon, 08 Nov 2021 13:36:14 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id w9sm10730820qko.19.2021.11.08.13.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 13:36:14 -0800 (PST)
Date:   Mon, 8 Nov 2021 16:36:13 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Eric Wong <e@80x24.org>
Cc:     Rob Herring <robh@kernel.org>, meta@public-inbox.org,
        workflows@vger.kernel.org
Subject: Re: lei: incorrect quoting on saved searches (was Re: lore+lei:
 getting started)
Message-ID: <20211108213613.4hjtbokwzar7x4ph@meerkat.local>
References: <lorelei.part1.202111051304.mdtebsxahljcrxak@meerkat.local>
 <CAL_JsqJBh1O3H2-P07AHzVq0x89BoP_N6P=rT5up6=3QyF_B0Q@mail.gmail.com>
 <20211108202204.q5zg6bachnvbjlnx@meerkat.local>
 <20211108204923.GA12823@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211108204923.GA12823@dcvr>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Nov 08, 2021 at 08:49:23PM +0000, Eric Wong wrote:
> Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> > On Mon, Nov 08, 2021 at 01:49:07PM -0600, Rob Herring wrote:
> > 
> > Moving this to meta.
> 
> I don't think workflows should've been dropped, though.
> 
> > > >     lei q -I https://lore.kernel.org/all/ -o ~/Mail/floppy \
> > > >       --threads --dedupe=mid \
> > > >       '(dfn:drivers/block/floppy.c OR dfhh:floppy_* OR s:floppy \
> > > >       OR ((nq:bug OR nq:regression) AND nq:floppy)) \
> > > >       AND rt:1.month.ago..'
> > > 
> > > I tried a similar one which I had working as a bookmark:
> 
> That's actually treating the entire single-quoted section as
> a phrase search for Xapian.

Hmm... I noticed that when I `lei edit-search` the initial query that was
causing quoting issues, I get the following:

	[lei]
		q = (dfn:drivers OR dfn:arch OR dfn:Documentation OR dfn:include OR dfn:scripts) AND f:robh@kernel.org

So, the extra quotes didn't get added to the config file. Running `lei up` on
that saved search seems to do the right thing, so the erroneous quotes are
only added during the initial `lei q` call.

> The correct way to use '(', ')', and '*' on the command-line for
> Xapian is to shell escape them:

But putting them into single quotes should accomplish the same result, no? At
least, that's how I've always understood shell escaping.

-K
