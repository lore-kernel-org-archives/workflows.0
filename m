Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D68C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 12:00:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A5C9218DE
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 12:00:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="DCL2QFuk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbfJOMAw (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 08:00:52 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46765 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbfJOMAw (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 08:00:52 -0400
Received: by mail-oi1-f195.google.com with SMTP id k25so16503491oiw.13
        for <workflows@vger.kernel.org>; Tue, 15 Oct 2019 05:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kFRLQDxh3E6G7pQUnPq9bEfjj1USVyqtiH8jLBEs8RU=;
        b=DCL2QFukotGxxQeYeQXij73+rXVBLsmSBnVvt3bUnXmRkhEbtUhK+qBpN3DlNvvJmI
         2mgePfIRzSebmzg1jiF05uSuCotKQDlejeyLriHonWlecWRKZ/JxzJDCg5yeJ0QI7A9s
         LNwcJjS+oF9o+QvHEhT8IDw+uNMYInRSYIfhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kFRLQDxh3E6G7pQUnPq9bEfjj1USVyqtiH8jLBEs8RU=;
        b=Xla6o7larGfepxw6pgPzYMG8tBDmUGRzD/QYoiQq4i6xANJlJFS6pJRLCjKSCpbgZc
         l0ucnR9K4IknQnNhklXGXKlhn63idLO0TpSevFNThJ2UXSrTtVZOBoIyidKmM/oh4Ky7
         Eao9P4SlMu45Bd9xeG30yTEN5cVqGZeAJ1XwsQjG54nET4C9LQkuBcDdVH3Phuy0tUBZ
         7CV+1hEkiiuqC3sh4wrivRG6AgYBt8rwt9vbW+CRhtlKyCzpA5EcMwbK44qKMwSinmzU
         ZFSVgM/eaChcHDcKg2IfMxVv4ztb5EbeCkjBsE2PbRJUCshWQrJGKVGplEurMANSeBZI
         BWeA==
X-Gm-Message-State: APjAAAV2KHJ6QcUhgQjYdMBduVVSKm06XOBAhsW33CdTbkGYmNGSMGmC
        1XpocYZWSRhjXZkrbNZUckcOjullEtT4oGqe2P5hnQ==
X-Google-Smtp-Source: APXvYqwcllnpIOPfeHGCyIRG4wadNzXbClEGymHQE0jXkB96AmpBEffTumMp6DgH1P0XUvA/QY1BoZJryLbFtE6rT2A=
X-Received: by 2002:aca:e046:: with SMTP id x67mr3208950oig.101.1571140848844;
 Tue, 15 Oct 2019 05:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191007211704.6b555bb1@oasis.local.home> <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home> <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local> <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local> <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu> <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015015425.GA26853@mit.edu>
In-Reply-To: <20191015015425.GA26853@mit.edu>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 15 Oct 2019 14:00:36 +0200
Message-ID: <CAKMK7uGtvqFSw+wOBeGjV88DeyUoMTV3+F4Fpqv6NGUBCkAAgA@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Han-Wen Nienhuys <hanwen@google.com>,
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

