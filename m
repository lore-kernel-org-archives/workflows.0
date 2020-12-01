Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4DEC64E7A
	for <workflows@archiver.kernel.org>; Tue,  1 Dec 2020 14:01:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 126F820857
	for <workflows@archiver.kernel.org>; Tue,  1 Dec 2020 14:01:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SpHoGTfq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388320AbgLAOBa (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 1 Dec 2020 09:01:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387744AbgLAOB2 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 1 Dec 2020 09:01:28 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40419C0613CF
        for <workflows@vger.kernel.org>; Tue,  1 Dec 2020 06:00:42 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id x16so4284030ejj.7
        for <workflows@vger.kernel.org>; Tue, 01 Dec 2020 06:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h4CyVl5c5rT8SmRxkb00zOgGy5ivSzk3vbpEpVo8E7Y=;
        b=SpHoGTfqjd4HLPKEV0Pdk1t78pVputzGh4FOk5PupT2rey344SeGeTOc4F+ZphLysb
         4JfaTwq4Ud1VVejGNnvgk+PAhkA+/1p5hYJg4PxNY6di6UF91wjg/nhnsjgbvYDwReDw
         2+djiEamx/7ebOC6jfBaMTxSl8eXmJmYNayMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=h4CyVl5c5rT8SmRxkb00zOgGy5ivSzk3vbpEpVo8E7Y=;
        b=TYfgVMkIiNpmAKU8QFF2ITSNU1wxVsKfuvfzJteKGiMOM663VYBWGWw5NQvKPZuatM
         W6K1hrx6iTRLo7SgKg2H2GM0zPKf1eFbAeqiK9LvSlWvyzJZHT5/GSA70QgcUm4R9IVV
         cvM/p+81GMjcVWgsbrJ+eEZF4L8/lh/EEF5qqWvWVDKl3I5WaO0lrMeAPEpWYKvc45wr
         2H6jKcZoA4hLueQXh2Yq91NofDbaz2g44vW5g+eqm8mCJw3sYSyYuGvcpptE4MCDjIDi
         pO8BIwLOSlJdjtiXipD9KIJcyfQupLsDOTKC+DZV9P0Lgps+WZMy92v7fcMRklZnDRgu
         ZZsQ==
X-Gm-Message-State: AOAM531d3TjnfkBbH7FIgVRlIswjIv0lUsYdFGGfQZeuzNxQ0br1gCEa
        gmxZIp9LXFh6olqw0e+dZhEWtg==
X-Google-Smtp-Source: ABdhPJxYMaYkjOxGxLmJX3fIL7Bvh0EmQIunDHHaAUtxaaIIU6WQFdgB9VHsFMrctpDAcrhq/YXxnA==
X-Received: by 2002:a17:906:2e16:: with SMTP id n22mr3196135eji.477.1606831240873;
        Tue, 01 Dec 2020 06:00:40 -0800 (PST)
Received: from nitro.local (tor-exit-14.zbau.f3netze.de. [185.220.100.241])
        by smtp.gmail.com with ESMTPSA id u23sm887039ejy.87.2020.12.01.06.00.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 06:00:39 -0800 (PST)
Date:   Tue, 1 Dec 2020 09:00:33 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Eric Wong <e@80x24.org>
Cc:     workflows@vger.kernel.org, meta@public-inbox.org
Subject: Re: WIP: searching all of lore
Message-ID: <20201201140033.gyxmaejay2ddpiz3@nitro.local>
Mail-Followup-To: Eric Wong <e@80x24.org>, workflows@vger.kernel.org,
        meta@public-inbox.org
References: <20201126194543.GA30337@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201126194543.GA30337@dcvr>
User-Agent: NeoMutt/20171215
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Nov 26, 2020 at 07:45:43PM +0000, Eric Wong wrote:
> Requires Tor, for now:
> 
> http://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/all/
> http://lore.czquwvybam4bgbro.onion/all/

Thanks for this work, Eric, things are looking good in my tests, though
I uncovered a bunch of problems with b4 when used with torsocks. :)

When grabbing t.mbox.gz threads from /all, it appears to properly
reconstitute follow-ups from multiple mailing lists, correct? Is there a
way to "weight" different sources, so that when the same message-id
exist in multiple places, we can prefer one source over another? For
example, this is useful when we're trying to do DKIM validation and some
lists are known to mess that up, while others do the right thing.

Thanks again,
Konstantin
