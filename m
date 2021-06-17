Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDFBC2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 14:59:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21DFE613F0
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 14:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbhFQPBr (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 11:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbhFQPBq (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 11:01:46 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00D6C061574
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 07:59:37 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id c9so3487180qkm.0
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 07:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5NwPCS45hYK6l/3+iEFr7YL2o3nd52Cm+p3o1/Jvqgc=;
        b=gh4G9OaaIjcarcqdBviPL0xP2AhAS49QTi8gvtp9apvn0a0Txw+8hHxT9TZWauo2hj
         Kk2awJ2XC0i3//0PqNWNRthwqctkI8rRXLcUsPi6gi2zkaX0TMVR/IdT6tigsemlXH3P
         ogpcebkiGPzk8GdnpwRfRVz/mfwCEiLu1uL/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5NwPCS45hYK6l/3+iEFr7YL2o3nd52Cm+p3o1/Jvqgc=;
        b=Xdn7GrThvwYGx+XzQrndD9MIKvm/5yjskg1pkCWFCCgg7An/tDY4Vv5uL56fNx8AEv
         s1x3kPBc2dBJnUIUqWCrcx+hxgRE1Zx/BZKrXWiAmNOxxSnGOkM09K7yMAhhH8KqQDdg
         CVlKqFNupZUNJfICnfJLvEyrJzUboDiD+CAkfcum8DFHNzj8W4BY4ID3P5/BA0zb12xH
         TP4hqARJXzMVRZB2ZlCMg85/Z2XsqmN6o4mu03kc3pl5YTU41/Aa0Ve7JZvbuWhYirEK
         LzwzADQZA+pYx3Hkwim/HrAj7s8ZlEC2mytQZ3wiy6uyosnDDuKX2Kex9V0lp48MKTB3
         Hn3Q==
X-Gm-Message-State: AOAM5301D4p2ASKpG1Jff7uBqxYixZt/7INhTTOXUhLiwGJhP+rCFrDy
        xVTL0ylH/BsEkyoSb64m8yQ3YJPrdk6vuwDm
X-Google-Smtp-Source: ABdhPJwTqO/Yd7C+jqHuPWzXdmDHKoz0C9FrEe/VOEBr7HzjIZZrwcr6iee5tDuS6FUuL/u6xAsb8Q==
X-Received: by 2002:a37:e20f:: with SMTP id g15mr4251766qki.332.1623941976663;
        Thu, 17 Jun 2021 07:59:36 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id i26sm1393052qka.86.2021.06.17.07.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 07:59:36 -0700 (PDT)
Date:   Thu, 17 Jun 2021 10:59:34 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Greg KH <greg@kroah.com>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <20210617145934.jsbapuf65b5t54q4@nitro.local>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <YMr5+ibXI5huLy7h@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YMr5+ibXI5huLy7h@kroah.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jun 17, 2021 at 09:30:02AM +0200, Greg KH wrote:
> What ever repo you put this on, it's going to take constant maintenance
> to keep it up to date and prune out the PRs that are going to accumulate
> there, as well as deal with the obvious spam and abuse issues that
> popular trees always accumulate.
> 
> Linus has already said to not do it on his "tree", and I offer a full
> "all branches" kernel mirror on github as well, but I don't want to be
> responsible for this type of mess.
> 
> So perhaps you get a new kernel.org "mirror" account somehow and put it
> there?  But again, someone will be responsible for keeping it alive and
> clean, a thankless task that will take constant work.

Well, part of the goal at the LF is to make maintainers' lives easier, so if
we can dedicate part of someone's LF-paid time to make the lives of 100
maintainers better, then it's a worthwhile investment. :)

-K
