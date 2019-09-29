Return-Path: <SRS0=PzcX=XY=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEC0C4360C
	for <workflows@archiver.kernel.org>; Sun, 29 Sep 2019 12:55:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC00720863
	for <workflows@archiver.kernel.org>; Sun, 29 Sep 2019 12:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s9ljEJTj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbfI2Mzk (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 29 Sep 2019 08:55:40 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:43358 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbfI2Mzk (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sun, 29 Sep 2019 08:55:40 -0400
Received: by mail-qt1-f193.google.com with SMTP id c3so13323021qtv.10
        for <workflows@vger.kernel.org>; Sun, 29 Sep 2019 05:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3aKje3OBAOGT7Wn+G7DhSX5yN72OxZcgaooBkZr839w=;
        b=s9ljEJTjAON7hpdOBPg56Fdho5T7+eIS77TDicTARnLRP4G7wzakT5Vc9H9lJOi5/s
         sdd3BYaKb8MPJWvfSGJHgu0qLLgp3MdXWkSiLn6HGc7PT5c1V/KuUg/u/BVf2dWVhBhU
         k/WlOMKZVpYHHkzD0WvI7nbNrew4kapF1HGQY6EKYirRwBNPzcEx8BkCGIaDI20BbQUt
         M/hBYNJyMJCwluAH6s2+vn5hwaie2NiVeSGg2hk/w6g6iAkMO4+mmOR7AVoHV7QidoAf
         +wyNUVpdFkKkNX65PppD3T8M6bxDAZO5vjq8Scs2dvI33BdQPCnWBIJF35pLSD09n8iO
         +N+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3aKje3OBAOGT7Wn+G7DhSX5yN72OxZcgaooBkZr839w=;
        b=X5C7jbfJoKkxkv7zadC+gETLl4KKObaeaZNkfXRtt0rTWAK7JNuYcD4ijexCXTje1C
         YEFdC67z2rdZvL96y4PpAnVFyWOndaX/mpdlGE/+pultnBPh0i20j9E1eT6nG5mTqPQE
         l8UWbiyd7zqs+04IJ+KFXIacVuPqKAN01K7CRb7SUoMJqrSseLqxKwztSqibS4izdRwj
         4ywA2RFwylIvAKPKtakD5cIeEchuA33Rk7ZVPpP+KLOtP5V+14GjezUGU1BIyDq+cdPp
         P6EG2SqXqVDrJ5UmhJIuvk/kHZY9f5T8tsRcG+cdD/yf6bcCSi7qevDmaSIt6mKBkQHV
         X6LQ==
X-Gm-Message-State: APjAAAXEjUjOvPieZLaPIXzpn9jBy1FZprOt/pv7TN9jD64uUIb83vkO
        G54JeV91GKKJu2wms/Uzl6oP0IjqH9idRsPl9d4I8Zacd64=
X-Google-Smtp-Source: APXvYqxByVQy+7AIoqBELHRwrBdGAtbrMpAwgJJAbgOHT16QCjfFHr4NNGpECCZV/pFfI87vFfEqLCsWCnTZ+8p8puA=
X-Received: by 2002:a0c:e849:: with SMTP id l9mr16540902qvo.84.1569761738622;
 Sun, 29 Sep 2019 05:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura> <20190924185312.GD6041@hmswarspite.think-freely.org>
 <20190924202423.GA14425@pendragon.ideasonboard.com> <20190924222502.GA11633@hmswarspite.think-freely.org>
 <20190925205036.GA7763@pendragon.ideasonboard.com> <20190926004045.GA20302@localhost.localdomain>
 <20190928185848.76c85a9d@oasis.local.home> <20190929115722.GA26820@hmswarspite.think-freely.org>
In-Reply-To: <20190929115722.GA26820@hmswarspite.think-freely.org>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Sun, 29 Sep 2019 14:55:25 +0200
Message-ID: <CACT4Y+Z8_fABZSXahiGaOxKiPa+K3hxhvH8EVenuuqOs3aCwZg@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Neil Horman <nhorman@tuxdriver.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sun, Sep 29, 2019 at 1:57 PM Neil Horman <nhorman@tuxdriver.com> wrote:
>
> On Sat, Sep 28, 2019 at 06:58:48PM -0400, Steven Rostedt wrote:
> > On Wed, 25 Sep 2019 20:40:45 -0400
> > Neil Horman <nhorman@tuxdriver.com> wrote:
> >
> > > Eventually, barring any really significant objection, hes going to make
> > > the switch, and users will either have to get github accounts, or stop
> > > participating in netdev development.
> >
> > That will be a very sad day if that happened.
> >
> > Whatever service should have an email interface. For example, if I get
> > a message from bugzilla.kernel.org, I can reply back via email and it
> > is inserted into the tool (as I see my Out of office messages going
> > into it. I need to fix my scripts not to reply to bugzilla).
> >
> Forge solutions do have the ability to use email as an interface to
> issue tracking, thats not a problem.  What they don't currently seem to
> have is the ability to emulate patch review workflows.  And thats not to
> say they couldn't, but it seems to me that they haven't prioritized that
> because they offer several different types of comment options
> (commenting in the pull request discussion(s) themselves vs commenting
> on code, etc.  If they sould implement that, I think alot of this would
> become alot easier.
>
> > I set up patchwork on my INBOX, as I'm having a hard time of separating
> > patches from the noise. And it works really well. I would love to be
> > able to push my patchwork list to a public place so that others can see
> > it too. As mentioned in the Maintainers Summit, it would be great to be
> > able to pull patchwork down to my laptop, get on the plane, process a
> > bunch of patches while flying, and then when I land, I could push the
> > updates to the public server.
> >
> > That's pretty much all I'm looking for.
> >
> I think what you are looking for here is a way to pull down a set of
> merge requests, review and merge those you approve, and push them back
> when you are back online?  I think you can do at least some of that.
> Forge solutions (definately gitlab, likely github), allow you to pull
> a merge request reference namespace (on gitlab its
> heads/merge_requests/<merge_request_id>).  You can merge whatever head
> there you like to its intended target branch, and when you push, it will
> update the corresponding MR to the MERGED state.  What you can't
> currently do is make a comment on an MR, store that comment in git and
> then have the MR updated with those comments.  That would be a great
> item to make that feature more complete.

One mismatch with kernel dev process that seem to be there for lots of
existing solutions (gerrit, git-appraise, github, gitlab) is that they
are centered around a single "mail" git tree (in particular,
gerrit/git-appraise check in metainfo right into that repo). Whereas
kernel has lots of kernels. Now if Steve is CCed on lots of changes
what git tree should he pull before boarding a place? For some changes
it may be unclear what tree they should go into initially, or that may
change over time. Then, there are some additional relations with
stable trees.
I suspect that kernel tooling should account for that and separate
changes layer from exact git trees. Like mailing lists. Usually there
is 1 mailing list and 1 git tree per subsystem, but still this
relation is not fixed and one can always CC another mailing list, or
retarget the change, etc.
What do you think?
