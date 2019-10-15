Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68A3ECE588
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:07:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82837214AE
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571155664;
	bh=AWVgaEMQC7saNMS2zN+1rpv2biGaxltzjQVIyh7f0ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PqnDeIOOMWeqeh2d3Nz6BPjd47FULg4gPWnijHKWcwyajBkFMiFqVlbqRWPWnks+e
	 hYrDU20lsoAeXtO4BR1UHzHjerEJD/Gk2/ZP9jrfw8Sw7SddIT+5S56KS9pEfNoSL1
	 pUqsABgunPCAnU1ayt601iJLzglzIypeNGB8kZAU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbfJOQHo (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 12:07:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:42714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbfJOQHo (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 15 Oct 2019 12:07:44 -0400
Received: from localhost (unknown [38.98.37.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6255420640;
        Tue, 15 Oct 2019 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571155662;
        bh=AWVgaEMQC7saNMS2zN+1rpv2biGaxltzjQVIyh7f0ko=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rMkt9iXROTV9RZppIGyAETcCY+vGf6mYHu7meE6nMZVFsCgYpCyIpgzy6lFR0lsR8
         YIZ2684meAb4Ldc6PxcWcuDTy4GOR5pOHWsR3RbZUhVkkqnArccQmltIrDxwwTWNmA
         FcVOLTU7gm2LiZTbFGYLVaMh3CdycRFpPj3zaDKk=
Date:   Tue, 15 Oct 2019 18:07:12 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
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
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191015160712.GD1003139@kroah.com>
References: <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu>
 <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 14, 2019 at 09:08:17PM +0200, Han-Wen Nienhuys wrote:
> (again, without html)
> 
> On Thu, Oct 10, 2019 at 11:00 PM Theodore Y. Ts'o <tytso@mit.edu> wrote:
> >
> > On Thu, Oct 10, 2019 at 07:52:50PM +0200, Dmitry Vyukov wrote:
> > > I know you all love Gerrit but just to clarify :)
> > > Gerrit stores all metadata in a git repo, all users can have a replica
> > > and you can always have, say, a "backup" replica on a side done
> > > automatically. Patches and versions of the patches are committed into
> > > git into special branches (e.g. change/XXX/version/YYY), comments and
> > > metadata are in a pretty straightforward json (this is comment text
> > > for line X, etc) also committed into git, so one can always read that
> > > in and transform into any other format. And you can also run Gerrit
> > > locally over your replica.
> >
> > Konstantin has spoken about some his concerns about git's scalability,
> > and it's important to remember that just because Gerrit has shown to
> > work well on some very large repositories, it doesn't necessarily mean
> > that it will work well on git repositories using the open source C
> > implementation of git.
> >
> > That's because Gerrit as used by Google (and made available in various
> > public-facing Gerrit servers) uses a Git-on-Borg implementation[1],
> > where the storage is done using Google's internal storage
> > infrastructure.  This is implemented on top of Jgit (which is git
> > implemented in Java)[2].
> >
> 
> 
> 
> Hi there,
> 
> I manage the Gerrit backend team at Google.
> 
> It is true that Gerrit at Google runs on top of Borg (Gerrit-on-Borg aka. GoB),
> 
> 1) there is no real concern about Cgit's scalability.
> 2) the borg deployment has no relevant magical sauce here.
> 
> To 1) : Konstantin was worried about performance implication on git
> notes.  The git-notes command stores data in a single
> refs/notes/commits branch. Gerrit actually uses notes (the file
> format) as well, but has a single notes branch per review, so
> performance here is not a concern when scaling up the number of
> reviews.
> 
> To 2) : Google needs special magic sauce, because we service hundreds
> of teams that work on thousands of repositories. However, here we're
> talking about just the kernel itself; that is just a single
> repository, and not an especially large one.  Chromium is our largest
> repo, and it is about 10x larger than the linux kernel.
> 
> Google runs gerrit in tasks with (currently) 16G memory each. There
> are many large companies (eg. SAP) that run much larger instances, ie.
> one can easily match GoB's performance level on a single machine.
> 
> I have been wanting to propose Gerrit as an alternative for the Linux
> kernel workflow, so I might as well bring forth my arguments here.
> 
> Gerrit isn't a big favorite of many people, but some of that
> perception may be outdated. Since 2016, Google has significantly
> increased its investment in Gerrit. For example, we have rewritten the
> web UI from scratch, and there have been many performance
> improvements.

As one of the many people who complain about Gerrit (I gave a whole talk
about it!), I guess I should comment here...

