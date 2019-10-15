Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682A8C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 18:58:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A6B220663
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 18:58:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lod/om/5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728950AbfJOS6b (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 14:58:31 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:42094 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727923AbfJOS6b (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 14:58:31 -0400
Received: by mail-vs1-f66.google.com with SMTP id m22so13872691vsl.9
        for <workflows@vger.kernel.org>; Tue, 15 Oct 2019 11:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t8cFXxLcso62O8KsTkB4BEbSL1Pv+VdVT/B9AUER5f4=;
        b=Lod/om/5kANWTTY5myGjbSieIV7R5TmHRavDQuoa7Rl1WvMnS3MYCO1ytCugcCRvJL
         UZ6w+UmfEBEPW2qZCwWI5wcC7xwoE/WFwf5Hw/Jku3s+VzhPhju1qoQw2nhDN6NaDROT
         BsCN1Zs9j7jdir3s+Gz/mbIhKeOAr9xPPfQMPuJLAhgXatDeJ/7VsCcTXksT20tJNfPy
         BJybX2Hpb1ab98nPOPRgzcdBmUYJAJdHtp1kGdZ+dJc3HWB51u3sSKH96w8c4Ms8shiq
         z1KsaoJi35ExJ9vITQM87NKA2drTkmQNGtobwaWQp4H2gB7gkQphY9N+VOJyKlUa6Ry5
         K9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t8cFXxLcso62O8KsTkB4BEbSL1Pv+VdVT/B9AUER5f4=;
        b=jk1UbiScPQJyNHQNs/cLZFr7RnSP7nU+6Yqvr7S/xB1wQjT2CZRqxcHZ8RHVaG2CKY
         6UqsvPSci5UBAfCDK7RwV1pofgHnB4NEPL5u9GDqr8ZAV0G/GN+2kCjMnwC5lUCK7CMr
         HSwJgmKHZSo2+p77pgTt1cciZF3OeU29gytoKQKk4X0ZDKDFRRhhwNYJIuiT5/3K161c
         PfpnyefAXW5K/lN9G5mZhsOIbjLIC/g00eLR1op1g6zAGht8uOjnWjpkhbemJmIpehGl
         jziUz+h/rsbsqLPvKWpf3BLKB2j6XLuAv1sr2eK/8+QVkV9/sxgg48M7/3PRJIwu9Urz
         TbiA==
X-Gm-Message-State: APjAAAVvkSZz3N7YMPG8RhlT+zxy4f/0SmCGO5VbSOwDEqYkuNB3RDdL
        LwOjyL4tf+kEwXMV7IcgKi7Z8n7tTpaXoRLHHi8vJg==
X-Google-Smtp-Source: APXvYqw0Il46IWROPXyxGTEBWtnuHb3d6rjpvmFLNNY+0yrUwQJ7mnrMz6F6uw/t8F6QTBWhXNiLMbQ8tHHmsuqjPjA=
X-Received: by 2002:a67:3209:: with SMTP id y9mr21375959vsy.231.1571165908545;
 Tue, 15 Oct 2019 11:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191007211704.6b555bb1@oasis.local.home> <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home> <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local> <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local> <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu> <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015160712.GD1003139@kroah.com>
In-Reply-To: <20191015160712.GD1003139@kroah.com>
From:   Han-Wen Nienhuys <hanwen@google.com>
Date:   Tue, 15 Oct 2019 20:58:14 +0200
Message-ID: <CAFQ2z_N0Hriv68HajKZoNg1AyXzd_GqT8a2sDoCRZkUJy_vKSA@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Greg KH <gregkh@linuxfoundation.org>
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

On Tue, Oct 15, 2019 at 6:07 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> > Gerrit isn't a big favorite of many people, but some of that
> > perception may be outdated. Since 2016, Google has significantly
> > increased its investment in Gerrit. For example, we have rewritten the
> > web UI from scratch, and there have been many performance
> > improvements.
>
> As one of the many people who complain about Gerrit (I gave a whole talk
> about it!), I guess I should comment here...
>..
> Anyway, my objections:
>         - slow.  Seriously, have you tried using it on a slower network
>           connection (i.e. cellular teather, or train/bus wifi, or cafe
>           wifi?)

I did (train wifi), and found it to be workable, but it might be that
I have different expectations for speed.  If you're worried about
off-line behavior, you could run a local mirror of an Gerrit server,
and posting draft comments locally, and then use a script to post the
draft comments to the central gerrit server once you're online.

>         - Can not see all changes made in a single commit across
>           multiple files on the same page.  You have to click through
>           each and every individual file to see the diffs.  That's
>           horrid for patches that touch multiple files and is my biggest
>           pet-peve about the tool.

Have you ever tried pressing Shift + i on the change screen?

>         - patch series are a pain to apply, I have to manually open each
>           patch, give it a +2 and then when all of them are reviewed and
>           past testing, then they will be merged.  Is a pain.  Does no
>           one else accept patch series of 10-30 patches at a time other
>           than me?  How do they do it without opening 30+ tabs?

How would you want it to work otherwise? I assume that you are
actually looking at each patch, and would want to record the fact
they're OK with a +2.

If you're the boss of the project (like in your mbox scenario below)
and are in charge of the gerrit instance, you can remove all the
review requirements, but restrict merge privileges to yourself. You'd
have a "merge including parents" button on the tip of the patch series
without any voting requirements.

> And, by reference of the "slow" issue, I should not have to do multiple
> round-trip queries of a web interface just to see a single patch.
> There's the initial cover page, then there's a click on each individual
> file, bring up a new page for each and every file that was changed for
> that commit to read it, and then when finished, clicking again to go
> back to the initial page, and then a click to give a +2 and another
> click to give a verified and then another refresh of the whole thing.

The 'verified' label was meant for automation systems. If you click
the 'verified' label yourself, that suggests that there is no test
automation for this project, and maybe you should just ask the admin
to disable this label.

> When you are reviewing thousands of patches a year, time matters.
> Gerrit just does not cut it at all.  Remember, we only accept 1/3 of the
> patches sent to us.  We are accepting 9 patches an hour, 24 hours a day.
> That means we reject 18 patches an hour at that same time.


I'm curious how you come to this number. When I look at Linus' tree.

git show --no-merges
43b815c6a8e7dbccb5b8bd9c4b099c24bc22d135..8e0d0ad206f08506c893326ca7c9c3d9c=
c042cef
| grep ^Date | wc

This range is two recent merge commits by Linus about 232 hours apart.
During that window, 386 non-merge change were merged, ie. about 1.6
commit/hour.

> And then there's the issue of access when you do not have internet, like
> I currently do not right now on a plane.  Or a very slow connection.  I
> can still suck down patches in email apply them, and push them out.
> Using gerrit on this connection is impossible.

there is actually a TTY interface to gerrit that has a local cache,
but i'll admit I have never tried it.

> > Building a review tool is not all that easy to do well; by using
> > Gerrit, you get a tool that already exists, works, and has significant
> > corporate support. We at Google have ~11 SWEs working on Gerrit
> > full-time, for example, and we have support from UX research and UI
> > design. The amount of work to tweak Gerrit for Linux kernel
> > development surely is much less than building something from scratch.
>
> I would love to see a better working gerrit today, for google, for the
> developers there as that would save them time and energy that they
> currently waste using it.  But for a distributed development / review
> environment, with multiple people having multiple trees all over the
> place, I don't know how Gerrit would work, unless it is trivial to
> host/manage locally.
>
> > Gerrit has a patchset oriented workflow (where changes are amended all
> > the time), which is a good fit to the kernel's development process.
>
> Maybe for some tiny subsystem's workflows, but not for any with a real
> amount of development.  Try dumping a subsystem's patches into gerrit
> today.  Can it handle something like netdev?  linux-input?  linux-usb?
> staging?  Where does it start to break down in just being able to handle
> the large quantities of changes?  Patchwork has done a lot to help some

I am not sure I understand the question. We merge about 300 commits
per day into https://chromium.googlesource.com/chromium/src/, which
looks to be much more than what the linux kernel receives.

What do you mean with 'break down' ?

> > There is talk of building a distributed/federated tool, but if there
> > are policies ("Jane Doe is maintainer of the network subsystem, and
> > can merge changes that only touch file in net/ "), then building
> > something decentralized is really hard. You have to build
> > infrastructure where Jane can prove to others who she is (PGP key
> > signing parties?), and some sort of distributed storage of the policy
> > rules.
> >
> > By contrast, a centralized server can authenticate users reliably and
> > the server owner can define such rules.  There can still be multiple
> > gerrit servers, possibly sponsored by corporate entities (one from
> > RedHat, one from Google, etc.), and different servers can support
> > different authentication models (OpenID, OAuth, Google account, etc.)
>
> Like Daniel said, the kernel is multi-repos for a mono-tree.  I don't
> think Gerrit is set up to handle that at all from what I can see.

What problem is solved by having multiple copies of the same tree?

The normal Gerrit approach would be to have one server, with one Linux
repository, with multiple branches. Gerrit has per-branch permissions,
so you can define custom permissions (eg. merge, vote, read, amend
other people's changes) for different branches. Using branches in this
way would allow you to retarget a change to another branch without
losing the review history, or cherry-picking a change to another
branch from within the UI.

> How many people does it take to maintain an Gerrit instance and keep it
> up and running well?

To be honest, I don't know exactly, as the Google setup is very different.

Anecdotally, I hear that it is a setup and forget type of server,
except for upgrades, which require an hour or so of downtime.

--=20
Han-Wen Nienhuys - Google Munich
I work 80%. Don't expect answers from me on Fridays.
--

Google Germany GmbH, Erika-Mann-Strasse 33, 80636 Munich
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
