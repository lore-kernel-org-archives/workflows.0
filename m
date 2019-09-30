Return-Path: <SRS0=YmVK=XZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13EC2C32792
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 21:02:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D83CC224FE
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 21:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569877328;
	bh=bVvA2qNYw9P4j4XgAkU9YjGNdMHAqTCc0l+35taFt+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PrlGMBvlp5AoOh0mWBbYecyWlmJ/XUsHmCdipI/VK6sIk+CxGDnqdYnS9wIOFPN6K
	 bfAs5n6SHvUjm8hc0jheI0F1Avi1qHYMmd77Hjwc3WLcxyDN+QI+zFX2rueDX/H+op
	 VWfu4aebbfd6nTVRXVExThzer4RbSygGSNlQB/L4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731025AbfI3VCI (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 30 Sep 2019 17:02:08 -0400
Received: from mail-qk1-f181.google.com ([209.85.222.181]:41994 "EHLO
        mail-qk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730455AbfI3VCI (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 30 Sep 2019 17:02:08 -0400
Received: by mail-qk1-f181.google.com with SMTP id f16so9131534qkl.9
        for <workflows@vger.kernel.org>; Mon, 30 Sep 2019 14:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xAP+Xbl8oQ+t+H5XsJFzcZEyrglryh7+9b0QNtlpmmo=;
        b=OcjzWLNotJzEbFFdYtCDoPwMSKKgmQtvF7j316OVwWkFVXvFGSek5zM09O5IeMR+ea
         QtbkbU5aALdSb5EfC4ibLvRaQ6L45MUGOxvaznDKEROQu8Me1d1nw23oLCwYr0ivBuKg
         i7YDwTDstiD8YqjxziThK/a0Bb4d0UDuoFeRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xAP+Xbl8oQ+t+H5XsJFzcZEyrglryh7+9b0QNtlpmmo=;
        b=KZRnyBBjHURPSTYtDJpV1xFPJgf2fETFu7o2606/0dg6tZqhaMVj9mQNGQUYv1JuoW
         rwb9uJh2So/g6FhVnplCUvGPyzBAK9xaPVl2s3EK2DORfa+E+5cfiw0e3hvU1EWdrEcO
         WbNGhk0//xHxKQ2ouK2BOl0GRzHnK/BlyItfRfXnFdvWWtK17HecqJ8BRUTVM20wgol1
         da0yFZsyFiCgmc9WeQ8GqHtncKsO4VRIbpk5Ugkhlur2lgU2y9uxWj2+Zvi74kDOtlZi
         i/9kjZkbYVtVV2n8m5O+FGjDDHVRE0NE9iXKrnaLdrJYdmxMsD0E5dCvHBmM+G8cQ0vr
         NVvw==
X-Gm-Message-State: APjAAAV+2xX7ay8Fs6ASkiJeQiB1Cv22NKI3jz8SrOGX+oqhH+dOFQdP
        4U0Moiz2XPAe+xIARrmp1V4Te9KcyGzz9g==
X-Google-Smtp-Source: APXvYqxdgQc+kd0ZeqAyVZY164Qu1TqSuhPWX93wXlpUfEY9+rBaNIsC4KWcfC4qhebZHLXgNzOHPw==
X-Received: by 2002:ae9:eb8c:: with SMTP id b134mr2197950qkg.377.1569877327228;
        Mon, 30 Sep 2019 14:02:07 -0700 (PDT)
Received: from pure.paranoia.local ([87.101.92.157])
        by smtp.gmail.com with ESMTPSA id u123sm6145057qkh.120.2019.09.30.14.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 14:02:06 -0700 (PDT)
Date:   Mon, 30 Sep 2019 17:02:04 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Neil Horman <nhorman@tuxdriver.com>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20190930210204.GD14403@pure.paranoia.local>
References: <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
 <20190924185312.GD6041@hmswarspite.think-freely.org>
 <20190924202423.GA14425@pendragon.ideasonboard.com>
 <20190924222502.GA11633@hmswarspite.think-freely.org>
 <20190925205036.GA7763@pendragon.ideasonboard.com>
 <20190926004045.GA20302@localhost.localdomain>
 <20190928185848.76c85a9d@oasis.local.home>
 <20190929115722.GA26820@hmswarspite.think-freely.org>
 <CACT4Y+Z8_fABZSXahiGaOxKiPa+K3hxhvH8EVenuuqOs3aCwZg@mail.gmail.com>
 <20190930010054.GA2973@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190930010054.GA2973@localhost.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sun, Sep 29, 2019 at 09:00:54PM -0400, Neil Horman wrote:
> I agree that newer review solutions (of the type you ennummerated) rely
> on centralization of information, which is undesireable in many cases,
> but I'm not sure how to avoid that.  
> 
> Just thinking off the top of my head, I wonder if a tool that converted
> all forge type conversations to git notes would be useful here.  Those
> could then be pulled by individuals for review and update?

Git notes have important scaling problems -- they create a file per each
note, so git performance will degrade linearly. With only a few notes
this isn't such a big deal, but if we imagine scaling this up to kernel
workflows, this will quickly start to cause problems. Git notes also
cannot be cryptographically signed (in a way that's supported natively
by git), so it's another reason not to consider them for anything
important.


-K
