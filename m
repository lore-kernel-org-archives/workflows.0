Return-Path: <SRS0=Scut=4O=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68453C4BA24
	for <workflows@archiver.kernel.org>; Wed, 26 Feb 2020 20:11:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 363DB21556
	for <workflows@archiver.kernel.org>; Wed, 26 Feb 2020 20:11:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="KLobmzGj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbgBZULn (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Feb 2020 15:11:43 -0500
Received: from mail-qk1-f172.google.com ([209.85.222.172]:42679 "EHLO
        mail-qk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727240AbgBZULm (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Feb 2020 15:11:42 -0500
Received: by mail-qk1-f172.google.com with SMTP id o28so770234qkj.9
        for <workflows@vger.kernel.org>; Wed, 26 Feb 2020 12:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BidKFGeSlke3xAe+1zvEY+KEPtUpfskVOMzxvmzuKQc=;
        b=KLobmzGjMeS5ya0jRxxtFVssK1QjwngqKhDixy3v8BA1PNXKLw/KYS3F9AxnchQG8w
         OJdA7YzmSBcABmOiXRyZs+OtXYZy1akzLTQipweoLYFntehU5RrCYaNjeVs1zxpdD9IU
         LokNDE9DEFXl3SdLvoyOBeMljbfJrrVK9ioSQMxIUIO9Xxyg8VtPRoFjHznQXCRM5sF6
         m+XDvQCaDTpReqLJexqBbxJGtqugKNm3YmJK9cO0Vjp4ix7tdNDRKC6ZZcFu5fXryeEp
         buijQHarSRzwco6p1T9XNSfr7P/0nZnBnwxrWzj+2et2BU7nS95Xnbg3E5uKohtD3Tr4
         VqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BidKFGeSlke3xAe+1zvEY+KEPtUpfskVOMzxvmzuKQc=;
        b=rCfgD1D5aZmyZikgMRPt//K3d12rgmvdr866oKQ98TIpQYSlSiJcIqLThVQhIAEVJR
         UJupHAGpmTOfdmMfjX0i5G8HQiSUUyaO5aE1A2VT03jqVbpPtCUTtmCQUEgOaVumrD1m
         SYb0PImxhlHHo0fIJ3Vr93tn0nU9/7BKvl0XWP4tcmCmnpllKwr5syMZqKstKPyDMP5A
         SJEyJulynkBEMTtPbICtSAil9CYoB5mNidXYIzloqn1fsvzhHrnMKMXQs6yq76yOb1xF
         +JY0b9TP7U6g5NUK1o8tPcNGkrYUO5jDeaXVDIZaWzK0ZSpqUhMdKZRlOvqwDggm3ynq
         eEGg==
X-Gm-Message-State: APjAAAVo8bOH8AWoHo1hcsCPoMbxBDgVFZrPbVC4BKLPt3Ats+UPf7+K
        VBatCydxBZuiOODWSev+P7kkxyXDrqVYPw==
X-Google-Smtp-Source: APXvYqwEn7RhCLL4IareWXyCI4OWND3d/qianb5ZMY146PjWJNk8CrFZSP7yZdqm65MHMeweQvnIGw==
X-Received: by 2002:a37:6258:: with SMTP id w85mr1044861qkb.206.1582747901616;
        Wed, 26 Feb 2020 12:11:41 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id k23sm1610990qtq.89.2020.02.26.12.11.41
        for <workflows@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 12:11:41 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1j731w-0006WZ-H6
        for workflows@vger.kernel.org; Wed, 26 Feb 2020 16:11:40 -0400
Date:   Wed, 26 Feb 2020 16:11:40 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     workflows@vger.kernel.org
Subject: Re: Patch attestation RFC + proof of concept
Message-ID: <20200226201140.GA24263@ziepe.ca>
References: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Feb 26, 2020 at 12:25:02PM -0500, Konstantin Ryabitsev wrote:

> ### Three hashes per patch
> 
> If you look at the contents of the patch attestation message 
> (https://lore.kernel.org/signatures/202002251425.E7847687B@keescook/), 
> you will notice a yaml-style formatted document with a series of three 
> hashes. Let's take the first one as example:
> 
> 2a02abe0-215cf3f1-2acb5798:
>   i: 2a02abe02216f626105622aee2f26ab10c155b6442e23441d90fc5fe4071b86e
>   m: 215cf3f133478917ad147a6eda1010a9c4bba1846e7dd35295e9a0081559e9b0
>   p: 2acb5798c366f97501f8feacb873327bac161951ce83e90f04bbcde32e993865
> 
> The source of these hashes is the following patch:
> https://lore.kernel.org/kernel-hardening/20200225051307.6401-2-keescook@chromium.org/

If you define an alternative message signature algorithm like this,
then is there still value in detatching the PGP signature from the
patch email?

The usual PGP signature computes a hash of the message in a certain
way (with unquoting etc). If you instead replace that with your method
and then just generate the normal base64 blob using:

  msg_hash = HASH(HASH(i) || HASH(m) || HASH(p))
  sig = RSA_Sign(msg_hash)

Then the base64 of the sig can just be dropped at the end of the
message, and doesn't need to be detached, or need the various ---BEGIN
PGP--- overheads

The magic I see here is defining a way to compute the message hash of
a patch email that doesn't cause a big mess.

Jason
