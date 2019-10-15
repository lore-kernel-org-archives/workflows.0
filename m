Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A295BC10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 19:36:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E9F620663
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 19:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571168179;
	bh=dlVmwQUbht/aoLDkXajLdTy1WjNEkltEaBBRBfLL+Vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Z4XFzbGd5I4F5tfnGtkNTyrpQRRx3x7goiTL9W41ihocgQXdsZsjVMhNTrD3f48W7
	 LorQ16WABVz65g71Zwasd/rFMJdatdB0CPg23PqbmtkctmcKUg7rvFsqogUDwzeEb/
	 R0IwY3bTEeCo557AT2js6zU/7bnkJVTD8hC7Wz7E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbfJOTgS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 15:36:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:60044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbfJOTgS (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 15 Oct 2019 15:36:18 -0400
Received: from localhost (unknown [38.98.37.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BB31621835;
        Tue, 15 Oct 2019 19:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571168177;
        bh=dlVmwQUbht/aoLDkXajLdTy1WjNEkltEaBBRBfLL+Vg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PO38UIUG2aVLNK7yelB4b2TVBOQgeoFRfeZ5SxTw+8ONUh235md2jcckSXLiKw/1y
         SkU6L7/k9sCsmwQuB5AWB7DstBZfErATj2U2MZVccUVPXZnRIqTn9/izcSmQVEoEw/
         4OvWlycuVBjXWz1FLE1vYEkUWHp+aTZi6DSgZdFQ=
Date:   Tue, 15 Oct 2019 21:33:51 +0200
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
Message-ID: <20191015193351.GB1152701@kroah.com>
References: <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu>
 <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015160712.GD1003139@kroah.com>
 <CAFQ2z_N0Hriv68HajKZoNg1AyXzd_GqT8a2sDoCRZkUJy_vKSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFQ2z_N0Hriv68HajKZoNg1AyXzd_GqT8a2sDoCRZkUJy_vKSA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 15, 2019 at 08:58:14PM +0200, Han-Wen Nienhuys wrote:
> On Tue, Oct 15, 2019 at 6:07 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > > Gerrit isn't a big favorite of many people, but some of that
> > > perception may be outdated. Since 2016, Google has significantly
> > > increased its investment in Gerrit. For example, we have rewritten the
> > > web UI from scratch, and there have been many performance
> > > improvements.
> >
> > As one of the many people who complain about Gerrit (I gave a whole talk
> > about it!), I guess I should comment here...
> >..
> > Anyway, my objections:
> >         - slow.  Seriously, have you tried using it on a slower network
> >           connection (i.e. cellular teather, or train/bus wifi, or cafe
> >           wifi?)
> 
> I did (train wifi), and found it to be workable, but it might be that
> I have different expectations for speed.

I guess it depends on your train :)

> If you're worried about off-line behavior, you could run a local
> mirror of an Gerrit server, and posting draft comments locally, and
> then use a script to post the draft comments to the central gerrit
> server once you're online.

Can you do that?  Where are instructions on how that all works?

> >         - Can not see all changes made in a single commit across
> >           multiple files on the same page.  You have to click through
> >           each and every individual file to see the diffs.  That's
> >           horrid for patches that touch multiple files and is my biggest
> >           pet-peve about the tool.
> 
> Have you ever tried pressing Shift + i on the change screen?

Nope.  Is that documented somewhere?  I'm on a plane and can't connect
to google's gerrit at the moment to test it :(

> >         - patch series are a pain to apply, I have to manually open each
> >           patch, give it a +2 and then when all of them are reviewed and
> >           past testing, then they will be merged.  Is a pain.  Does no
> >           one else accept patch series of 10-30 patches at a time other
> >           than me?  How do they do it without opening 30+ tabs?
> 
> How would you want it to work otherwise? I assume that you are
> actually looking at each patch, and would want to record the fact
> they're OK with a +2.

Sometimes yes.  But other times they were pushed there by me or by
someone else as they are imports from somewhere else.

As a very specific example of this, look at the android-3.18 kernel
branch works in AOSP.  I add about 30 patches to that tree every other
week or so.  And every time I do it I dread it.  That's not a good sign
that the tool is nice to use :(

> If you're the boss of the project (like in your mbox scenario below)
> and are in charge of the gerrit instance, you can remove all the
> review requirements, but restrict merge privileges to yourself. You'd
> have a "merge including parents" button on the tip of the patch series
> without any voting requirements.

Who "controls" permissions like this?  You need an admin, and that's
another cycle.  And if you think we need a central gerrit for kernel
development, that's not going to work :(

> > And, by reference of the "slow" issue, I should not have to do multiple
> > round-trip queries of a web interface just to see a single patch.
> > There's the initial cover page, then there's a click on each individual
> > file, bring up a new page for each and every file that was changed for
> > that commit to read it, and then when finished, clicking again to go
> > back to the initial page, and then a click to give a +2 and another
> > click to give a verified and then another refresh of the whole thing.
> 
> The 'verified' label was meant for automation systems. If you click
> the 'verified' label yourself, that suggests that there is no test
> automation for this project, and maybe you should just ask the admin
> to disable this label.

Talk to the AOSP team :)

> > When you are reviewing thousands of patches a year, time matters.
> > Gerrit just does not cut it at all.  Remember, we only accept 1/3 of the
> > patches sent to us.  We are accepting 9 patches an hour, 24 hours a day.
> > That means we reject 18 patches an hour at that same time.
> 
> I'm curious how you come to this number. When I look at Linus' tree.
> 
> git show --no-merges
> 43b815c6a8e7dbccb5b8bd9c4b099c24bc22d135..8e0d0ad206f08506c893326ca7c9c3d9cc042cef
> | grep ^Date | wc
> 
> This range is two recent merge commits by Linus about 232 hours apart.
> During that window, 386 non-merge change were merged, ie. about 1.6
> commit/hour.

You picked a small range.  Look at a whole release:
$ git show --no-merges v5.2..v5.3 | grep ^Date  | wc -l
14605

That was from July 7, 2019 - September 15, 2019.

We do a lot of merges during the 2 week merge window, everything after
that for the next 8 weeks is bugfixes.  But during that time, patches
are still flowing into maintainers branches of their trees in
anticipation of the new release window.

I suggest you look at how the development process works for the kernel,
it's a bit "different" from what you are probably thinking.  It's all in
our Documentation/process/ directory if you are curious.

> > And then there's the issue of access when you do not have internet, like
> > I currently do not right now on a plane.  Or a very slow connection.  I
> > can still suck down patches in email apply them, and push them out.
> > Using gerrit on this connection is impossible.
> 
> there is actually a TTY interface to gerrit that has a local cache,
> but i'll admit I have never tried it.

Then I have to imagine it's not maintained or used very often :)

> > > Building a review tool is not all that easy to do well; by using
> > > Gerrit, you get a tool that already exists, works, and has significant
> > > corporate support. We at Google have ~11 SWEs working on Gerrit
> > > full-time, for example, and we have support from UX research and UI
> > > design. The amount of work to tweak Gerrit for Linux kernel
> > > development surely is much less than building something from scratch.
> >
> > I would love to see a better working gerrit today, for google, for the
> > developers there as that would save them time and energy that they
> > currently waste using it.  But for a distributed development / review
> > environment, with multiple people having multiple trees all over the
> > place, I don't know how Gerrit would work, unless it is trivial to
> > host/manage locally.
> >
> > > Gerrit has a patchset oriented workflow (where changes are amended all
> > > the time), which is a good fit to the kernel's development process.
> >
> > Maybe for some tiny subsystem's workflows, but not for any with a real
> > amount of development.  Try dumping a subsystem's patches into gerrit
> > today.  Can it handle something like netdev?  linux-input?  linux-usb?
> > staging?  Where does it start to break down in just being able to handle
> > the large quantities of changes?  Patchwork has done a lot to help some
> 
> I am not sure I understand the question. We merge about 300 commits
> per day into https://chromium.googlesource.com/chromium/src/, which
> looks to be much more than what the linux kernel receives.

With as many different people as we have?  That's great.  And everything
happens in gerrit, any pointers to which one?  How many "open" items are
there at any point in time?

> What do you mean with 'break down' ?

Just try importing the patches that flow through the above mailing lists
for a month and see the rate and process for what you have to do "better
than" something as simple as email.

> > > There is talk of building a distributed/federated tool, but if there
> > > are policies ("Jane Doe is maintainer of the network subsystem, and
> > > can merge changes that only touch file in net/ "), then building
> > > something decentralized is really hard. You have to build
> > > infrastructure where Jane can prove to others who she is (PGP key
> > > signing parties?), and some sort of distributed storage of the policy
> > > rules.
> > >
> > > By contrast, a centralized server can authenticate users reliably and
> > > the server owner can define such rules.  There can still be multiple
> > > gerrit servers, possibly sponsored by corporate entities (one from
> > > RedHat, one from Google, etc.), and different servers can support
> > > different authentication models (OpenID, OAuth, Google account, etc.)
> >
> > Like Daniel said, the kernel is multi-repos for a mono-tree.  I don't
> > think Gerrit is set up to handle that at all from what I can see.
> 
> What problem is solved by having multiple copies of the same tree?

That's how we work.

> The normal Gerrit approach would be to have one server, with one Linux
> repository, with multiple branches. Gerrit has per-branch permissions,
> so you can define custom permissions (eg. merge, vote, read, amend
> other people's changes) for different branches. Using branches in this
> way would allow you to retarget a change to another branch without
> losing the review history, or cherry-picking a change to another
> branch from within the UI.

We will not have "one server" for the reasons Konstantin points out.
That's just not going to happen, for loads of good reasons.

And we have very few branches, instead, we all have individual trees.
Works out much better for a huge distributed development process.

> > How many people does it take to maintain an Gerrit instance and keep it
> > up and running well?
> 
> To be honest, I don't know exactly, as the Google setup is very different.
> 
> Anecdotally, I hear that it is a setup and forget type of server,
> except for upgrades, which require an hour or so of downtime.

I've heard the exact opposite, so the reality is probably somewhere in
the middle :)

thanks,

greg k-h
