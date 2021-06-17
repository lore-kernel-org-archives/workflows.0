Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB867C2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:11:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FF5961241
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:11:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbhFQPOG (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 11:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbhFQPOG (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 11:14:06 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8341EC061574
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 08:11:58 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id g142so3475139qke.4
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 08:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gNQNkkB6MYG81mlVLjYKu7MHm/TjnrFk2ndbTFxX7aY=;
        b=cBLOFXPCDNfjlEhC7/kFp/dcUCj88TFPr8MvgW2Mp4W4TY8472GosApPIjrD5xDzFX
         J2QjIYfnKhrEaZtOmxmSRVcCDKMCEOJeRMjzBFzrtX2XWQqh+YiMKWGJLAOl1bXKAlBs
         zSRAjrt+tYCV5Ro38xkqKv3KTohhE4spQlzHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gNQNkkB6MYG81mlVLjYKu7MHm/TjnrFk2ndbTFxX7aY=;
        b=PkcICjyhohtxlAeT1FCdTwCm2e+5FvAr256JN2mwV/4OHduItLj057TDEX36QgAFu/
         MR137pA90qMsRrM1wx2RRqRszHWNjM4qmYQpNZMP/x0s+r9OsBwXBp+x2DXM1oaCnTkz
         pjHLG3vvwrJG2Aa8SLl8D0AX85X8SQCUWEmGWuTjj5fkzRrxgBRueR8VfWtehgnfeDvE
         hlpgQYawHxJAj2UNg2WdA93xrW/O1ZvHxm70u/8atGEdB51hUIkKJ29C0dyYqm7ylAFU
         VxhpuZ5IGzT45SMhnKrdOgcebkrtbf3Jm8FjX1DXTj8QVZ/TFGwWeAw8LxEE55LAaY7a
         2+vw==
X-Gm-Message-State: AOAM5333uvWzAPTAZeviDjv35W+bu0oATZpdeY+xByzboQxohBadxhYs
        OqT38D7+xYZd5LKOr6T+9PNupaQO5cCu5h06
X-Google-Smtp-Source: ABdhPJzkSry7m/0hMqHgy18D2ewWm8MfKwYDcUXTSctKNITR3IlXCTEeFVGrWiOT64Le/13WJa5vHQ==
X-Received: by 2002:a37:58c:: with SMTP id 134mr2698238qkf.81.1623942717686;
        Thu, 17 Jun 2021 08:11:57 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id l14sm3422986qtj.26.2021.06.17.08.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 08:11:57 -0700 (PDT)
Date:   Thu, 17 Jun 2021 11:11:55 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Willy Tarreau <w@1wt.eu>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <20210617151155.27vveohhnhe745d7@nitro.local>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <20210616201011.GA2348@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210616201011.GA2348@1wt.eu>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jun 16, 2021 at 10:10:11PM +0200, Willy Tarreau wrote:
> In haproxy we have a bot that forwards PRs to the mailing list. It
> CCs the author and sends a gentle message saying that reviews are
> made in public using plain-text e-mails, and that for this reason
> the PR is automatically closed. And I think it's easier for both
> sides, because users who are used to PRs would probably count a bit
> too much on the "github mode", where they're certain that someone
> will eventually notice that the PR count went from 1137 to 1138 and
> will have a look, while it's certain that there will be quite some
> losses, and by warning the submitter upfront there is less surprise.

Good to know. I was only aware of GitGitGadget, so knowing that HAProxy does
it as well is useful. Unfortunately, I can't really use much of GitGitGadget
code as it's too closely integrated into Azure and is written in typescript,
which I don't know at all.

-K
