Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C000C4361B
	for <workflows@archiver.kernel.org>; Tue,  8 Dec 2020 14:01:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0E7123ACA
	for <workflows@archiver.kernel.org>; Tue,  8 Dec 2020 14:01:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbgLHOBy (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 8 Dec 2020 09:01:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727716AbgLHOBy (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 8 Dec 2020 09:01:54 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40907C061749
        for <workflows@vger.kernel.org>; Tue,  8 Dec 2020 06:01:14 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id dm12so8235938qvb.3
        for <workflows@vger.kernel.org>; Tue, 08 Dec 2020 06:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=CVTllRR44suc5mVpvRLpTRmMHkCXzz7Mpl2hv9MrX9g=;
        b=dG/pfRnqkacwAVw0+/xnLW6GJEZCWBEtn2/xmPnVGb+oW68Q4aJrG1QwlAGqqU1w0h
         lTxY4+xW+NnOP5iG3s9Qo5xNVw3AAr7Smi69xR76W9GcWi06TYWcap1Pm8+5Jwyt5+sE
         Vs8wlBjSbfH4+CuogUYKcgDZeOR/+Iwi1HpeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=CVTllRR44suc5mVpvRLpTRmMHkCXzz7Mpl2hv9MrX9g=;
        b=bJa7OhOLoP7hhkWNsLqyzOA4GLGyIfLaemJCqTdWBQiKjB1fc/u6ZISNdD6SpqgKIM
         QtYgdPwOmOsMR7GgjcBj7gKQ2v9p5qhhpbU0TAVe82S4uLUpdsweu9FR6ldRBO4G12br
         lGOPpD09alkHeQP7qvF+fT3OjjtLQR5Kj9JKwl96Dm9zIKBVOwEI1BKy3XEDqEeAuip9
         HYLClaPh+pZjtNhZ7wKJFGu4i/WH+QB/3E0L+2EzzCB0qg86HNNmtJVqFNmrzAA0AYn2
         dQ3ZvkPQgAbnScp2G/nweEml5/92i/UQGxToipcMP3YIgUBV6qxq1++VKNjijyj1RIQd
         2X1Q==
X-Gm-Message-State: AOAM532DKO0Es1YQYS1bqI5vx9NuW+g/wCZIwZorHX9TqGVzkXxb4m9K
        BQUayppiXeG3M4BdO+R/D12HtPZ3XYzeuWw3
X-Google-Smtp-Source: ABdhPJx0xfvViDD5fZGIJnfRdzGRihuxNdqS1BbBii9pLEqjSq73bFY3z+sLSUcrZuvX1s/cJTNIuQ==
X-Received: by 2002:a05:6214:909:: with SMTP id dj9mr27102038qvb.31.1607436073442;
        Tue, 08 Dec 2020 06:01:13 -0800 (PST)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id z186sm14004659qke.100.2020.12.08.06.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 06:01:12 -0800 (PST)
Date:   Tue, 8 Dec 2020 09:01:11 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Eric Wong <e@80x24.org>
Cc:     workflows@vger.kernel.org, meta@public-inbox.org
Subject: Re: WIP: searching all of lore
Message-ID: <20201208140111.3lxecf42d6ooskeb@chatter.i7.local>
Mail-Followup-To: Eric Wong <e@80x24.org>, workflows@vger.kernel.org,
        meta@public-inbox.org
References: <20201126194543.GA30337@dcvr>
 <20201128223457.GA31347@dcvr>
 <20201205200717.GA7923@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201205200717.GA7923@dcvr>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sat, Dec 05, 2020 at 08:07:17PM +0000, Eric Wong wrote:
> Per-inbox search also uses subset search, so all the existing
> inboxes should be searchable on an individual level, not just /all:
> http://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/lkml/
> http://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/workflows/
> http://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/netdev/

So, are things to the point where we only need a single xapian db for 
all lists, or do we still need to keep individual list indexes?

-K
