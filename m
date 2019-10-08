Return-Path: <SRS0=dP5A=YB=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E23C4360C
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 17:17:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C95D21871
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 17:17:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbfJHRRd (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 8 Oct 2019 13:17:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:38252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725966AbfJHRRd (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 8 Oct 2019 13:17:33 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6486221721;
        Tue,  8 Oct 2019 17:17:32 +0000 (UTC)
Date:   Tue, 8 Oct 2019 13:17:30 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Don Zickus <dzickus@redhat.com>
Cc:     Daniel Axtens <dja@axtens.net>, David Miller <davem@davemloft.net>,
        sir@cmpwn.com, nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191008131730.4da4c9c5@gandalf.local.home>
In-Reply-To: <20191008164309.mddbouqmbqipx2sx@redhat.com>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
        <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
        <20191007.173329.2182256975398971437.davem@davemloft.net>
        <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
        <20191007211704.6b555bb1@oasis.local.home>
        <20191008164309.mddbouqmbqipx2sx@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, 8 Oct 2019 12:43:09 -0400
Don Zickus <dzickus@redhat.com> wrote:

> Thanks for the thoughts.  Your thoughts here and your bugzilla example make
> sense and ties into some of the work we are experimenting with, with a small
> group at Red Hat.  My only sticky point is the initial patch submission.
> Pushing to a forge like github, gerrit, or gitlab makes a ton of sense like
> you said above.  But what do we do with folks who still email patches
> initially (instead of the git-push)?
> 
> What should be the expectations there?  Leverage patchwork to create a 'git
> push'?  Reject the patchset?  Something else?  Curious.

I think we are not just talking about reusing patchwork (unless that
becomes the starting point). But let's use patchwork as a starting
point for my thoughts about this. One would email the mailing list, and
also Cc a "listener" (like patchwork). Note, the one thing I dislike
about patchwork is that it requires to read a list. I rather have it
just be something that gets Cc'd to trigger it.

Anyway, when this "listener" gets an email, it goes into the system.
Now the maintainer can get an email from this system, or read the
system directly from a web browser or whatever client they choose. They
reply to the system, and this goes to the original submitter via email
(with links to how to use the system directly). The submitter, can then
use the system to send a v2, and ever perhaps reply to it via email with
some key word that will tell the system it is v2, or a comment.

I think we need to standardize on keywords to trigger the system
properly, if we are to use email (its up to the email user to get those
keywords right), or they can go directly to the system interface (be it
a web browser, or whatever), and then they don't need to worry about
keywords as the system would handle that directly.

Does this make sense?

-- Steve
