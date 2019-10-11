Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FD6C47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 18:05:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D57982084C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 18:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570817130;
	bh=US41JbgPlHDzTHHHoe/kuGh7AaYNje/XrO2qRWnuJ6M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=1sTb+ctScWPqBFmkEV/ncRCYlPS0KTanwhCBSbElo1fM4lvsvpNhXxi/gX2Fqh91+
	 tqZ/arN3DUlXZkKV6Chd6OB+5Y4rIsf34IoDzMw3XrJGctnasX/2ayo7su3iZEAVxW
	 KiVPaqee2rUmbPUvqZDkQgBWa4uRzs5PSauJggjk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbfJKSFa (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 14:05:30 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53610 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728374AbfJKSFa (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 14:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jTBJC3Kpo/9hrxigQ2DX8TcHx7QV9nj14NYlg+PYO1Y=; b=MpcaY+fg42ltUkVVOZlQEN7LH
        TsmHzJjpTZgaz3EDZqh9OqndY8YHJ5cgyhbxKjkaUgBiJR58IGm9oCr1VZOK65tBzrjmXwEkSBCmv
        DP3+LaSHOT58alaCSJKps9u/QA2j9vkH6Q5nBYJaM9Q0PqHFE2cgJ/+u7Ez5G1cZ2TfvcE+btU0uE
        5e+a5XUsvNeg+Gzj4qPBb/0Hut3Ty8s/g23s0EIXWtWc3HsO1Y/r8ZcnQQe710fEuKYK4ulm1uoGE
        enX4SYWDm9cOXZYCqoeU18wpdnGn7fOtdScuBbizBJmJhqXku1vjs+495Ee1W4Xt+2JJRtSxPl03l
        AjTRS2edQ==;
Received: from 177.17.141.107.dynamic.adsl.gvt.net.br ([177.17.141.107] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iIzI8-0001pO-Vb; Fri, 11 Oct 2019 18:05:29 +0000
Date:   Fri, 11 Oct 2019 15:05:25 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191011150525.17b7875f@coco.lan>
In-Reply-To: <20191010195335.fmh6atylozhehftt@chatter.i7.local>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
        <20191010150729.1355f33d@coco.lan>
        <20191010195335.fmh6atylozhehftt@chatter.i7.local>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Em Thu, 10 Oct 2019 15:53:35 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> escreveu:

> On Thu, Oct 10, 2019 at 03:07:29PM -0300, Mauro Carvalho Chehab wrote:
> >> - the patch submission screen has a succession of screens:
> >>
> >>   1. a screen with a single field allowing a user to paste a URL to
> >>      their fork of the git repository.  
> >
> >This will raise the bar, as it will force all developers to have a
> >public site to host the tree. I guess only a fraction of the 4k kernel
> >devs have it... In special, the ones that just want to send us a patch
> >fixing a bug may have serious troubles implementing that.  
> 
> I don't think this will raise the bar, as Github/Gitlab allow for very 
> easy forking of https://github.com/torvalds/linux. This is also not at 
> all aimed at "all developers" -- only those that don't want to use the 
> current CLI workflow and are more comfortable with web tools like 
> Github.

I guess people have different views about what's the goal.

If the goal is to attract more developers, the focus should be on
making something that would be simpler than what we current have.

What we currently have here is that just adding this to .git/config:

	[sendemail]
	  smtpserver = smtp.gmail.com
	  smtpserverport = 587
	  smtpencryption = tls
	  smtpuser = <gmail email address>
	  from = <email address for From: field>

Is usually enough for the vast majority of the newcomers.

Using github/gitlab for Kernel development takes a lot more time
and a lot more steps than writing the above at .git/config, even
if the user already have an account there.

Also, instead of just doing:

	git send-email origin..

Your proposal will require to do:

	1) git push github_clone
	2) open the browser
	3) fill the forms, pointing to "github_clone" URL
	4) click at the submission button

That is adding a lot additional complexity. I fail to see any gain
with that.

> >>   2. next screen asks the user to select the ref to work from using 
> >>      the
> >>      list obtained from the remote. Once submitted, patchwork performs a
> >>      `git clone --reference` to clone the repository locally using a
> >>      local fork of the same repo to minimize object transfer. This part
> >>      requires that:
> >>        a. patchwork project is configured with a path to a local fork,
> >>           if this feature is enabled for a project
> >>        b. that fork is kept current via some mechanism outside of
> >>           patchwork (e.g. with grokmirror)
> >>        c. there is some sanity-checking during the clone process to
> >>           avoid abuse (e.g. a sane timeout, a tmpdir with limited size,
> >>           etc -- other suggestions welcome)  
> >
> >That would require a high bandwidth at the machine with as patchwork.
> >Also, doesn't sound a good idea to me, as the server may end by having
> >tons of open sections, most waiting for tens of minutes, in order to
> >complete git clone.  
> 
> This is actually really fast if you already have a local copy of the 
> repository with most objects. Try this yourself if you have 
> torvalds/linux.git locally:
> 
> git clone --bare -s torvalds/linux.git test
> cd test
> git remote add arm-soc https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc
> git fetch arm-soc for-next
> 
> The whole process takes a second or so and the resulting repo is 328K in 
> size.
> 
> Of course, this assumes that the remote repository isn't trying to do 
> something nasty, which is why I suggest anti-abuse precautions.

Well, one could, for example, send a pull request, let's say, from
a DRM development-based tree, into media (or vice versa), with would
require to sync the "alien" patches, just to get the ones that are
useful.

It can even be worse (still valid): the tree to be pulled could be
based on linux-next.

Here, I receive bull requests that are sometimes based on non-media
trees: it may take a few mins to get the patches.

-

Except if the idea is to have this only at kernel.org, and add an
alternates for every single other tree, even a non-nasty PR would
take a while, as not all kernel trees are hosted there.

Also, as you said, one could do something really nasty, like
sending a PR from a huge non-kernel repository into the Kernel.

Not sure how easy/hard would be to avoid that.

This could even happen by mistake, as, at least on some places
(like linuxtv.org) non-kernel trees are also hosted. Btw, on media,
our patchwork instance is also used by VDR, whose project is even 
hosted elsewhere.

> 
> >> I know this is a pretty big RFE, and I would like to hear your 
> >> thoughts
> >> about this. If there is general agreement that this is doable/good idea,
> >> I may be able to come up with funding for this development as part of
> >> the overall tooling improvement proposal.  
> >
> >The procedure itself is not bad, but, if implemented, IMHO, it should,
> >instead, be something that will run at the machine of the one submitting
> >the patch. For instance, this could be a perl or python script inside
> >Kernel's ./script directory that would handle everything locally, and
> >then submit the patch via patchwork's REST API.  
> 
> I think I didn't make clear that this isn't supposed to go straight to 
> patchwork. Patchwork is merely a convenient tool where this happens -- 
> the resulting patch gets mailed out to the mailing list just as the user 
> would have done.

IMHO, doing things like "git clone" for web-based patch submission seems
a very bad idea.

Ok, we might have something that would locally run "git format-email",
and pick the formatted patches, but that's exactly the type of
cross-site scripting that most ad-blocks prevent.

So, IMHO, the best is to let the user to run a local command to
generate/validate the patchset, using his own resources to do the
task. Once everything is ok, then it could use a web-based app to
upload the patches from his local disk.

Or, just run a command-line program that would do that.

Thanks,
Mauro
