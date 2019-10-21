Return-Path: <SRS0=C+WN=YO=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07376CA9EAF
	for <workflows@archiver.kernel.org>; Mon, 21 Oct 2019 15:39:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A163A20873
	for <workflows@archiver.kernel.org>; Mon, 21 Oct 2019 15:39:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DQCWdrox"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727607AbfJUPj0 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 21 Oct 2019 11:39:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42588 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbfJUPj0 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 21 Oct 2019 11:39:26 -0400
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net [93.2.121.143])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC96911C5;
        Mon, 21 Oct 2019 17:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571672363;
        bh=hDy6RaKToenT9uMZmosAkIct0BzvT5o3yAOnOzl+bj0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DQCWdroxkdPNkBaBhCO5xjYrME6ez/XYF/CcZkjkS6JN/ARSbxXbSgsRbPI58GZIq
         vy3C2G/F4OfJXdahLwfTidm9LM2wmf6xXJHnWf2o7btLn3Lp1HocOsixXaOJcUDmKK
         dwKFv0bGtaTg+mbndP3B3n3QS8cgPHbz+tuZegJ8=
Date:   Mon, 21 Oct 2019 18:39:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191021153918.GE4947@pendragon.ideasonboard.com>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <20191014205658.GG5564@mit.edu>
 <20191015083741.1d0731e5@gandalf.local.home>
 <20191015163704.GJ4875@pendragon.ideasonboard.com>
 <20191015124749.1a11926f@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191015124749.1a11926f@gandalf.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Steven,

On Tue, Oct 15, 2019 at 12:47:49PM -0400, Steven Rostedt wrote:
> On Tue, 15 Oct 2019 19:37:04 +0300 Laurent Pinchart wrote:
> 
> > But how far could we push this reasoning ? I've worked for a company
> > whose corporate policy was that all source code had to be stored in SVN,
> > not exception. I didn't reach the community to move kernel development
> > away from git. I've also worked with people whose corporate policy was
> > that they had to do Linux kernel development on Windows, without using
> > any virtual machine. There are all kind of crazy corporate policies, and
> > if we don't push the pain it inflicts on all of us back to the people
> > who enact those crazy policies, we'll always lose.
> 
> I understand your sentiment. But most of your examples are one-off
> "crazy corporate policies". The "sucky email server" and "you must use
> this sucky email server" is rather standard. Not saying that we don't
> want to pressure them to change, but I'm hearing from people (like Dave
> Miller), that new developers are moving away from email for
> development.

I think that's two different issues though, which certainly overlap (but
I'm not sure to what extent). I'm also not sure if we can say that new
developers are moving away from e-mail, or simply start development with
a different, non e-mail-based process. It makes a bit of a difference,
because some new developers may not have any issue with e-mail, they may
just not have considered it. This of course doesn't mean that nobody has
issues with e-mail, that nobody is moving away from e-mail, or that
nobody would have trouble moving to e-mail.

> I thought part of this thread was talking about having other ways
> besides email to submit a patch. Something that can help people
> correctly send a patch (at least their formatting) by making sure they
> fill out the proper fields and have a tool that helps them do so. I
> brought up the corporate email servers just as an example of having
> this help out there too.

I'm very biased here, but for me a CLI tool that asks me questions and
generates the patch series (or directly sends it) would be easier to
use than a web UI. That's because I would stay on the CLI that I'm
already using for git. This of course assumes a working git-send-email
configuration, which we all no is not a given. I thus wonder if it
wouldn't be better to have a CLI helper to create the patches, and
provide some sort of https-to-smtp service (possibly in the form of
pushing a tag with a message for instance). There are many options
possible to work around broken e-mail workflows, so instead of focussing
on a web UI because it was the first idea that was proposed, let's make
sure we consider other ones. And maybe we'll decide that a web UI is the
best option.

> I plan on continuing to develop mostly in email (I still send my patch
> series via quilt!). But I'm not going to enforce everyone to continue
> to use email if we can come up with a better way. I also want to make
> sure that whatever we do come up with will still support email.

Hypothetically speaking, if there was a service that allowed sending a
patch series through a git push with a tag containing a cover letter in
its message, and that service would send out e-mails to mailing lists
(with the option to self-host it if you want), would you consider using
it ?

-- 
Regards,

Laurent Pinchart
