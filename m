Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B4DC47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 08:57:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CECB021D6C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 08:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570784227;
	bh=zLdgLxl6atmFoI1c5pZbn9GED7Bn/Xk4rK80WjWcb/U=;
	h=Date:From:To:Subject:References:In-Reply-To:List-ID:From;
	b=EgMOFi1SI3PUuH0RJP3STb3SQgXnyZp1GYC2marhsge8v6/BDQ9ZjuLxfpm7iBHqT
	 NM9lPQcze7GIHLz9zbzPWS0Bh7ciM/H94Pa3AshYf2nyDgPrgMaqKOjVUohM/QQjPu
	 LWNZGJD6X4cpIUgGTOk9PuLpp9gmsEc6p54f8X4Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfJKI5H (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 04:57:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:56994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726885AbfJKI5H (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 11 Oct 2019 04:57:07 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68D0221A4A;
        Fri, 11 Oct 2019 08:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570784224;
        bh=zLdgLxl6atmFoI1c5pZbn9GED7Bn/Xk4rK80WjWcb/U=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=s5Y3qUFvj7zF30ApsHSuWW6SgdxDJbMkJM0WeQKJbyhv/40jhvkxM2CLwa4LKQXUa
         uO/EHXLW5CcGFAb3u1EuspsgNhVdn4mrAzEwb2Jz8mISQu2WFVrFah4292WpOIdUzk
         kPLaAfx8tcoO0+jUrYupp0k6XC067R9GGghbOrzY=
Date:   Fri, 11 Oct 2019 10:57:02 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191011085702.GB1075470@kroah.com>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Oct 10, 2019 at 10:41:50AM -0400, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> I would like to propose a new (large) feature to patchwork with the goal to
> make the process of submitting a patch easier for newbies and people
> generally less familiar with patch-based development. This was discussed
> previously on the workflows list:
> https://lore.kernel.org/workflows/20190930202451.GA14403@pure.paranoia.local/
> 
> How I envision this would work:
> 
> - user creates an account (which requires a mail confirmation)
> - they choose a "submit patch" option from the menu
> - the patch submission screen has a succession of screens:
> 
>  1. a screen with a single field allowing a user to paste a URL to     their
> fork of the git repository. Once submitted, patchwork does a     "git
> ls-remote" to attempt to get a list of refs and to verify that     this is
> indeed a valid git repository

s/valid git repository/valid git repository based on the kernel git tree/

Otherwise you might be sending out lots of emails for other projects :)

> 
>  2. next screen asks the user to select the ref to work from using the
> list obtained from the remote. Once submitted, patchwork performs a     `git
> clone --reference` to clone the repository locally using a     local fork of
> the same repo to minimize object transfer. This part     requires that:
>       a. patchwork project is configured with a path to a local fork,
> if this feature is enabled for a project
>       b. that fork is kept current via some mechanism outside of
> patchwork (e.g. with grokmirror)
>       c. there is some sanity-checking during the clone process to
> avoid abuse (e.g. a sane timeout, a tmpdir with limited size,          etc
> -- other suggestions welcome)
> 
>  3. next screen asks the user to pick a starting commit from the log.
> Once submitted, patchwork generates the patch from the commit     provided
> to the tip of the branch selected by the user earlier,
>     using git format-patch.
> 
>  4. next screen asks the user to review the patch to make sure this is
> what they want to submit. Once confirmed, patchwork performs two
> admin-defined optional hooks:
> 
>       a. a hook to generate a list of cc's (e.g. get_maintainer.pl)
>       b. a sanity check hook (e.g. checkpatch.pl)

I will note that many "first patch" submissions are checkpatch.pl
cleanups for staging.  When doing that, I require that they do "one
logical change per patch", which means that many of the individual
patches themselves will not be checkpatch.pl clean, because many lines
have multiple issues with them (tabs, spaces, format, length, etc.)

So other than that minor thing, sounds interesting.  It's hard to
determine just how difficult the whole "set up git and send a patch out"
process is for people these days given the _huge_ numbers of new
contributions we keep getting, and the numerous good tutorials we have
created that spell out exactly how to do this.

So you might be "solving" a problem that we don't really have.  It's
hard to tell :(

> I know this is a pretty big RFE, and I would like to hear your thoughts
> about this. If there is general agreement that this is doable/good idea, I
> may be able to come up with funding for this development as part of the
> overall tooling improvement proposal.

The workflow seems sane, and matches what most people do today, with the
exception that it "solves" the git send-email issue, right?  Is that our
biggest barrier?

I would recommend interviewing some of the recent kernel mentor project
and outreachy applicants first, to try to determine exactly what their
problems, if any, were with our development process.  If they say that
this type of tool/workflow would have saved them hours of time and
energy, then that's a great indication that we should try to do this.

thanks,

greg k-h
