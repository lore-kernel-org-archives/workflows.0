Return-Path: <SRS0=2Hi9=X3=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1597C352AA
	for <workflows@archiver.kernel.org>; Wed,  2 Oct 2019 15:05:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C57CF2133F
	for <workflows@archiver.kernel.org>; Wed,  2 Oct 2019 15:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570028704;
	bh=lkAKS+HZQPUHRcJ+R+fnqsWYJUgS72eJRfUfN0g2jQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=efS/Z3nw765UivH11wK3oafhg9wIuP+U+uD9bTsdU62/ZcJtcqYC40tAQUGW6NidN
	 PPTYYJ9jDfmCVcnl5XgyaSjH6YuWthaW/BZQKzLCMpNatH3Q2p8/pUGFrHG8QZpU1R
	 /zoxHCfOYXgGdaCKCJd2H9XtdLjNFGtJCvRLPF3Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfJBPFE (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 2 Oct 2019 11:05:04 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]:41301 "EHLO
        mail-qt1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbfJBPFE (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 2 Oct 2019 11:05:04 -0400
Received: by mail-qt1-f178.google.com with SMTP id d16so6163426qtq.8
        for <workflows@vger.kernel.org>; Wed, 02 Oct 2019 08:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oRX69xwhI/ZJDr0sqoERdlAld2qrcgQ/Y5j+SXfKPXU=;
        b=akZRQStUQdVLjyg128MoGozpCwSWbpdls+7hnmsLD5F436PO5myUsYGJ1QUSd42bm/
         2eCzVe/zGtN3FpXxk/QC2MVaV/rl0i5J6dGBZh3OKKCA2ynP/ux1UEnoSFSfBb2fxKuN
         5X+/utiARVKv4pkB5vqsDxoI2uu9hzW9aFH/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=oRX69xwhI/ZJDr0sqoERdlAld2qrcgQ/Y5j+SXfKPXU=;
        b=bYdJMYwp+93Oa0Z4fc7u102eYsqrQdbEqSQPpuArgbZ9TbuAnv2mghe8qnXwdpLKUO
         4EwZMH0y1mr+kn5DKZ1PB0EPjZs3k8/dhdPFplSmABuG6cefC++ufKpJWDzs7uqSd7E9
         4kfmsqh/UgPfo1PeYMAJfu7gYgJKWW8C0bHqhx697EKBNSjdmSDz1B0jkX36kqn418Fr
         MOHoJdaG5JGLMYEatHv+iqHsncPiIM6jNjhsPJdG2D2vCfo5Z8OPPLvhrB3Ka9iz/Ssk
         7Nc2s0nafJrw8BMHfnS1KoQorlf0VqIoNHH1lIwGrLEI5OAvKJjw75Fhg+TgjdRW1nAe
         1tyw==
X-Gm-Message-State: APjAAAXCr7e7ZFyqpFgZr8UptQEK/N5GNUJCsZDh3gLRTy2xdwearTxw
        MsVb2GoUu62muz9PoVLEmHdlKg==
X-Google-Smtp-Source: APXvYqzaleXYCyJDShrzr2bM8Fn947vINxZZqSbiTVbQqfVt29tU0WHMRnK3J+gQSplZN0J4qaOM1w==
X-Received: by 2002:a0c:921a:: with SMTP id a26mr3326078qva.98.1570028703135;
        Wed, 02 Oct 2019 08:05:03 -0700 (PDT)
Received: from pure.paranoia.local ([206.55.93.20])
        by smtp.gmail.com with ESMTPSA id h68sm9542428qkd.35.2019.10.02.08.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 08:05:01 -0700 (PDT)
Date:   Wed, 2 Oct 2019 11:04:58 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Daniel Borkmann <daniel@iogearbox.net>
Cc:     Dmitry Vyukov <dvyukov@gmail.com>,
        ksummit-discuss@lists.linuxfoundation.org, tytso@mit.edu,
        robh@kernel.org, laurent.pinchart@ideasonboard.com,
        rjw@rjwysocki.net, workflows@vger.kernel.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        helgaas@kernel.org, jikos@kernel.org, jani.nikula@intel.com,
        geert@linux-m68k.org, stefan@datenfreihafen.org, sashal@kernel.org,
        hch@lst.de, Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [Ksummit-discuss] [MAINTAINERS SUMMIT] Reflections on kernel
 development processes
Message-ID: <20191002150458.GA5611@pure.paranoia.local>
Mail-Followup-To: Daniel Borkmann <daniel@iogearbox.net>,
        Dmitry Vyukov <dvyukov@gmail.com>,
        ksummit-discuss@lists.linuxfoundation.org, tytso@mit.edu,
        robh@kernel.org, laurent.pinchart@ideasonboard.com,
        rjw@rjwysocki.net, workflows@vger.kernel.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        helgaas@kernel.org, jikos@kernel.org, jani.nikula@intel.com,
        geert@linux-m68k.org, stefan@datenfreihafen.org, sashal@kernel.org,
        hch@lst.de, Dmitry Vyukov <dvyukov@google.com>
References: <20190912120602.GC29277@pure.paranoia.local>
 <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
 <610c62f2-f2e4-2eb1-3051-53c573194f52@iogearbox.net>
 <20190930212410.GE14403@pure.paranoia.local>
 <a01ead7c-94ce-12ef-a043-6fd492c6c431@iogearbox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a01ead7c-94ce-12ef-a043-6fd492c6c431@iogearbox.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 01, 2019 at 11:33:06PM +0200, Daniel Borkmann wrote:
> > Thanks for working on this -- I've started on a similar tool in the
> > past, but got distracted and never completed it. In my implementation,
> > it was piping messages to procmail, which allowed writing complex rules
> > for folders/pre-processing, etc. May I suggest that your tool also
> > offers a stdout that can be piped to procmail?
> 
> I have a rough version working now. ;-) Just pushed to [0]. Let me know if that
> does the trick on your side, I've added example configs for procmail to the repo
> as well for getting started. Did a quick run for l2md -> procmail -> mutt and
> seems fine as far as I can tell. (Patches always welcome of course.)

Nice, thanks! Until we have a better tool for holistic patch/series
management backed by public-inbox, this should allow folks to pre-filter
their messages.

Best,
-K
