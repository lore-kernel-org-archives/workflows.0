Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F361C48BE6
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 17:55:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17CF2613F3
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 17:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbhFPR5Q (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Jun 2021 13:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbhFPR5P (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 16 Jun 2021 13:57:15 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD192C061760
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 10:55:09 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 5so170578qvf.1
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 10:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fb5uH11SiIFAJ0zm+0kppwefo6n9B3PFgfoUzS8z2wo=;
        b=C7L+5NWMo4WVF2MNEXjfgBjQ7Rha7pBO9oHy0Ggy2Az1I+uy823HlCQTvRDjrZun+p
         0n+IG+NcWOdqWVW/+U9bIkX/wJkqqbUfeHzVZvgCSI4iQjlUL8UAf+AvD2CUx2lN0P89
         /gwDD5be8NGowpNJpuYDI2td/+iis42hP5AGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fb5uH11SiIFAJ0zm+0kppwefo6n9B3PFgfoUzS8z2wo=;
        b=IhRimqFtzBRowRgG+YXUQ5y9DDAV1gG6K/hP2GHr8Qh4ZjT5GF+s8zuaWd4DTyPW3L
         kAItVG6H4xk/ep1g3dczJjht5PJEvDyNYEuX3wa8Oofi1upJXyS5Jpuz3oEI2yBsCXX1
         UJVLESN8M0pM+6WodwsPQNuIqIrsOi4hAWVsW7Byadm0dJIqjXL/J+TVod9L4+oRg44R
         jiyGHMNJ1bLnCL1ylgudZaqa+RGqqwN/BeWLyYWWO7mOLI7KLmTPBtuoiD9sT0xJNI3K
         fysamz8hyKo1oo/mC1Kgrvg7JEeCl6Be1wakLXrVuDP7gtsfWtfSdEd47CvRRkaDgCYX
         IIUw==
X-Gm-Message-State: AOAM531ynnAOBeExBXt2uUdHuchHURfjh1pli1yagXH2LiH0WHf0ougM
        UJDeHfS/VOCoQkapHNZTsqVhDlC0aCMf6g==
X-Google-Smtp-Source: ABdhPJzTHtWiwSBKtaYXpchkD7e7WyRxyebQDMWaQivDaFNjOvoqAZLrf/k/aGiH+HOh9hPPFNmYEw==
X-Received: by 2002:ad4:5d66:: with SMTP id fn6mr1318933qvb.12.1623866108699;
        Wed, 16 Jun 2021 10:55:08 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id w4sm1135758qkw.91.2021.06.16.10.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:55:08 -0700 (PDT)
Date:   Wed, 16 Jun 2021 13:55:06 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Johannes Berg <johannes@sipsolutions.net>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <20210616175506.pzds7shhwyec3imb@nitro.local>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <eecb639de83eb46f0ec52cc131e8ac2d4170b411.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eecb639de83eb46f0ec52cc131e8ac2d4170b411.camel@sipsolutions.net>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jun 16, 2021 at 07:47:29PM +0200, Johannes Berg wrote:
> > - We can *probably* track when patch series get applied and auto-close pull
> >   requests that are accepted -- but it's not going to be perfect (we'd
> >   basically be using git-patch-id to match commits to pull requests). Or is it
> >   better to auto-close the pull request right after it's sent to the list with
> >   a message like "thank you, please monitor your email for the rest of the
> >   process"? The latter is much easier for me, of course. :)
> 
> Those two conflict, no? I mean, if you close it, then there won't really
> be a v2/vX?
> 
> Given that many (if not most) patch series require a v2 or more, it
> would seem closing it immediately would be a bit confusing, and then
> what do you even do to get a v2?

Unless I'm misreading the docs, the submitter should be able to reopen the
closed pull request, so it's not a permanent action. This may actually make it
easier to track things for v1/v2, since we wouldn't need to continuously poll
open pull requests to see if any of them changed.

-K