On Tue, Oct 15, 2019 at 3:56 AM Theodore Y. Ts'o <tytso@mit.edu> wrote:
>
> On Mon, Oct 14, 2019 at 09:08:17PM +0200, Han-Wen Nienhuys wrote:
> > To 1) : Konstantin was worried about performance implication on git
> > notes.  The git-notes command stores data in a single
> > refs/notes/commits branch. Gerrit actually uses notes (the file
> > format) as well, but has a single notes branch per review, so
> > performance here is not a concern when scaling up the number of
> > reviews.
> >
> > To 2) : Google needs special magic sauce, because we service hundreds
> > of teams that work on thousands of repositories. However, here we're
> > talking about just the kernel itself; that is just a single
> > repository, and not an especially large one.  Chromium is our largest
> > repo, and it is about 10x larger than the linux kernel.
>
> I'd be concerned about cgit, because we need to have a separate file
> for the reviews, and you mean a single notes branch per review; a
> single patch series can have dozens of revisions, with potentially
> dozens of people commenting a large number of times, with e-mail
> threads that are hundreds of messages long.  If all of these changes
> are being squeezed into a single notes file, it would be quite large,
> and there would also be a lot of serialization concerns.  If you mean
> that there would be a single git note for each e-mail in a patch
> review thread.... that would seem to be a real potential problem for
> cgit.
>
> Be that as may, that's an optimization problem, and it is solveable,
> in the same way that most things are a Mere Matter of Programming.
> And if you're right, and it's not actually going to be a problem, then
> Huzzah!  But I suspect Konstantin's worries are probably ones we
> should at least pay attention to.
>
> > Gerrit isn't a big favorite of many people, but some of that
> > perception may be outdated. Since 2016, Google has significantly
> > increased its investment in Gerrit. For example, we have rewritten the
> > web UI from scratch, and there have been many performance
> > improvements.
>
> I agree that Gerrit might be a good starting point, having used it to
> review changes for Google's Data Center Kernels, as well as for
> Android and ChromeOS/Cloud Optimized System kernels.  Indeed, if I'm
> forced to use a non-threading mail user agent, it's far superior to
> e-mail reviews.
>
> Even if you have a threading mail agent, if everyone is using it, I'd
> argue that Gerrit is better, because it makes it really easy to look
> at the various versions of the patch series, including "give me the
> diff between the v3 and v7 version of the patch".  Having the
> conversation about a particular hunk of code in-line with the code
> itself is also very helpful.
>
> So let's talk about the sort of features that might need to be added
> to allow Gerrit to work for upstream development.
>
> > Gerrit has a patchset oriented workflow (where changes are amended all
> > the time), which is a good fit to the kernel's development process.
> > Linus doesn't like Change-Id lines, but I think we could adapt Gerrit
> > so it accepts URLs as IDs instead.
>
> Yep, I don't think this is hard.
>
> > There is talk of building a distributed/federated tool, but if there
> > are policies ("Jane Doe is maintainer of the network subsystem, and
> > can merge changes that only touch file in net/ "), then building
> > something decentralized is really hard. You have to build
> > infrastructure where Jane can prove to others who she is (PGP key
> > signing parties?), and some sort of distributed storage of the policy
> > rules.
>
> So requiring centralized authentication is going to be.... hard.
> There will certainly be some operations which will require
> authentication, sure.  But for things like:

What we do on gitlab.freedesktop.org is allow you to log in using
other hubs like github. As long as
patchwork/gerrit/whatever.kernel.org supports OAuth we could add a
simple "log in using kernel.org" button and it'd be a one-click thing.
And everyone can still choose where they want to have their main
account. Imo that's good enough (but I don't have strong opinions
here).

>   * Submitting a patch for review
>   * Making comments on a patch
>
> Adding a formal +1 or +2 vote, or actually approving that the patch be
> merged will obviously require authentication.  But as much as
> possible, a valid e-mail address should be all that's necessary for
> what people currently do using e-mail today.
>
> As far as a federated tool is concerned, I don't think we need to
> encode strict rules, because so long as we have a human (e.g., Linus)
> merging individual subsystem trees, I think we can let maintainers or
> maintainer groups (who, after all, today have absolutely control over
> their git trees) work out those issues amongst themselves, with an
> appeal to Linus to resolve conflicts and to make a final quality
> control check.
>
> Solving the problem of replacing how a maintainer or maintainer group
> reviews patches for their subsystem, and doing the review for patches
> that land in an a particular subsystem's git tree is a much simpler
> problem.  And if we can solve this, I think that's sufficient.
>
> But what this *does* mean is that sometimes patches will be cc'ed to
> multiple mailing lists, we need to map that into the gerrit world of a
> patch being cc'ed to multiple git trees.  The patch series might only
> end up landing in a single git tree, or it might be split up and with
> some commits landing in the ext4.git tree, and some in the btrfs.git
> tree, and some in the xfs.git tree, with some prerequisite patches
> landing on a separate branch of one of these trees, which the
> maintainers will merge into their trees.
>
> Today, this can be easily done by cc'ing the patch to multiple mailing
> lists.  Exactly how this works may get tricky, especially in the
> federated model where (for example) perhaps the btrfs tree might be
> administered by Facebook, while the xfs tree might be administrated by
> Red Hat.  Given that we *also* have to support people who want to keep
> using e-mail during the transition period, it may be that using
> unauthenticated e-mail messages where comments are attached quoted
> patch hunks, perhaps that can be the interchange format between
> different servers that aren't under a common administrative domain.

Last time I looked none of the common web ui tools (gerrit, gitlab,
github) had any reasonable support for topic branches/patch series
that target multiple different branches/repositories. They all assume
that a submission gets merged into one branch only and that's it. You
can of course submit the same stuff for inclusion into multiple
places, but that gives you separate discussion tracking for each one
(at least with the merge/pull request model, maybe gerrit is better
here), which is real bad.

> In *practice* hopefully most of the git/Gerrit trees will be
> administrated by Linux Foundation's kernel.org team.  But I think it's
> important that we support a distributed/federated model, as an
> insurance policy if nothing else.

If we go with any of the tooling changes discussed here I expect it'll
be a per-subsystem choice on what's the preferred thing, e.g. I don't
expect drm to move away from freedesktop.org because we have all our
userspace there. At that level interop with email-based pull requests
should be good enough. Better would be if you could somehow do
"foreign" submissions, which just point at a merge/pull request at the
other submission (maybe just use the git pull line) and internally
track/forward all comments or stuff like CI status. But I'm not aware
of any standard for this.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
