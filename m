Return-Path: <SRS0=XKJj=4C=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCC6C35242
	for <workflows@archiver.kernel.org>; Fri, 14 Feb 2020 19:53:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F7E1206D7
	for <workflows@archiver.kernel.org>; Fri, 14 Feb 2020 19:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581710005;
	bh=+vnfc/9Vvo8emdnNL813zd2UqZoMGYylCwS1Q2G14Qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PQeqwlvW3i3BQtnue1cmeSIVTzeOAVVNPcA8oV1cUpT/xfaC2d5z1XCMMVY/Vzgxh
	 +fg1ctJXxHWKIJH9WbQt0zeLHYfsg9fmkUoA/CExJH7P+3/R7OVLv/QNyp6hIxwgyW
	 2Qi/MTjtTF+SA+tcveegBUHj4K+L+7JXNy48Ak7U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388753AbgBNTxZ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 14 Feb 2020 14:53:25 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35601 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387964AbgBNTxY (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 14 Feb 2020 14:53:24 -0500
Received: by mail-wr1-f67.google.com with SMTP id w12so12298457wrt.2
        for <workflows@vger.kernel.org>; Fri, 14 Feb 2020 11:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=2KacrfhjKUyr5EcV2j7pwxAbLpj/lQ15rsbUaAX5mWc=;
        b=eUXNORvMZ6V2I2vyx8OU9m8jlOVuhR4t9P6+/hGZs7oTkkj9AFse8OzsT0jloYEJEw
         omzs/Qsbe5RhhiHr1lwOE55fO71CImVw9xiwMV2xg/gVs55BtiN2+UenKbpwwtq1IaAB
         x75qa/B1hSVJV4wcYF+Dh+qTCd5B/M4qHUV6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=2KacrfhjKUyr5EcV2j7pwxAbLpj/lQ15rsbUaAX5mWc=;
        b=RSugI12IYlUhzcbL647gJDooXWfACNy4WHQZu1jjIa0Gt3vsXiHdVcRGUkBgqtaPQ+
         lOT8jW67Qy6OXy5zGPrCNk6Ae++MR+/4/3c+XDc9epw1jDQe5ZLtJft4I/dzs0wTBpT3
         lhgqI80ZdkcGyOMjibDCSJJd+wuFZdVrtFY8am1LhsYwgCKQbupVExCSLls6hEM8rKu+
         hCm8kK38Ulw6c1c/vc3FhcO/14SBJ3Ocu4BnYI0eNeve6b+RXNjhUczFHq3yQi3gCM3T
         ubjyhH7zMCvAeuzIj2Add3Ttl80vWoqbWqfN8Ml9lh1Ru+O4TSacwYZDM54usBgDi0Dj
         x5Ww==
X-Gm-Message-State: APjAAAUUgz/xrN648xNNyqFbME/rauCfLsCmgdLIZC7zzmiryWx8WLg6
        6uWJsRvvDFRtcygkSRwu3uu8XMMQUbQLfA==
X-Google-Smtp-Source: APXvYqxRCRoVXRdeRI44jkYM3Cz56Hg4qKcJms90daE6ge4wySef5M3PxCH/UXZOiBKdIrzpcRASUQ==
X-Received: by 2002:a5d:528e:: with SMTP id c14mr5691734wrv.308.1581710003093;
        Fri, 14 Feb 2020 11:53:23 -0800 (PST)
Received: from chatter.i7.local (tor-exit-15.zbau.f3netze.de. [185.220.100.242])
        by smtp.gmail.com with ESMTPSA id q14sm8371737wrj.81.2020.02.14.11.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 11:53:22 -0800 (PST)
Date:   Fri, 14 Feb 2020 14:53:18 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     workflows@vger.kernel.org
Subject: Re: get-lore-mbox: quickly grab full threads from lore
Message-ID: <20200214195318.ghvcroucki4pcz4r@chatter.i7.local>
Mail-Followup-To: Kevin Hilman <khilman@baylibre.com>,
        workflows@vger.kernel.org
References: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local>
 <7hwo8p9db1.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7hwo8p9db1.fsf@baylibre.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Feb 14, 2020 at 11:30:42AM -0800, Kevin Hilman wrote:
> Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:
> 
> > I'd like your opinion on this quick helper script I wrote that uses any 
> > message-id to grab a full thread from lore.kernel.org and save it as a 
> > mbox file.
> 
> This is very useful, thank you!
> 
> One question/request: Is there a way for it to only grab a subset of a
> series?  e.g. Some series contain patches that might end up going
> through a couple different trees (e.g. DT patches typically take a
> separate path than drivers) so as a maintainer for one of the
> subsystems, I might want to only get a subset of the series into an
> mbox, not the whole thing.
> 
> IOW, Right now even if I pass a msgid from the middle of the series, it
> finds the whole series (which is cool!), but what if I want to apply
> just that single patch?  Or even better, I might want to only apply
> patches 3-5 and 9 from a 10-patch series.
> 
> Is this something do-able?

I think for such cases it's easy enough to just edit the .mbx file to 
remove the patches you're not interested in. When you use the '-a' flag, 
the content is de-mimefied to remove various mta-transmission cruft like 
quoted-printable/base64 encodings, etc -- making it easy to identify and 
remove content that is not relevant.

-K
