Return-Path: <SRS0=MafL=YF=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A9FC4360C
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 07:19:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8EF92087E
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 07:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570864789;
	bh=qYBLI1Okz4CcLAQuojXk1AUl8oFNRvt1z5poS5xebFs=;
	h=Date:From:To:Subject:References:In-Reply-To:List-ID:From;
	b=BfN0yLA0pUIyG7qUiTgYsGSNyYCZ6bOF/KAIQxEBwn/k+VP2KhhL3N9oZeOk/q8q2
	 kmE5vRBnE+GR+DnhkogXXBJtqTiVJycXjFS0bEpgAsfsBluyXk9+vWtkmOlUSH3hmZ
	 orWwWIWIjRYCIEu7lwg/HSqR4ulmy7H5PCtEf5qY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728624AbfJLHTt (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 12 Oct 2019 03:19:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:33564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726821AbfJLHTt (ORCPT <rfc822;workflows@vger.kernel.org>);
        Sat, 12 Oct 2019 03:19:49 -0400
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 63D85206CD;
        Sat, 12 Oct 2019 07:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570864788;
        bh=qYBLI1Okz4CcLAQuojXk1AUl8oFNRvt1z5poS5xebFs=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=1/cYCHRcHMiyXT8ev45IOUinufpjjOMrnklMD2QMAlbgS3VQ5sUGYOOYGdywSCDRC
         i/sVYWiNYWU9P0OwPjD7Edv9ceq2J71ZzX6vPs3Cya9Qn89QuVlnMSC5CQ0yE3vSkK
         EaY9/bNag6G5JydlxsmqQpvouybvoErhuemI7mCc=
Date:   Sat, 12 Oct 2019 09:19:11 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Eric Wong <e@80x24.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191012071911.GA2034802@kroah.com>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
 <20191011212308.xk7xcvfamwnkwovn@dcvr>
 <20191011213553.g3pleurh5uomumi7@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011213553.g3pleurh5uomumi7@chatter.i7.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 11, 2019 at 05:35:53PM -0400, Konstantin Ryabitsev wrote:
> On Fri, Oct 11, 2019 at 09:23:08PM +0000, Eric Wong wrote:
> > > (This is the same reason I generally disagree with Eric Wong about
> > > preserving SMTP as the primary transmission protocol -- I've heard lots of
> > > complaints both from kernel developers and especially from people trying to
> > > contribute to CAF about corporate policies actually making it impossible to
> > > submit patches -- and no, using a different mail server is not a possibility
> > > for them because it can be a firing offense under their IT AUP rules.)
> > 
> > I'm not opposed to a webmail interface tailored to kernel hacking
> > which does stuff like checkpatch.pl and get_maintainer.pl before
> > sending (similar to your patchwork proposal and
> > gitgadgetgadget).  That would get around security appliances
> > but SMTP would still be used in the background.
> > 
> > Or offer full-blown HTTPS webmail + IMAP + SMTP access like any
> > other webmail provider + checkpatch + get_maintainer helpers.
> 
> Well, this is the bit where I say that it may not be allowed by corporate
> rules. I see this all the time in CAF/Android world where companies
> *require* that all email goes through their SMTP server so that it can be
> properly logged (often for legal reasons). And it is often equally required
> that any code submissions come from person@corporate.com and not
> person@free-email-provider.com for License/CLA reasons, so setting up a
> webmail server is not a solution either.
> 
> This is basically why SMTP sucks in my view -- and it's worthless trying to
> pick fights with IT departments, because they are told to do so by lawyers.
> So, I want to take SMTP out of the equation:
> 
> 1. provide a way for someone to submit a patch using a web interface   (but
> still in a way that From: is their corporate ID)

If you do this, what happens when a maintainer/reviewer responds to that
patch and says "looks good, but can you change X and resend it?"

How will they get that message if it didn't go through their email
system?  How will they be able to respond to it?

> 2. use individual git feeds as a way to send out patches instead of   always
> being secondary to SMTP

Sending patches that way is one thing, the interaction based on those
patches is another.

Everyone needs to remember that only 1/3 of the patches submitted are
applied.  The "normal" path of development is at least a review/resend
cycle for submissions (2/3 of patches).  So that 2/3 can't be ignored as
the "new/drive-by submissions" are probably more in that category than
not.

thanks,

greg k-h