Yes, it's getting "better" for speed, but it's still way way too slow.

I don't think any of the complaints I gave many years ago have been
addressed, here's a few of them off the top of my head.

And note, I have a lot of experience using gerrit, I use it all the time
for Android kernel patchs, running your latest experimental version of
gerrit, so I assume that is what you are referring to when you say it is
under heavy development.  And I do like the changes you all are doing,
it is getting better in some ways (and worse in others, but that's for a
different thread...)

Anyway, my objections:
	- slow.  Seriously, have you tried using it on a slower network
	  connection (i.e. cellular teather, or train/bus wifi, or cafe
	  wifi?)
	- Can not see all changes made in a single commit across
	  multiple files on the same page.  You have to click through
	  each and every individual file to see the diffs.  That's
	  horrid for patches that touch multiple files and is my biggest
	  pet-peve about the tool.
	- patch series are a pain to apply, I have to manually open each
	  patch, give it a +2 and then when all of them are reviewed and
	  past testing, then they will be merged.  Is a pain.  Does no
	  one else accept patch series of 10-30 patches at a time other
	  than me?  How do they do it without opening 30+ tabs?

And, by reference of the "slow" issue, I should not have to do multiple
round-trip queries of a web interface just to see a single patch.
There's the initial cover page, then there's a click on each individual
file, bring up a new page for each and every file that was changed for
that commit to read it, and then when finished, clicking again to go
back to the initial page, and then a click to give a +2 and another
click to give a verified and then another refresh of the whole thing.

In contrast, try reading/reviewing and then applying a simple 10 patch
series from an email client like I do all the time.  The patches are
local, I read the whole diff with one button press (click if you have a
graphical email client), then if it is good, one keypress to apply it,
or save it to a mbox to apply them all at once later.

When you are reviewing thousands of patches a year, time matters.
Gerrit just does not cut it at all.  Remember, we only accept 1/3 of the
patches sent to us.  We are accepting 9 patches an hour, 24 hours a day.
That means we reject 18 patches an hour at that same time.

And then there's the issue of access when you do not have internet, like
I currently do not right now on a plane.  Or a very slow connection.  I
can still suck down patches in email apply them, and push them out.
Using gerrit on this connection is impossible.

> Building a review tool is not all that easy to do well; by using
> Gerrit, you get a tool that already exists, works, and has significant
> corporate support. We at Google have ~11 SWEs working on Gerrit
> full-time, for example, and we have support from UX research and UI
> design. The amount of work to tweak Gerrit for Linux kernel
> development surely is much less than building something from scratch.

I would love to see a better working gerrit today, for google, for the
developers there as that would save them time and energy that they
currently waste using it.  But for a distributed development / review
environment, with multiple people having multiple trees all over the
place, I don't know how Gerrit would work, unless it is trivial to
host/manage locally.

> Gerrit has a patchset oriented workflow (where changes are amended all
> the time), which is a good fit to the kernel's development process.

Maybe for some tiny subsystem's workflows, but not for any with a real
amount of development.  Try dumping a subsystem's patches into gerrit
today.  Can it handle something like netdev?  linux-input?  linux-usb?
staging?  Where does it start to break down in just being able to handle
the large quantities of changes?  Patchwork has done a lot to help some
of those subsystems work better, try seeing if gerrit could even handle
netdev in a sane manner.  Try to emulate what Dave does there, on your
own, and that should give you a huge idea of what you have to work on
already today, with gerrit, in order to make it better.

> Linus doesn't like Change-Id lines, but I think we could adapt Gerrit
> so it accepts URLs as IDs instead.

change-ids are the least of the problems of gerrit today :)

> There is talk of building a distributed/federated tool, but if there
> are policies ("Jane Doe is maintainer of the network subsystem, and
> can merge changes that only touch file in net/ "), then building
> something decentralized is really hard. You have to build
> infrastructure where Jane can prove to others who she is (PGP key
> signing parties?), and some sort of distributed storage of the policy
> rules.
> 
> By contrast, a centralized server can authenticate users reliably and
> the server owner can define such rules.  There can still be multiple
> gerrit servers, possibly sponsored by corporate entities (one from
> RedHat, one from Google, etc.), and different servers can support
> different authentication models (OpenID, OAuth, Google account, etc.)

Like Daniel said, the kernel is multi-repos for a mono-tree.  I don't
think Gerrit is set up to handle that at all from what I can see.

How many people does it take to maintain an Gerrit instance and keep it
up and running well?

thanks,

greg k-h
