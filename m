Return-Path: <SRS0=kvgU=YR=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F39CA9EAF
	for <workflows@archiver.kernel.org>; Thu, 24 Oct 2019 13:15:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9EFB82166E
	for <workflows@archiver.kernel.org>; Thu, 24 Oct 2019 13:15:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502357AbfJXNPo (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 24 Oct 2019 09:15:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:54898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502438AbfJXNPo (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 24 Oct 2019 09:15:44 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 231372084C;
        Thu, 24 Oct 2019 13:15:43 +0000 (UTC)
Date:   Thu, 24 Oct 2019 09:15:41 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191024091541.10af3417@gandalf.local.home>
In-Reply-To: <20191021153918.GE4947@pendragon.ideasonboard.com>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
        <20191011085702.GB1075470@kroah.com>
        <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
        <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
        <20191014205658.GG5564@mit.edu>
        <20191015083741.1d0731e5@gandalf.local.home>
        <20191015163704.GJ4875@pendragon.ideasonboard.com>
        <20191015124749.1a11926f@gandalf.local.home>
        <20191021153918.GE4947@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, 21 Oct 2019 18:39:18 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> > I plan on continuing to develop mostly in email (I still send my patch
> > series via quilt!). But I'm not going to enforce everyone to continue
> > to use email if we can come up with a better way. I also want to make
> > sure that whatever we do come up with will still support email.  
> 
> Hypothetically speaking, if there was a service that allowed sending a
> patch series through a git push with a tag containing a cover letter in
> its message, and that service would send out e-mails to mailing lists
> (with the option to self-host it if you want), would you consider using
> it ?

Only if I was forced to ;-)

Seriously, it's hard to teach an old dog new tricks. I wont change
until it becomes necessary to do so. As the old saying goes: "Don't fix
what ain't broke!"

I've developed a workflow over the past decade or so, that I've
optimized to fit my needs. Why would I want to change that? Unless
there's something that changes that can make an impact on my
efficiency. I've created a bunch of scripts that do exactly what I
expect them to. To change, I'm going back into the world of the unknown,
and will need to take up time (which I'm struggling to come up with),
to learn something new that may or may not make it better for me.

The tool I would like is simply something where all the patches I
receive are stored in a nice formatted database that I can process
offline somewhere (like when I'm flying to Europe).

Right now I hacked an old version of patchwork (when I upgraded,
everything broke, and I had to revert it), along with procmail, that
creates a local patchwork queue I can access locally. Unfortunately,
this doesn't work when I'm away from home without an internet
connection.

I would love to be able to take this database with me and process the
patches while traveling without connectivity.

-- Steve
