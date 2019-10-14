Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F60ECE58C
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 19:08:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83E702089C
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 19:08:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XDMbCxL0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387678AbfJNTId (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 15:08:33 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:46337 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728005AbfJNTIc (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 14 Oct 2019 15:08:32 -0400
Received: by mail-vs1-f44.google.com with SMTP id z14so11483229vsz.13
        for <workflows@vger.kernel.org>; Mon, 14 Oct 2019 12:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=THlV0L+T1s5KFNMVwT50kAHRKJH0UUqXmIVUxChsjxU=;
        b=XDMbCxL0d2NZTenuEIe+o3GE8k9DLhuKpA6oHL9E4fJC4QvNE6JhVFNYdCzXAF8d4g
         ohsj6iEZEIzGitbOKzeWCoyntwvtKf9wFvXEN8qbkymfWCdQRqmXVQ+Oh2T5kk0SCu9C
         2PJYmzdEW6y26ixEf//Fx1IUjXmBel0jAdGaS6tCwsXnGcudIpi17pXVjWPITb7H4n3U
         YHeq0+RMhoVfVx7eAjWUlD/4G65DS3v7TmGaBTlF1sGcRAsEoRtxU7ehnDTMO8syTTkP
         H4khbCG6XDA6WF5PTG6bPBElf68q1mg3JPizjeNuhyyLROGN89YfONj9sVkVJZV+J1op
         Utgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=THlV0L+T1s5KFNMVwT50kAHRKJH0UUqXmIVUxChsjxU=;
        b=RrDXJqd2mLIWlhXJi7rQNb28EawD+a+FztztuzATuNILzV5UUFgG5z+semD2a8qBtd
         8RYiZdlCLwbWmwx3aVoFKKu1jkUZxIhUtemMsSPmmqYVjl5/stwiOQsLvuRYIAzvxNfj
         ILvC3dD/lgAvVmNaJKbaE1Cu+AjQm5SMzlDINV4x16z3raN463qZ48J4luNK7rHvqaq8
         sfNVwZh26nMryR2TmwXg4QgCEa3a1HvsMq8f95F6yXmSdx7t30lzyepIVRwzPCaI5sBz
         kOVwDgbz+P3SGcCq2C1zJQEmt/LzYQ2sUcnfM7uod21PxmHjjjgzBMtnRLKWd0M4Em1F
         KZfg==
X-Gm-Message-State: APjAAAVmg7lBI6WkU8QmAtWpLk/QOpMfN3huTSEe2NGSzk1m02xGxD7b
        WdX+yjWpWNBjQD0OfSGdhttLWRDpLp4mVVXbGSfQRA==
X-Google-Smtp-Source: APXvYqy/4lT1j/g3DXXaCs2EO6YZfQt5XMQjWYMdRiQX8jskuuEES+cva5B3lM24efQzgqBf8pgAgbg3XubwnlV9Mp0=
X-Received: by 2002:a67:f703:: with SMTP id m3mr17797152vso.204.1571080111316;
 Mon, 14 Oct 2019 12:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net> <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com> <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com> <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com> <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com> <20191010205733.GA16225@mit.edu>
In-Reply-To: <20191010205733.GA16225@mit.edu>
From:   Han-Wen Nienhuys <hanwen@google.com>
Date:   Mon, 14 Oct 2019 21:08:17 +0200
Message-ID: <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
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

(again, without html)

On Thu, Oct 10, 2019 at 11:00 PM Theodore Y. Ts'o <tytso@mit.edu> wrote:
>
> On Thu, Oct 10, 2019 at 07:52:50PM +0200, Dmitry Vyukov wrote:
> > I know you all love Gerrit but just to clarify :)
> > Gerrit stores all metadata in a git repo, all users can have a replica
> > and you can always have, say, a "backup" replica on a side done
> > automatically. Patches and versions of the patches are committed into
> > git into special branches (e.g. change/XXX/version/YYY), comments and
> > metadata are in a pretty straightforward json (this is comment text
> > for line X, etc) also committed into git, so one can always read that
> > in and transform into any other format. And you can also run Gerrit
> > locally over your replica.
>
> Konstantin has spoken about some his concerns about git's scalability,
> and it's important to remember that just because Gerrit has shown to
> work well on some very large repositories, it doesn't necessarily mean
> that it will work well on git repositories using the open source C
> implementation of git.
>
> That's because Gerrit as used by Google (and made available in various
> public-facing Gerrit servers) uses a Git-on-Borg implementation[1],
> where the storage is done using Google's internal storage
> infrastructure.  This is implemented on top of Jgit (which is git
> implemented in Java)[2].
>



Hi there,

I manage the Gerrit backend team at Google.

It is true that Gerrit at Google runs on top of Borg (Gerrit-on-Borg aka. G=
oB),

1) there is no real concern about Cgit's scalability.
2) the borg deployment has no relevant magical sauce here.

To 1) : Konstantin was worried about performance implication on git
notes.  The git-notes command stores data in a single
refs/notes/commits branch. Gerrit actually uses notes (the file
format) as well, but has a single notes branch per review, so
performance here is not a concern when scaling up the number of
reviews.

To 2) : Google needs special magic sauce, because we service hundreds
of teams that work on thousands of repositories. However, here we're
talking about just the kernel itself; that is just a single
repository, and not an especially large one.  Chromium is our largest
repo, and it is about 10x larger than the linux kernel.

Google runs gerrit in tasks with (currently) 16G memory each. There
are many large companies (eg. SAP) that run much larger instances, ie.
one can easily match GoB's performance level on a single machine.

I have been wanting to propose Gerrit as an alternative for the Linux
kernel workflow, so I might as well bring forth my arguments here.

Gerrit isn't a big favorite of many people, but some of that
perception may be outdated. Since 2016, Google has significantly
increased its investment in Gerrit. For example, we have rewritten the
web UI from scratch, and there have been many performance
improvements.

Git is a tool built to exchange code and diffs. It seems natural to
build a review solution on top of Git too. Gerrit is also built on top
of git, and stores all metadata in Git too, ie. you can mirror review
data into other Gerrit instances losslessly.

Building a review tool is not all that easy to do well; by using
Gerrit, you get a tool that already exists, works, and has significant
corporate support. We at Google have ~11 SWEs working on Gerrit
full-time, for example, and we have support from UX research and UI
design. The amount of work to tweak Gerrit for Linux kernel
development surely is much less than building something from scratch.

Gerrit has a patchset oriented workflow (where changes are amended all
the time), which is a good fit to the kernel's development process.
Linus doesn't like Change-Id lines, but I think we could adapt Gerrit
so it accepts URLs as IDs instead.

There is talk of building a distributed/federated tool, but if there
are policies ("Jane Doe is maintainer of the network subsystem, and
can merge changes that only touch file in net/ "), then building
something decentralized is really hard. You have to build
infrastructure where Jane can prove to others who she is (PGP key
signing parties?), and some sort of distributed storage of the policy
rules.

By contrast, a centralized server can authenticate users reliably and
the server owner can define such rules.  There can still be multiple
gerrit servers, possibly sponsored by corporate entities (one from
RedHat, one from Google, etc.), and different servers can support
different authentication models (OpenID, OAuth, Google account, etc.)

--
Han-Wen Nienhuys - Google Munich
I work 80%. Don't expect answers from me on Fridays.
--

Google Germany GmbH, Erika-Mann-Strasse 33, 80636 Munich
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
