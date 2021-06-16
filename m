Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A49C48BE5
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 18:14:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 605AF61450
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 18:14:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbhFPSQO (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Jun 2021 14:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbhFPSQO (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 16 Jun 2021 14:16:14 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4492C061574
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 11:14:06 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id p15so4326136ybe.6
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I6yQqhuDxEjrvkjsx3USJK1wau2JFam8brHBRNxY6MM=;
        b=oUhQIMEUWX/wta6898k+LmDBTViXPu1X7Wi6yQlkuO/syizMmEytnvS10Nk44XWmQM
         g9kKQI8KzmxTVb3eIMWhK3fcfJwpNPPkyt9YcxyPePjUtYeLyXJW/Fplm8pQxFiQNKB0
         QfCAXj81DbNsngpBAIybKi3EwOlpsORJtUyV+3+w9VXvx2eMI+/59fvFFryzwHSVwY4j
         ORTdGrPHoocx8AbKzHNb0EUSU16O5UyVLPYXnsCmw8PmPh8UVaQ/iNBFV08L8lUIm8y9
         e3BWYf22jZ4267iCTQov38OxYhhkzM5rPSU5aZ+oxYhh7fwJ4Led1sl/4zFBwci5CZuO
         WqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I6yQqhuDxEjrvkjsx3USJK1wau2JFam8brHBRNxY6MM=;
        b=WCwHWNOLLuxJfgMcVnXi26bPfFQbk2Huu/vuCn1sR9mRlrdPb6FkipgEfz88Nwua7l
         MhSOUci+NrQcv6LWXH7r+uqtqnllbRs9PQmKkS7766sk2Kfm+px2OAjBTbyyaw/gBsck
         ks6Ma5DZ3w9iQd0KhlDAA3jEi5ix92q9eiIclLxW04Z34EFK+NhTYEPzv7O/a2LOCmwF
         4H8V6uIpndpDNGLMNlhaLrz0cJlQOLXUPDyd5p+WpVKHBidIJIhRG4Fcy9BXofPDHVMb
         78Pj+YMrvU8ndWaeeeaQaNsUUxe37QmUrPiKIchAyuptbjFuHBTnkn6fXV/g2nNYU8CN
         tRjA==
X-Gm-Message-State: AOAM533ysWjqhmaFldacU8Gq5837i7pp+b2rlLEZYCH158mAEpe2Os8X
        BSXubZIaAeZ+NBxMhCdE4SfenGA7uPbR1mvYfcnjpVlZUgR8uw==
X-Google-Smtp-Source: ABdhPJwCxkQyt/gAvpCYvYByoK7emuI/fviWvug/oT/5jxfYjOMfvmj0VnFkT1qyWr+hblSxbfUWtzThdcEcsaAepYE=
X-Received: by 2002:a25:af0f:: with SMTP id a15mr453982ybh.93.1623867246187;
 Wed, 16 Jun 2021 11:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <eecb639de83eb46f0ec52cc131e8ac2d4170b411.camel@sipsolutions.net>
 <20210616175506.pzds7shhwyec3imb@nitro.local>
In-Reply-To: <20210616175506.pzds7shhwyec3imb@nitro.local>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 16 Jun 2021 20:13:55 +0200
Message-ID: <CANiq72k0_P8vxMwUT154oBRPevRKbz7-34zQ-toPjMfhAKUzrg@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Johannes Berg <johannes@sipsolutions.net>, users@linux.kernel.org,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jun 16, 2021 at 7:55 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Unless I'm misreading the docs, the submitter should be able to reopen the
> closed pull request, so it's not a permanent action. This may actually make it
> easier to track things for v1/v2, since we wouldn't need to continuously poll
> open pull requests to see if any of them changed.

For versioning, what I request at the moment is that people force-push
their PR, overwriting the previous set of commits, rather than sending
a new PR. Then people write in the GitHub-PR-message (which we use as
the cover letter) the diff/updates, if any. The bot detects changes
and pushes a new review every time, and hides its own past messages
(i.e. for previous versions).

Cheers,
Miguel
