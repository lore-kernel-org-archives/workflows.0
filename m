Return-Path: <SRS0=PtRO=YK=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAA5ECE58E
	for <workflows@archiver.kernel.org>; Thu, 17 Oct 2019 11:50:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BCC821835
	for <workflows@archiver.kernel.org>; Thu, 17 Oct 2019 11:50:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="NmcWg707"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409317AbfJQLuK (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Oct 2019 07:50:10 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46473 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405981AbfJQLuK (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Oct 2019 07:50:10 -0400
Received: by mail-oi1-f193.google.com with SMTP id k25so1837080oiw.13
        for <workflows@vger.kernel.org>; Thu, 17 Oct 2019 04:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rem7T3rwV7ziza6f3/P3aqU+U2lj5/0oB2myqBDpaaA=;
        b=NmcWg707lhSVF2Vk/nHt0nICxRTqDsSyviU21K2CYrdUFWCmQODRZ3NlCAC6AZSv6V
         eD5VIxPEusa+BE+Eu2M6D/2CcEISOxcVSGuoi4eZavfWYypdbWWdETFGYrk/3n+W8HPz
         LDC/scj78rvgImCO5Fldo5KsQ0SHH9kM5ONIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rem7T3rwV7ziza6f3/P3aqU+U2lj5/0oB2myqBDpaaA=;
        b=LAUf1TYegDJi8xX2aggWJ+jSVg8SDHOyo+Agz+Tx0UH0lHmJ9ZgMUKHSwsRQeA6s9d
         8wP+rX2ztzBPOy4oLxBTLkexoCKskI54U6B/iKr8vymaywT+VZtNsWewKebN16nWRI6f
         CGt5o1Gj+VIIWf5om3d1wLlGsgVkSDPTBLSIuy+kKNZREeSE6XTrak9NaAAU34fThh6N
         +/8vpELaEBKzUzuxjsy3eoC+TzFAymU7pbA0dGTvoAfWiDNVB89dMuSkO4yAPwSEdCKA
         L2a0VVpvXSTF0qPqL4zNmPAYk4ecn1DY8SjHutGGXTAA8kRkyVCf39FmKtqTwGn27CXl
         Egig==
X-Gm-Message-State: APjAAAWgRY9X1CYRAnnA4whzPtholJv7O9kLdIvvrsK1gqrXdU2Rp95L
        ncYIGIrzwV/TzhJdtfOiJOmD4+pGIODtxJw6HsUMfw==
X-Google-Smtp-Source: APXvYqySXK0W4uHANyn0wzemhC6E2BZybfMLRxrmIg/KfeRhvcd0n50ErgyZAhVq8M0sOSogwycgRFuAYis8HdYJkBg=
X-Received: by 2002:aca:e046:: with SMTP id x67mr2621546oig.101.1571313008062;
 Thu, 17 Oct 2019 04:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191007211704.6b555bb1@oasis.local.home> <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home> <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local> <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local> <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu> <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015015425.GA26853@mit.edu> <CAKMK7uGtvqFSw+wOBeGjV88DeyUoMTV3+F4Fpqv6NGUBCkAAgA@mail.gmail.com>
 <CAFQ2z_Pxc=0LjEieUC7Dz_sQiUKBr2oKUVrW7Fppj5AQbD_W5A@mail.gmail.com>
 <CAKMK7uGseMAmmLkawkaMMJgK=XAXoK+vOP8Uo9obXpss_v+WYQ@mail.gmail.com> <CAFQ2z_OVwS0Ups1QCEvJBFTsZmsw1u25bJh+a3xArjhXggLqcA@mail.gmail.com>
In-Reply-To: <CAFQ2z_OVwS0Ups1QCEvJBFTsZmsw1u25bJh+a3xArjhXggLqcA@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 17 Oct 2019 13:49:55 +0200
Message-ID: <CAKMK7uHvcc4WvswnWMaiT+B7NV==DWB5MGj4KSkOMSukE+4=OA@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Han-Wen Nienhuys <hanwen@google.com>
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
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Oct 16, 2019 at 8:57 PM Han-Wen Nienhuys <hanwen@google.com> wrote:
> On Tue, Oct 15, 2019 at 3:45 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > Last time I looked none of the common web ui tools (gerrit, gitlab,
> > > > github) had any reasonable support for topic branches/patch series
> > > > that target multiple different branches/repositories. They all assume
> > > > that a submission gets merged into one branch only and that's it. You
> > > > can of course submit the same stuff for inclusion into multiple
> > > > places, but that gives you separate discussion tracking for each one
> > > > (at least with the merge/pull request model, maybe gerrit is better
> > > > here), which is real bad.
> > >
> > > Can you say a little more about what you expect when working with
> > > multiple branches/repos?
> > >
> > > In gerrit, you can assign freeform tags ("topics") to changes, to
> > > group them. See eg.
> > >
> > >   https://gerrit-review.googlesource.com/q/topic:"rename-reviewdb-package"+(status:open%20OR%20status:merged)
> > >
> > > this will let you group changes, that can be in different repos and/or
> > > different branches. See also
> > > https://gerrit-review.googlesource.com/Documentation/intro-user.html#topics
> > >
> > > Discussions are tied to a single commit, but you can easily navigate
> > > between different changes in topics, and submission is synchronized
> > > (submitting one change will submit all of the topic. it's
> > > unfortunately not atomic).
> > >
> > > This is how submissions to Android work, as Android is stitched
> > > together from ~1000 repos. It is likely that this support will further
> > > improve, as Android is one of our biggest internal key customers.
> >
> > I think gitlab is working on this under the heading of "supermerge",
> > where you tie together a pile of changes for different repos under one
> > overall label to keep the discussion together.
> >
> > For the kernel we need something slightly different:
> > - There's a large pile of forks of the same underlying repo (Linus'
> > upstream branch). So not a huge pile of independent histories and file
> > trees, but all the same common kernel history and file layout.
> > - The _same_ set of patches is submitted to multiple branches in that
> > fork network. E.g. a refactoring patch series which touches both
> > driver core and a few subsystems.
>
> You're simplifying the android situation, and it's actually more
> similar to the linux kernel than you think. There are several hosts
> that have versions of Android (one for AOSP, one for Google, and a
> couple hosts for different partners).
>
> Then, there are a large number of branches, which represent releases.
> Changes (or sets of changes across repositories) that are submitted to
> one branch must then be propagated to other release branches, if they
> are relevant bug fixes.

This isn't about branches in the sense you seem to mean here, i.e.
different releases, or the stuff various flavours/vendors cherry-pick
together, or long-term support stuff. The workflow here is:

- submit changes to subsystem A & B
- we want the discussion to be coherent across both
- the changes land either in A or B, or a mix of A and B, or in both
places (through a topic branch that gets merged into both A and B)
- both A and B send pull requests for the same merge window (big
integration fest to start each release cycle), and from then on it's
like they all landed in the same tree

This isn't about cherry-picking a set of changes or bugfixes between
flavours or release branches or anything like that. It's about making
sure that subject experts for vastly different and fairly unrelated
areas of the kernel can all work together and avoid code conflicts,
without having to work together in the same branch/repo for
everything. Since overlapping stuff is the exception, not the rule.

> With the email workflow, isn't it hard to keep track of which patch
> went into which tree? Something that tracks the identity of commit
> (like Change-Id) as it travels across trees could help here.

Yup it's a mess occasionally, but it's at least possible to have one
discussion thread with everyone on Cc: to coordinate the mess
properly.

> > Afaiui Android has cross-tree pulls, but the patches heading to each
> > target repo are distinct, and they're all for disjoint history chains
> > (i.e. no common ancestor commit, no shared files between all the
> > different branches/patches). I'm not aware of any project which uses
> > topic branches and cross-tree submissions as extensively as the linux
> > kernel in this fashion. Everyone with multiple repos seems to use the
> > Android approach of splitting up the entire space in disjoint repos
> > (with disjoint histories and disjoint files). I've done a fairly
> > lengthy write-up of this problem:
> >
> > https://blog.ffwll.ch/2017/08/github-why-cant-host-the-kernel.html
> >
> > Android is a multi-repo, multi-tree approach, the linux kernel is a
> > monotree but multi-repo approach. Most people think that the only
> > other approach than multi-tree is the huge monolithic monotree w/
> > monorepo approach. That one just doesn't scale. If you'd do Android
> > like the linux kernel you'd throw out the repo tool, instead have
> > _all_ repos merged into one overall git history (placed at the same
> > directory like they're now placed by the repo tool). Still each
> > "project/subsystem" would retain their individual git repo to be able
> > to scale sufficiently well, through localizing of most
> > development/review work to their specific area.
>
> this is not really relevant to the Linux kernel discussion, but it's
> more complicated:
>
> * Android exists in several flavors (eg. the vanilla Google flavor,
> AOSP, the Samsung flavor, etc.). With different subrepositories,
> partners in the ecosystem can swap out components of the Android
> platform as needed, while still keeping up with some of the upstream
> repositories.
>
> * Android (AOSP) is more than 600k files, ie. 10x larger than the
> linux kernel, and about as large as the Chromium repo. Working with
> repo that large is painful because the git client itself just doesn't
> work that well to trees with that many files.

I'm not saying you're having no reasons to do this. All I'm saying is
that outside of the kernel, there's not really anyone doing it like
the kernel, mostly because the popular tools just don't really support
this workflow.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
