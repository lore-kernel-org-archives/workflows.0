Return-Path: <SRS0=MafL=YF=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C571ECE58C
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 07:31:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 496C221E6F
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 07:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570865507;
	bh=vIuFm8uCEaDL9YXEuxVdzWOfHU7bLdR03ZgELAd+AGI=;
	h=Date:From:To:Subject:References:In-Reply-To:List-ID:From;
	b=nt474uhRY68k9JTgq5hO5epEhTadYcGNpjoPUcfu1M9Lsa4TopQiZ1PsNnM2Mwm+V
	 zn0hZpg1jsbYr9jemMnb7BGulTdCFo1eqfc66edXBxkLKxkYvKNRHhy01D0jOwndGK
	 3vKmD/IMrOo3aLv8+/pDPYKQJAs0VxHDuN3p4fnE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728977AbfJLHbq (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 12 Oct 2019 03:31:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:37920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726821AbfJLHbq (ORCPT <rfc822;workflows@vger.kernel.org>);
        Sat, 12 Oct 2019 03:31:46 -0400
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6BBB62067B;
        Sat, 12 Oct 2019 07:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570865505;
        bh=vIuFm8uCEaDL9YXEuxVdzWOfHU7bLdR03ZgELAd+AGI=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=zpkmXUD9TDhLDg1ytQdR81zKq4De+3J/b/cQPE46jXWXa3XL9fBMIb5iI0n6JlYuo
         riMawn6z+zb9EbJsUYp3Oc0MzpznzMdGTuul8ztjYaD4EFg6TnMjxfAm0iAYFiP4G5
         FvoFecNrKSUjZTTqkbVWJSdd49j3H3gkMlcMRQ/w=
Date:   Sat, 12 Oct 2019 09:31:40 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191012073140.GB2034802@kroah.com>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 11, 2019 at 04:02:28PM -0400, Konstantin Ryabitsev wrote:
> On Fri, Oct 11, 2019 at 10:57:02AM +0200, Greg KH wrote:
> > So other than that minor thing, sounds interesting.  It's hard to
> > determine just how difficult the whole "set up git and send a patch out"
> > process is for people these days given the _huge_ numbers of new
> > contributions we keep getting, and the numerous good tutorials we have
> > created that spell out exactly how to do this.
> > 
> > So you might be "solving" a problem that we don't really have.  It's
> > hard to tell :(
> 
> It is interesting that there are split views on this. The main reason why I
> was thinking about it was because the topic came up a few times already. For
> example, in a conversation last year on ksummit-discuss:
> 
> https://lore.kernel.org/ksummit-discuss/ECADFF3FD767C149AD96A924E7EA6EAF7C1EAA24@USCULXMSG01.am.sony.com/
> 
> Tim Bird mentioned that Sony developers couldn't send/receive patches
> because their corporate mail server rewrote all links to go through some
> kind of security appliance verification. If you read that thread, what we
> are discussing now is what I suggested we did then -- a web tool that could
> take corporate SMTP servers out of the equation.

Yes, compamy SMTP servers are a huge problem, which is why we have so
many contributors from gmail accounts :)

But will your "send a patch" tool work for someone behind a corporate
firewall?  If we are needing/wanting corporate contributions that bad,
by providing an end-run around their infrastructure is not going to be
seen as a "good" thing, once those corporate security teams realize what
is going on...

And again, how will the feedback loop look like here?  If joe@sony sends
me a patch, how can they respond to my response of "please fix the
change up to do X instead"?

I don't want this to be a "fire and forget" type of system where
companies submit patches through this interface and never respond.  We
already have enough examples of companies that do that today.  My last
example was a company that send out a 4 patch series, the response was
"great work, but can you resend just the last 2 so we can take them now,
and do X and Y on patches 1 and 2 so we can take them?"  That was a year
ago, with no response, when internally the developer said "I sent it
upstream, but it was rejected!".

</rant>

> (This is the same reason I generally disagree with Eric Wong about
> preserving SMTP as the primary transmission protocol -- I've heard lots of
> complaints both from kernel developers and especially from people trying to
> contribute to CAF about corporate policies actually making it impossible to
> submit patches -- and no, using a different mail server is not a possibility
> for them because it can be a firing offense under their IT AUP rules.)

So if we create yet-another-patch-submission-path, how will that
circumvent those rules?  CAF is crazy, I've been in the middle of that
many times.  I doubt the "well I didn't send it in an email, I used this
tool over here instead." will play well with their lawyers/managers to
keep them from being fired.

It's not our job to solve the "my managers are not letting me send
patches out" problem here.  To solve that requires working with the
company at a totally different level.

> > > I know this is a pretty big RFE, and I would like to hear your thoughts
> > > about this. If there is general agreement that this is doable/good idea, I
> > > may be able to come up with funding for this development as part of the
> > > overall tooling improvement proposal.
> > 
> > The workflow seems sane, and matches what most people do today, with the
> > exception that it "solves" the git send-email issue, right?  Is that our
> > biggest barrier?
> 
> Well, I can't really speak from my extensive experience as a kernel
> developer, but I *have* submitted patches to Documentation/* before.  This
> happens infrequently enough that I basically have to relearn the whole
> process from scratch, and it *is* a lot of steps. I can't fault people who
> are only familiar with the GitHub way of doing things when
> they complain that this process is a challenge for them.
> 
> Not everyone submitting changes to the kernel are going to be highly skilled
> and comfortable with the terminal and command-line tools. They may be
> submitting a documentation fix, or it can be a driver developer who never
> leaves Visual Studio submitting a small bugfix so their driver works better
> in Linux.

Simple drive-by patches for this is fine, if this type of tool will
help, as long as the feedback loop is there.

> > I would recommend interviewing some of the recent kernel mentor project
> > and outreachy applicants first, to try to determine exactly what their
> > problems, if any, were with our development process.  If they say that
> > this type of tool/workflow would have saved them hours of time and
> > energy, then that's a great indication that we should try to do this.
> 
> I don't disagree and Shuah's comments are very valuable here. However, I
> would argue that these folks don't necessarily represent the target audience
> for this tool. They may be newbies, but they join these initiatives with the
> goal of spending significant time with the kernel and its code, so they
> don't mind the effort of learning the proper way of submitting patches.

I still recommend at least talking to these developers as we _know_ they
are new to our process, so their feedback for a tool to make it easy for
people like themselves (or themselves 2 months ago), will be valuable.

thanks,

greg k-h
