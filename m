Return-Path: <SRS0=qIWo=YJ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34961FA3728
	for <workflows@archiver.kernel.org>; Wed, 16 Oct 2019 18:57:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 047DD21A49
	for <workflows@archiver.kernel.org>; Wed, 16 Oct 2019 18:57:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V0TcRud/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436651AbfJPS5J (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Oct 2019 14:57:09 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:45702 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436653AbfJPS5J (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 16 Oct 2019 14:57:09 -0400
Received: by mail-vk1-f194.google.com with SMTP id q25so5417797vkn.12
        for <workflows@vger.kernel.org>; Wed, 16 Oct 2019 11:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A/zDaw6dT75ita7brRBB2hZ2iDo2yat8DdB8EiXu1Qw=;
        b=V0TcRud/N9uVvi0LI3uzVnZ+kFZSoK59dc4HVL9dq3vznM5hwXR2Ub/MlRlTl8jF0A
         nVvwwTCmEqvp0MdGFnNcsp+p4bD+rnaJMKPilPfvJBCJ8Ec48cUiBsNZ2g3Nck8LYhEy
         cdUK6Z3pvebeS/h7DQ51mjjRIkv02E4VOu5Wa11rz2vetpCAvNgF43npTmlRRmtUW8iR
         azXxNhCXQvXaYZf5tgRRN75sHWzedrvfjvfT3jkj/2AQmA6P5W0Of8+SvQig45pAenDO
         Hf13C1LMM+VkLiqHd1BJvMagyTTftvnuLZsJsIWIBSteFtF5QMAXzcK1QgocLYq+eLSd
         ZbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A/zDaw6dT75ita7brRBB2hZ2iDo2yat8DdB8EiXu1Qw=;
        b=NgDR+5IVZeRTCvEHT3/ztGmYa7nw4ihk9497P8i3oJ82PJdCyE1AegR56XoruoOFxQ
         EnOeRNktAaixb+MQlcd0njS2U2xfQT3MJcJmuWshak0Jt+hsrbD3Tx8+UjKBr8j5y7wr
         LvXIgFcB/ja7qBLFOzscK5oF517oe8Iq9ZrnKzpxP7YWSdwGgpnHwR/U/eH7iZtWJU/y
         fWYRsvEZIKpbi0mRB3je0p46ulHryfUZzOD0+oBBHf2PSdlfpI2K7Hf+aI8qhSiGdR9f
         RmUzZwvhgLj9kXET2WZHhASr9eca2J33327s8K9gt5PgaNdVpIjueGCIJNzRqiFiqY9e
         k3hQ==
X-Gm-Message-State: APjAAAXXfFjbhbTAeJDRLy0AVK3QnbOjz+EDWW0L1SaSSy03WP6Vu+YN
        l9+Mn4ZVxPl/R034xvOkxJKoOtj0T4lt6o3rILa7sg==
X-Google-Smtp-Source: APXvYqzM81spS5xSqjjAAKUnrM5EBCxRY2uP8SswcUNWSTtqhrJXZd2cfypr/8X1319ZQ2myf4iVxX/pYsrPr1YMJJ0=
X-Received: by 2002:a1f:ed83:: with SMTP id l125mr22809152vkh.94.1571252227910;
 Wed, 16 Oct 2019 11:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191007211704.6b555bb1@oasis.local.home> <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home> <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local> <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local> <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu> <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015015425.GA26853@mit.edu> <CAKMK7uGtvqFSw+wOBeGjV88DeyUoMTV3+F4Fpqv6NGUBCkAAgA@mail.gmail.com>
 <CAFQ2z_Pxc=0LjEieUC7Dz_sQiUKBr2oKUVrW7Fppj5AQbD_W5A@mail.gmail.com> <CAKMK7uGseMAmmLkawkaMMJgK=XAXoK+vOP8Uo9obXpss_v+WYQ@mail.gmail.com>
In-Reply-To: <CAKMK7uGseMAmmLkawkaMMJgK=XAXoK+vOP8Uo9obXpss_v+WYQ@mail.gmail.com>
From:   Han-Wen Nienhuys <hanwen@google.com>
Date:   Wed, 16 Oct 2019 20:56:53 +0200
Message-ID: <CAFQ2z_OVwS0Ups1QCEvJBFTsZmsw1u25bJh+a3xArjhXggLqcA@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Laura Abbott <labbott@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 15, 2019 at 3:45 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > Last time I looked none of the common web ui tools (gerrit, gitlab,
> > > github) had any reasonable support for topic branches/patch series
> > > that target multiple different branches/repositories. They all assume
> > > that a submission gets merged into one branch only and that's it. You
> > > can of course submit the same stuff for inclusion into multiple
> > > places, but that gives you separate discussion tracking for each one
> > > (at least with the merge/pull request model, maybe gerrit is better
> > > here), which is real bad.
> >
> > Can you say a little more about what you expect when working with
> > multiple branches/repos?
> >
> > In gerrit, you can assign freeform tags ("topics") to changes, to
> > group them. See eg.
> >
> >   https://gerrit-review.googlesource.com/q/topic:"rename-reviewdb-packa=
ge"+(status:open%20OR%20status:merged)
> >
> > this will let you group changes, that can be in different repos and/or
> > different branches. See also
> > https://gerrit-review.googlesource.com/Documentation/intro-user.html#to=
pics
> >
> > Discussions are tied to a single commit, but you can easily navigate
> > between different changes in topics, and submission is synchronized
> > (submitting one change will submit all of the topic. it's
> > unfortunately not atomic).
> >
> > This is how submissions to Android work, as Android is stitched
> > together from ~1000 repos. It is likely that this support will further
> > improve, as Android is one of our biggest internal key customers.
>
> I think gitlab is working on this under the heading of "supermerge",
> where you tie together a pile of changes for different repos under one
> overall label to keep the discussion together.
>
> For the kernel we need something slightly different:
> - There's a large pile of forks of the same underlying repo (Linus'
> upstream branch). So not a huge pile of independent histories and file
> trees, but all the same common kernel history and file layout.
> - The _same_ set of patches is submitted to multiple branches in that
> fork network. E.g. a refactoring patch series which touches both
> driver core and a few subsystems.

You're simplifying the android situation, and it's actually more
similar to the linux kernel than you think. There are several hosts
that have versions of Android (one for AOSP, one for Google, and a
couple hosts for different partners).

Then, there are a large number of branches, which represent releases.
Changes (or sets of changes across repositories) that are submitted to
one branch must then be propagated to other release branches, if they
are relevant bug fixes.

With the email workflow, isn't it hard to keep track of which patch
went into which tree? Something that tracks the identity of commit
(like Change-Id) as it travels across trees could help here.

> Afaiui Android has cross-tree pulls, but the patches heading to each
> target repo are distinct, and they're all for disjoint history chains
> (i.e. no common ancestor commit, no shared files between all the
> different branches/patches). I'm not aware of any project which uses
> topic branches and cross-tree submissions as extensively as the linux
> kernel in this fashion. Everyone with multiple repos seems to use the
> Android approach of splitting up the entire space in disjoint repos
> (with disjoint histories and disjoint files). I've done a fairly
> lengthy write-up of this problem:
>
> https://blog.ffwll.ch/2017/08/github-why-cant-host-the-kernel.html
>
> Android is a multi-repo, multi-tree approach, the linux kernel is a
> monotree but multi-repo approach. Most people think that the only
> other approach than multi-tree is the huge monolithic monotree w/
> monorepo approach. That one just doesn't scale. If you'd do Android
> like the linux kernel you'd throw out the repo tool, instead have
> _all_ repos merged into one overall git history (placed at the same
> directory like they're now placed by the repo tool). Still each
> "project/subsystem" would retain their individual git repo to be able
> to scale sufficiently well, through localizing of most
> development/review work to their specific area.

this is not really relevant to the Linux kernel discussion, but it's
more complicated:

* Android exists in several flavors (eg. the vanilla Google flavor,
AOSP, the Samsung flavor, etc.). With different subrepositories,
partners in the ecosystem can swap out components of the Android
platform as needed, while still keeping up with some of the upstream
repositories.

* Android (AOSP) is more than 600k files, ie. 10x larger than the
linux kernel, and about as large as the Chromium repo. Working with
repo that large is painful because the git client itself just doesn't
work that well to trees with that many files.

--=20
Han-Wen Nienhuys - Google Munich
I work 80%. Don't expect answers from me on Fridays.
--
Google Germany GmbH, Erika-Mann-Strasse 33, 80636 Munich
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
