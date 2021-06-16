Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B71C48BE6
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 22:00:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6183613E9
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 22:00:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233303AbhFPWCM (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Jun 2021 18:02:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:33992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233188AbhFPWCL (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 16 Jun 2021 18:02:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10F47613BF
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 22:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623880805;
        bh=nG5exM5nWDOo4WXyuGvY6uIsD8qKmcDNXp/wWw+onCo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LD7Zs5b16FUxR6ki6GjAEblg6j3WsnNbGWAR2mA47vzJTk9ZaFchJf4vP3DH9Lzdh
         PB1fdT6Y1zCKcfYFHSLeDP3OedOiiaF5qEoyoc5NVyAMAq4BDml4RCkKWj+32vb90X
         vxE8yuuUfKL+/wljfw1JvrBoUL5jeXdICMFwEHUvWb+jZ5+2HZzZCCzww6r9UBKtpn
         nn8vrhRWJ/5H3SU1H4lRQogfsz8XUGIuuxLJs5Re83Dj8hJzl+mp6JaWNzB4RxtBGA
         2FvQtu87RolzvAPSvop/O+iy7q1QhBksQQSli7zLkBC6S/AGY211eLwG/CXd2yjCUC
         d2r2hTEDovZFQ==
Received: by mail-ed1-f44.google.com with SMTP id b11so1121358edy.4
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 15:00:04 -0700 (PDT)
X-Gm-Message-State: AOAM5300mXB4JR9dY8CSmSxiQ0IF/OkwW2/65rJM7bLCP7MWuLbGHSDQ
        /MUq9Nu0Zca+UpXY0YuVasYlO0UilXD4FzLvCQ==
X-Google-Smtp-Source: ABdhPJx6ldEGesiiPK5zYO4j9NhLLGNOBbAW4zmz+iBvniPewa0QF2aEnOX1lhYPV7yk0ObcFr67VjbAu+sDHu5xjEQ=
X-Received: by 2002:a50:9345:: with SMTP id n5mr2209720eda.289.1623880803673;
 Wed, 16 Jun 2021 15:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
 <alpine.DEB.2.21.2106161416020.24906@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2106161416020.24906@sstabellini-ThinkPad-T480s>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 16 Jun 2021 15:59:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKAhtjGCVu2_YqVdpuvHJpC+TGhwWi2nYZmx3w1xT-59A@mail.gmail.com>
Message-ID: <CAL_JsqKAhtjGCVu2_YqVdpuvHJpC+TGhwWi2nYZmx3w1xT-59A@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Stefano Stabellini <sstabellini@kernel.org>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jun 16, 2021 at 3:18 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Wed, 16 Jun 2021, Rob Herring wrote:
> > > - subsystem maintainers can configure whatever CI pre-checks they want before
> > >   the series is sent to them for review (and we can work on a library of
> > >   Github actions, so nobody needs to reimplement checkpatch.pl multiple times)
> >
> > What about all the patches that don't come from the GH PR? Those need
> > CI pre-checks too. We're going to implement CI twice? The biggest
> > issue I have on CI checks is applying patches. My algorithm is apply
> > to my current base (last rc1 typically) or give up. I'm sure it could
> > be a lot smarter trying several branches or looking at base-commit
> > (not consistently used) or the git diff treeish hashes. What I'd
> > really like is some bot or script that's applying series and
> > publishing git branches with a messageid to git branch tool. 0-day is
> > doing this now. Basically, the opposite direction as others have
> > mentioned.
>
> It exists: it is called patchew and we are using it in QEMU and in Xen
> Project (https://gitlab.com/xen-project/patchew).
>
> It takes patch series off of a mailing list and commits them to a branch
> to trigger a CI-loop run. It is also able to send back a "passed" or
> "failed" email to the mailing list. It is great!

Yes, I've seen that. To me, that's really just a patchwork
alternative, and standing up a web server is not what I want. Now
maybe if someone else does and I can fetch what I need then it would
work. Otherwise, it's just another project with patch applying code
that can't be used on its own. But I doubt the patch applying would do
what's needed for Linux. According to documentation, it says it can
'Apply the patch series on top of git master'. My CI already does
that. I need apply to this git tree containing all these subsystem
trees (i.e. linux-next) and find the right base yourself. Note that
applying to linux-next itself is wrong as that's not a tree any
maintainer can apply patches to.

At the end of the day, I just want to do:

git fetch agitserver $(msgid2branch $msgid)

or

b4 am -o $msgid | a-smart-git-am-that-finds-the-right-commit-base

Rob
