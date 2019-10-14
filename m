Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0126C47404
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 06:44:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B13C205C9
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 06:44:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S3zPGB7l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729752AbfJNGoL (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 02:44:11 -0400
Received: from mail-qt1-f182.google.com ([209.85.160.182]:34503 "EHLO
        mail-qt1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729656AbfJNGoL (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 14 Oct 2019 02:44:11 -0400
Received: by mail-qt1-f182.google.com with SMTP id 3so24031488qta.1
        for <workflows@vger.kernel.org>; Sun, 13 Oct 2019 23:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4CU31Td8ihnsZJ443JknmNr805qbI8siqG1xmml6kMs=;
        b=S3zPGB7loPOfGV26+GhTU6WTFvQy9ebTyhOjSVj7kSg4BgbxeCHszW4OnQcmIZD77+
         v0hHk2R2eJowPOZGbqZAF1O1x+87WX5+lKc/rkPsHyieuI+DhgG63vmOumhEQzXj2jhd
         tmG8bvWM4nw2a3QXT9SrMa+w6Fz4o6uoOgDj1PM47detZULEKYUTjX67gZnLkp38/wrE
         8R47wEhUk+sBoPkpbs7wv3/3JOEBPAQkeWO+qot7ePaB65hI9emYPp6YIAUOgB014/vt
         /C+gv0NnSDlcSs/jyFK9ljGSULMP67++axy7qrzvkWmGY3LA7pqTdOLCMJ5zouXWOsW4
         q1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4CU31Td8ihnsZJ443JknmNr805qbI8siqG1xmml6kMs=;
        b=UOlpnHTWvnLnL/5dZVoYWVPrJOazGfiyeHJft7ICFegV3QK0+Q+4lhmTdrCz9pJhCP
         auvrAxs54rKfZJS+j6L1jkcWLarYqi/8Tuu61zzvXnguvCwv7fENGKgMRys9dcorFmmv
         AjHoK4oR8dXArBPhFxiWJEMkqhpZ3bT4ZWybNjwgndPCftuobvxGNMnLu3GHPue+5/X5
         wLWDTLzfBZ7H9UkcpwlUIMqcWck2uXtl9ak/CJ7mqxu3+F9zXoBEeX2Xg6iwl3wNI0kN
         GJmf0wzY7U5Lt/d/cGlXPI39+dFAc36nsJojzo8YD5MVoDPE6clu3GLwQPhnv88cKLwN
         9ITg==
X-Gm-Message-State: APjAAAUGKOUZF32MlDI3z6oRHVru2YmjZYtCH6g+nFfbptJzhBM7CVB8
        EgwYcgynX8h6pQx6zXdyzbC0370v5mN+c3fdSRhHDiXKWSM=
X-Google-Smtp-Source: APXvYqyW6M8TbyK6SAosL8ZasYdKsA3it0fqMB9/u30nubIjkNHaAnlXqn+kVdXwicHhvnObAjjQ0QXRqgNuCF2Xe4Q=
X-Received: by 2002:a0c:e2c9:: with SMTP id t9mr28879537qvl.22.1571035449542;
 Sun, 13 Oct 2019 23:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local>
 <CACT4Y+YddN06rOcE0jc8rVixamHSJALNvGLfzLk2moutL_9rTg@mail.gmail.com> <CAMuHMdU1cdWEfeH9pJESnVrUgWxEfcRO=c6CL=UJa7UVOkvD+g@mail.gmail.com>
In-Reply-To: <CAMuHMdU1cdWEfeH9pJESnVrUgWxEfcRO=c6CL=UJa7UVOkvD+g@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 14 Oct 2019 08:43:58 +0200
Message-ID: <CACT4Y+au9EcUuYHNW=sM6dbkXNBgiPH3uEgFTk1n9djxJAoKCw@mail.gmail.com>
Subject: Re: RFC: individual public-inbox/git activity feeds
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 11, 2019 at 9:07 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Dmitry,
>
> On Fri, Oct 11, 2019 at 7:15 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> > I also tend to conclude that some actions should not be done offline
> > and then "synced" a week later. Ted provided an example of starting
> > tests in another thread. Or, say if you close a bug and then push than
> > update a month later without any regard to the current bug state, that
> > may not be the right thing. Working with read-only data offline is
> > perfectly fine. Doing _some_ updates locally and then pushing a week
> > later is fine (e.g. queue a new patch for review). But not necessary
> > all updates should be doable in offline mode. And this seems to be
> > inherent conflict with any scheme where one can "queue" any updates
> > locally, and then "sync" them anytime later without any regard to the
> > current state of things and just tell the system and all other
> > participants "deal with it". Also, if we have any kind of
> > permissions/quotas, when are these checks done: when one creates an
> > update or when it's synced?
>
> Not unlike "git push" accepting fast-forwards only, and rejecting
> forced updates.
> Hence you cannot push the close of a bug (each bug has its own
> branch?) before merging the updated remote state first.

The update is in my private git. Nobody touched it and there are no
conflicts. The logical conflicts are in other people git's.
